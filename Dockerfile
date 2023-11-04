FROM python:3.12-slim-bookworm as base
RUN python -m pip install poetry
FROM base as dependency
WORKDIR /app
COPY pyproject.toml pyproject.toml
COPY poetry.lock poetry.lock
RUN poetry install --no-dev
FROM dependency as builder
WORKDIR /app
COPY . .
RUN poetry build
FROM python:3.12-alpine as runner
WORKDIR /app
COPY --from=builder /app/dist/*whl .
RUN pip install *.whl
RUN rm *whl
COPY . .
CMD ["python", "app/manage.py", "runserver"]
