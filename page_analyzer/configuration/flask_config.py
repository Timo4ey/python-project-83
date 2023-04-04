import os
from dotenv import load_dotenv


class Configuration:
    DEBUG = True
    TESTING = True
    SECRET_KEY = os.urandom(32)
    SESSION_TYPE = 'filesystem'
    SESSION_COOKIE_NAME = "cookie"


class Psqlconfig:
    load_dotenv()
    db_host = os.getenv('PGHOST')
    db_user = os.getenv('PGUSER')
    db_password = os.getenv('PGPASSWORD')
    db_name = os.getenv('PGDATABASE')
