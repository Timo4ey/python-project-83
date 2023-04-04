def test_home(client):
    response = client.get("/")
    assert 'Анализатор страниц' in str(response.data.decode('utf-8'))
