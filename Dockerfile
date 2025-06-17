# syntax=docker/dockerfile:1.4
FROM python:3.12-slim AS deps
WORKDIR /app
COPY requirements.txt .
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

FROM python:3.12-slim AS runtime
WORKDIR /app
COPY --from=deps /usr/local/lib/python3.12 /usr/local/lib/python3.12
COPY . .
CMD ["python", "app/main.py"]
