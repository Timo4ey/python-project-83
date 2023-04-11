import os


# class PsqlConfig:
#     os.path.dirname(__file__)
#     with open(os.path.dirname(__file__)+'/key', 'r') as f:
#         DATABASE_KEY = f.read()
#     load_dotenv()
#     url = os.getenv('DATABASE_URL')
#     db_host = os.getenv('DB_HOST')
#     db_user = os.getenv('DB_USER')
#     db_password = os.getenv('DB_PASSWORD')
#     db_name = os.getenv('DB_NAME')
#     DATABASE_URL = os.getenv('DATABASE_URL')
#     db_port = os.getenv('DB_PORT')


class Config:
    SECRET_KEY = os.urandom(32)
    # SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL')
    # SQLALCHEMY_BINDS = {'database': os.getenv('DATABASE_URL')}
    # SQLALCHEMY_TRACK_MODIFICATIONS = False


class ProdConfig(Config):
    FLASK_ENV = 'production'
    DEBUG = False
    TESTING = False


class DevConfig(Config):
    FLASK_ENV = 'development'
    DEBUG = True
    TESTING = True
