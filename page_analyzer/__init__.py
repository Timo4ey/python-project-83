from flask import Flask
from flask_session import Session
from flask_bootstrap import Bootstrap4
from .configuration import Config
from .routes import main


def app():
    created_app = Flask(__name__)
    created_app.config.from_object(Config)
    Session(created_app)
    Bootstrap4(created_app)
    created_app.register_blueprint(main)
    return created_app
