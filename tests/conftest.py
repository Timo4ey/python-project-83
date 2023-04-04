import pytest
from page_analyzer import app as create_app


@pytest.fixture()
def application():
    app = create_app()
    app.config.update({
        "TESTING": True
    })
    yield app


@pytest.fixture()
def client(application):
    return application.test_client()


@pytest.fixture()
def runner(app):
    return app.test_cli_runner()
