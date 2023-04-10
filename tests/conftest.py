import pytest
from page_analyzer import app as create_app


@pytest.fixture(scope='function')
def application():
    app = create_app
    yield app


@pytest.fixture(scope='function')
def client(application):
    return application.test_client()


@pytest.fixture(scope='function')
def runner(application):
    return application.test_cli_runner()
