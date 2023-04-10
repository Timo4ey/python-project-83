
# def test_home(client):
#     response = client.get("/")
#
#     assert 'Анализатор страниц' in str(response.data.decode('utf-8'))
#     assert response.status_code == 200
#
#
# def test_url(client):
#     response = client.get("/urls")
#     assert 'Сайты' in str(response.data.decode('utf-8'))
#     assert response.status_code == 200
#
#
# def test_url_page(client):
#     response = client.get("/urls/1")
#     assert 'Сайт' in str(response.data.decode('utf-8'))
#     assert response.status_code == 200
#
#
# def test_url_page_not_extisting(client):
#     response = client.get("/urls/105000")
#     assert response.status_code == 404
