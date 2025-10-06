FROM python:3.12-slim-bookworm

LABEL vendor=neon.ai \
    ai.neon.name="pyklatchat-client"

ENV OVOS_CONFIG_BASE_FOLDER=neon
ENV OVOS_CONFIG_FILENAME=klat.yaml
ENV XDG_CONFIG_HOME=/config
ENV KLAT_ENV=PROD

RUN apt-get update \
    && apt-get install -y \
    && apt-get install build-essential -y \
    && pip install --upgrade pip  \
    && pip install wheel

COPY . /app/

WORKDIR /app

RUN pip install /app

CMD ["pyklatchat-client"]
