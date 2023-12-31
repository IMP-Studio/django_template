FROM python:3.12-slim-bookworm AS base
RUN python -m pip install poetry==1.6.1 --no-cache-dir
FROM base AS dependency
WORKDIR /app
COPY pyproject.toml pyproject.toml
COPY poetry.lock poetry.lock
RUN poetry install --only main --no-root
FROM dependency AS builder
WORKDIR /app
COPY app app
COPY README.md README.md
RUN poetry build
FROM python:3.12-alpine AS runner
RUN addgroup -S nonroot \
  && adduser -S nonroot -G nonroot
USER nonroot
WORKDIR /app
COPY --from=builder /app/dist/*whl .
RUN pip install /app/*.whl --no-cache-dir --prefer-binary
RUN pip cache purge && rm /app/*whl
WORKDIR /home/nonroot/.local/lib/python3.12/site-packages/app/
EXPOSE 8000
ENV DEBUG=False
CMD ["python", "-m", "granian", "--host", "0.0.0.0", "--interface", "asgi", "app.asgi:application"]
