import os
from dotenv import load_dotenv


class PsqlConfig:
    load_dotenv()
    url = os.getenv('DATABASE_URL')
    db_host = os.getenv('DB_HOST')
    db_user = os.getenv('DB_USER')
    db_password = os.getenv('DB_PASSWORD')
    db_name = os.getenv('DB_NAME')
    DATABASE_URL = os.getenv('DATABASE_URL')


class Config:
    SESSION_COOKIE_SECURE = True
    SECRET_KEY = os.urandom(32)
    SESSION_TYPE = 'filesystem'
    SESSION_COOKIE_NAME = 'session'
    TEMPLATES_FOLDER = 'templates'
    STATIC_FOLDER = 'static'
    SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL')
    SQLALCHEMY_BINDS = {'database': os.getenv('DATABASE_URL')}
    SQLALCHEMY_TRACK_MODIFICATIONS = False


class ProdConfig(Config):
    FLASK_ENV = 'production'
    DEBUG = False
    TESTING = False


class DevConfig(Config):
    FLASK_ENV = 'development'
    DEBUG = True
    TESTING = True
