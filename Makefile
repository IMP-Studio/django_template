init:
	poetry install

dev:
	poetry run python app/manage.py runserver

prod:
	cd app && poetry run granian --interface asgi app.asgi:application 

migrate:
	poetry run python app/manage.py migrate

collectstatic:
	poetry run python app/manage.py collectstatic

test-unit:
	cd app && poetry run python manage.py test

test-docs:
	cd app && poetry run interrogate -vvv

check:
	poetry run ruff check app

format:
	poetry run ruff format app
