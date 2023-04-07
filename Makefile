lint:
	poetry run flake8 page_analyzer

install:
	poetry install

dev:
	poetry run flask --app page_analyzer:app run

PORT ?= 8000
start:
	poetry run gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer:app

check:
	poetry run pytest -v --disable-warnings .

dump:
	pg_dump -U postgres -h containers-us-west-74.railway.app -p 5452 -W -F t railway > database.sql
#	pg_dump -h localhost -U postgres -d database -t urls > database.sql
