init:
	poetry install

dev:
	poetry run python app/manage.py runserver

prod:
	cd app && poetry run granian --interface asgi app.asgi:application 

migrate:
	poetry run python app/manage.py migrate

test:
	cd app && poetry run python manage.py test

check:
	poetry run ruff check app

format:
	poetry run ruff format app
