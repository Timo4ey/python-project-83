import os
from dotenv import load_dotenv


class Psqlconfig:
    load_dotenv()
    url = os.getenv('DATABASE_URL')
    db_host = os.getenv('DB_HOST')
    db_user = os.getenv('DB_USER')
    db_password = os.getenv('DB_PASSWORD')
    db_name = os.getenv('DB_NAME')


class Configuration:
    url = Psqlconfig()
    DEBUG = False
    TESTING = False
    SECRET_KEY = os.urandom(32)
    SESSION_TYPE = 'filesystem'
    SESSION_COOKIE_NAME = "cookie"
    SQLALCHEMY_DATABASE_URI = url.url
    SQLALCHEMY_TRACK_MODIFICATIONS = False
