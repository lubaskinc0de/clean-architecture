# Separate build image
FROM python:3.10.8-slim-buster as compile-image

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Final image
FROM python:3.10.8-slim-buster

COPY --from=compile-image /opt/venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

WORKDIR /app
ENV HOME=/app

RUN addgroup --system app && adduser --system --group app

COPY src/clean_architecture_app .
COPY .env .

RUN chown -R app:app $HOME

USER app