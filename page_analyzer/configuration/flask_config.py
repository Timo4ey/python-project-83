import os
from dotenv import load_dotenv


class Configuration:
    DEBUG = False
    SECRET_KEY = os.urandom(32)
    SESSION_TYPE = 'filesystem'


class Psqlconfig:
    load_dotenv()
    db_host = os.getenv('PGHOST')
    db_user = os.getenv('PGUSER')
    db_password = os.getenv('PGPASSWORD')
    db_name = os.getenv('PGDATABASE')
