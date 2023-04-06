from flask import Flask
from flask_session import Session
from flask_bootstrap import Bootstrap4
from page_analyzer.config import DevConfig, ProdConfig
from page_analyzer.routes import main
from page_analyzer.models import db
from page_analyzer.routes import page_not_found


def create_app():
    created_app = Flask(__name__)
    created_app.register_error_handler(404, page_not_found)
    created_app.config.from_object(ProdConfig)
    Session(created_app)
    Bootstrap4(created_app)
    db.init_app(created_app)
    created_app.register_blueprint(main)
    return created_app


app = create_app()

if __name__ == "__main__":
    app.config.from_object(DevConfig)
    app.run()
