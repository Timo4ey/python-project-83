import pytest
from page_analyzer import app as create_app
from page_analyzer.config import PsqlConfig


@pytest.fixture()
def application():
    app = create_app
    app.config.setdefault("SQLALCHEMY_DATABASE_URI", PsqlConfig.DATABASE_URL)
    app.config.setdefault("SQLALCHEMY_BINDS", None)
    yield app


@pytest.fixture()
def client(application):
    return application.test_client()


@pytest.fixture()
def runner(application):
    return application.test_cli_runner()
