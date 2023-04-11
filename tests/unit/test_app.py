import click
# from click.testing import
from time import time

def test_home(client):
    response = client.get("/")
    assert 'Анализатор страниц' in str(response.data.decode('utf-8'))
    assert response.status_code == 200


def test_url(client):
    response = client.get("/urls")
    assert 'Сайты' in str(response.data.decode('utf-8'))
    assert response.status_code == 200


def test_url_page(client):
    response = client.get("/urls/1")
    assert 'Сайт' in str(response.data.decode('utf-8'))
    assert response.status_code == 200


def test_url_page_not_extisting(client):
    response = client.get("/urls/105000")
    assert response.status_code == 404


#
def test_success_input(client):
    data = f'https://example{int(time())}.com'
    url = '/urls'
    response = client.post(url, data=dict(url=data))
    assert response.status_code == 200
    assert 'Страница успешно добавлена' in response.text
    assert data in response.text


def test_invalid_url(client):
    data = f'invalid.com'
    url = '/urls'
    response = client.post(url, data=dict(url=data))
    assert 'Некорректный URL' in response.text


def test_url_exists_already(client):
    data = 'https://ru.hexlet.io'
    url = '/urls'
    response = client.post(url, data=dict(url=data), follow_redirects=True)
    assert 'Страница уже существует' in response.text
