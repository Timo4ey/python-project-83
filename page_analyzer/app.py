from flask import Flask
from flask_session import Session
from flask_bootstrap import Bootstrap4
from page_analyzer.config import DevConfig, ProdConfig
from page_analyzer.routes import main
from page_analyzer.routes import page_not_found, internal_server_error


def create_app():
    created_app = Flask(__name__)

    created_app.register_error_handler(404, page_not_found)
    created_app.register_error_handler(500, internal_server_error)
    created_app.config.from_object(ProdConfig)
    created_app.register_blueprint(main)
    Session(created_app)
    Bootstrap4(created_app)
    return created_app


app = create_app()

if __name__ == "__main__":
    app.config.from_object(DevConfig)
    app.run()
