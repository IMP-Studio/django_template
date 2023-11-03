FROM python:3.12-bookworm as builder
WORKDIR /app
COPY . .
RUN python -m pip install poetry
RUN poetry install --no-dev
RUN poetry build
FROM python:3.12-bookworm as runner
WORKDIR /app
COPY --from=builder /app/dist/*whl .
RUN pip install *.whl
RUN rm *whl
COPY . .
CMD ["python", "app/manage.py", "runserver"]
