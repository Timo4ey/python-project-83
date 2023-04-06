import pytest
from page_analyzer import app as create_app
from page_analyzer.models import db





@pytest.fixture()
def application():
    app = create_app
    db.init_app(app)
    yield app


@pytest.fixture()
def client(application):
    return application.test_client()


@pytest.fixture()
def runner(application):
    return application.test_cli_runner()
