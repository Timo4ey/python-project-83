lint:
	poetry run flake8 page_analyzer

install:
	poetry install

dev:
	poetry run flask --app page_analyzer:app run

PORT ?= 8000
start:
	poetry run gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer:app


dump:
	pg_dump -h localhost -U postgres -d database -t urls > database.sql
