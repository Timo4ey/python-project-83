import requests
from requests import ConnectTimeout
from bs4 import BeautifulSoup
from dataclasses import dataclass
from datetime import datetime


class GetRequest:
    def __init__(self, link, *args, **kwargs):
        self.req = self.get_data(link)
        self.data = ''
        if self.req != 404:
            self.data = self.get_data(link)
        self.s_code = 0
        if self.req == 402:
            self.s_code = 402
        else:
            self.s_code = self.req.status_code

    @dataclass()
    class DataMix:
        url_id: int
        status_code: int
        title: str
        h1: str
        description: str
        created_at: datetime = datetime.now()

    @staticmethod
    def get_data(link):
        try:
            with requests.get(link, timeout=10) as data:
                return data
        except ConnectTimeout as _ex:
            print(_ex)
        return 402

    def status_code(self):
        if self.data != 402:
            return self.data.status_code
        return 402

    def get_url_text(self):
        if self.data != 402:
            return self.data.text


class DataBuilder(GetRequest):
    def __init__(self, link, id, *args, **kwargs):
        super().__init__(link, *args, **kwargs)
        self.id = id
        self.bs = ''
        self.req = self.get_url_text()
        if self.req is not None:
            self.bs = BeautifulSoup(self.req, 'html.parser')
        self.title = None
        self.h1 = None
        self.description = None

    def __get_item(self, item) -> str:
        array = tuple(map(lambda x: x.get_text(), self.bs.select(item)))
        if array:
            return array[0]

    def get_title(self):
        self.title = self.__get_item('head title')
        if type(self.title) == str:
            self.title.replace("'", "''")
        return self.title.replace("'", "''")

    def get_h1(self):
        self.h1 = self.__get_item('h1')
        if type(self.h1) == str:
            self.h1.replace("'", "''")
        return self.h1

    def get_description(self):
        data = self.bs.select("head meta[name='description']")
        if data:
            str_d = str(data).split('"')
            self.description = str_d[1]
            return self.description.replace("'", "''")

    def get_all_data(self):
        return self.DataMix(self.id, self.status_code(),
                            self.get_h1(), self.get_title(),
                            self.get_description())


if __name__ == '__main__':
    # https://www.crummy.com/
    # https://ru.hexlet.io/
    # https://scrapeops.io/
    # http://test.com
    g = DataBuilder("https://scrapeops.io", 1)
    print(g.req)

    # s = g.get_all_data()
    # i = ','.join([x for x in s.__dataclass_fields__])
    # print(i)
    # # print(g.status_code())
    # print(g.get_head_one())
    # print(g.get_title())
    # print(g.get_description())
