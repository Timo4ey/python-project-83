import psycopg2
from datetime import datetime
from page_analyzer.config import PsqlConfig
from dataclasses import dataclass, fields


class BaseUrls:
    GET_ALL = """SELECT * FROM {};"""
    GET_CERTAIN_URL = """SELECT * FROM {db_name} WHERE id = {id};"""

    @staticmethod
    def db_connector(string: str):
        result = None
        conn = psycopg2.connect(f"{PsqlConfig.DATABASE_URL}")
        conn.autocommit = True

        try:
            curs = conn.cursor()
            curs.execute(string)
            if string.find("SELECT") != -1:
                result = curs.fetchall()
        finally:
            conn.close()
            print("Connection closed")
        return result

    def proper_data_format(self, dataframe: dataclass, data):
        output = []
        for i in data:
            output.append(dataframe(*i))
        return output

    def execute_all(self, dataframe: dataclass, table_name):
        all_urls = self.db_connector(self.GET_ALL.format(table_name))
        return self.proper_data_format(dataframe, all_urls)

    def certain_url(self, dataframe: dataclass, db_name, id):
        url = self.db_connector(
              self.GET_CERTAIN_URL.format(db_name=db_name, id=id))
        return self.proper_data_format(dataframe, url)

    def raw_query(self, query):
        return self.db_connector(query)


class Urls(BaseUrls):
    CREATE_URL = """INSERT INTO urls (name, created_at)
VALUES ('{name}', '{date}')"""

    @dataclass
    class DataUrls:
        id: int
        name: str
        created_at: datetime

    def __init__(self):
        super().__init__()
        self.all_data = None

    def get_all_data(self):
        self.all_data = self.execute_all(self.DataUrls, 'urls')
        return self.all_data

    def create_url(self, name):
        self.db_connector(self.CREATE_URL.format(
                          name=name, date=datetime.now()))

    def get_certain_id(self, id):
        data = self.certain_url(self.DataUrls, 'urls', id=id)
        if data:
            return data[0]
        return False


class UrlChecks(BaseUrls):
    GET_ALL_URL = """SELECT * FROM url_checks;"""
    CREATE_URL = """INSERT INTO url_checks ({name})
                 VALUES ({values})"""
    GET_CERTAIN_URL = """SELECT * FROM url_checks WHERE id = {id};"""

    @dataclass
    class DataChecks:
        id: int
        url_id: int
        status_code: int
        h1: str
        title: str
        description: str
        created_at: datetime

    def __init__(self):
        super().__init__()
        self.all_data = None

    def certain_url(self, id):
        url = super().certain_url(
              self.DataChecks, db_name='url_checks', id=id)
        return url

    def get_all_data(self):
        self.all_data = self.execute_all(self.DataChecks, 'url_checks')
        return self.all_data

    def create_check(self, query: dataclass):
        headers = ', '.join([x.name for x in fields(query)])
        val = ", ".join([str(query.url_id),
                         f'\'{str(query.status_code)}\'',
                         f"\'{str(query.h1)}\'",
                         f'\'{str(query.title)}\'',
                         f'\'{str(query.description)}\'',
                         f"\'{str(query.created_at)}\'"]
                        )
        self.db_connector(self.CREATE_URL.format(
                          name=headers, values=val))


class MergeData(Urls, UrlChecks):
    def __init__(self):
        super().__init__()
        self.url = None
        self.checks = None
        self.merge = None
    query = """
    SELECT urls.id, max(url_checks.id), urls.name,
    max(url_checks.created_at) as max_date, url_checks.status_code
    FROM urls
    LEFT JOIN url_checks
    ON urls.id = url_checks.url_id
    GROUP BY  urls.id,  urls.name,
    url_checks.status_code
    ORDER BY urls.id DESC; """

    @dataclass
    class MergeData:
        id: int
        url_id: int
        name: str
        created_at: datetime
        status_code: int

    def get_merge(self):
        self.merge = self.proper_data_format(self.MergeData, self.raw_query(
                                             self.query))
        return self.merge


@dataclass()
class DataMix:
    url_id: int
    status_code: int
    title: str
    h1: str
    description: str
    created_at: datetime = datetime.now()

# b = UrlChecks()
# print()
# data = DataMix(*a)
# # print(data)
# b.create_check(data)
