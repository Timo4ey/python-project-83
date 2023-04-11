import psycopg2
from datetime import datetime
from dataclasses import dataclass, fields
from dotenv import load_dotenv
import os
from pathlib import Path

load_dotenv()

file = os.path.join(Path(__file__).parent.parent.parent, 'database.sql')


class BaseUrls:
    GET_ALL = """ SELECT * FROM {};"""
    GET_CERTAIN_URL = """SELECT * FROM {db_name} WHERE {id_name} = {id};"""

    def create_db(self):
        """Auxiliary function for creating database tables"""
        conn = psycopg2.connect(os.getenv('DATABASE_URL'))
        cursor = conn.cursor()
        with open(file, mode='r') as db_file:
            cursor.execute(db_file.read())
        conn.commit()
        conn.close()

    @staticmethod
    def db_connector(string: str):
        result = None
        conn = psycopg2.connect(os.getenv('DATABASE_URL'))
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

    def certain_url(self, dataframe: dataclass, db_name, id_name, id):
        url = self.db_connector(
              self.GET_CERTAIN_URL.format(db_name=db_name,
                                          id_name=id_name, id=id))
        return self.proper_data_format(dataframe, url)

    def raw_query(self, query):
        return self.db_connector(query)


class Urls(BaseUrls):
    CREATE_URL = """INSERT INTO urls (name, created_at)
VALUES ('{name}', '{date}');"""
    ROLLBACK_URL = """BEGIN; {last_commit} ROLLBACK;"""

    @dataclass
    class DataUrls:
        id: int
        name: str
        created_at: datetime

    def __init__(self):
        super().__init__()
        self.all_data = None
        self.last_req = None

    def get_all_data(self):
        self.all_data = self.execute_all(self.DataUrls, 'urls')
        return self.all_data

    def create_url(self, name):
        self.last_req = self.CREATE_URL.format(
                          name=name, date=datetime.now())
        self.db_connector(self.last_req)

    def get_certain_id(self, id):
        data = self.certain_url(self.DataUrls, 'urls', id_name='id', id=id)
        if data:
            return data[0]
        return False

    def rollback(self):
        self.db_connector(self.ROLLBACK_URL.format(last_commit=self.last_req))


class UrlChecks(BaseUrls):
    CREATE_URL = """INSERT INTO url_checks ({name})
                 VALUES ({values})"""

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
              self.DataChecks, db_name='url_checks', id_name='url_id', id=id)
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
        return query


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



b = BaseUrls()
b.create_db()
# b = UrlChecks()
# print()
# data = DataMix(*a)
# # print(data)
# b.create_check(data)

# db = "postgresql://postgres:Bedema99@localhost:5432/database"
# file = os.path.join(Path(__file__).parent.parent, 'database.sql')
# b = psycopg2.connect(db)
# print(b)
