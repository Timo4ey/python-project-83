import requests
from bs4 import BeautifulSoup


class GetRequest:
    def __init__(self, link, *args, **kwargs):
        self.data = self.get_data(link)

    @staticmethod
    def get_data(link):
        with requests.get(link) as data:
            return data

    def status_code(self):
        return self.data.status_code

    def get_url_text(self):
        return self.data.text


class DataBuilder(GetRequest):
    def __init__(self, link, *args, **kwargs):
        super().__init__(link, *args, **kwargs)
        self.bs = BeautifulSoup(self.get_url_text(), 'html.parser')
        self.title = None
        self.head_one = None
        self.description = None

    def __get_item(self, item) -> str:
        array = tuple(map(lambda x: x.get_text(), self.bs.select(item)))
        if array:
            return array[0]

    def get_title(self):
        self.head_one = self.__get_item('head title')
        return self.head_one

    def get_head_one(self):
        self.head_one = self.__get_item('h1')
        return self.head_one

    def get_description(self):
        data = self.bs.select("head meta[name='description']")
        if data:
            str_d = str(data).split('"')
            self.description = str_d[1]
            return self.description


if __name__ == '__main__':
    # https://www.crummy.com/
    # https://ru.hexlet.io/
    # https://scrapeops.io/
    g = DataBuilder("https://ru.hexlet.io/")
    print(g.status_code())
    print(g.get_head_one())
    print(g.get_title())
    print(g.get_description())
