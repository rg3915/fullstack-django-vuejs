FROM python:3.10-slim

ENV PYTHONUNBUFFERED 1
ENV DJANGO_ENV dev
ENV DOCKER_CONTAINER 1
ENV SERVER_PORT 8000

RUN mkdir /app

WORKDIR /app

RUN apt update && \
  apt install nginx dumb-init -y && \
  apt clean

COPY requirements.txt .
RUN pip install -U pip && pip install -r requirements.txt

COPY . .
COPY docker/nginx/default.conf /etc/nginx/sites-enabled/default
COPY docker/docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/usr/bin/dumb-init",  "--", "/docker-entrypoint.sh"]
CMD ["server"]

# args
ARG APP_VERSION=unknown
ARG GIT_HASH=unknown
ARG BUILDER=unknown
ARG BUILD_NUMBER=unknown
ARG BUILD_DATE=unknown
ARG MODE=production

# Labels.
LABEL name="django-fullstak-api" \
  description="Django Fullstak API" \
  vcs.url="https://github.com/rg3915/fullstack-django-vuejs" \
  vcs.ref=$GIT_HASH \
  version=$APP_VERSION \
  mode=$MODE \
  build.date=$BUILD_DATE \
  build.number=$BUILD_NUMBER \
  build.builder=$BUILDER

# Environment
ENV GIT_HASH=$GIT_HASH \
  APP_VERSION=$APP_VERSION \
  BUILD_NUMBER=$BUILD_NUMBER \
  BUILD_DATE=$BUILD_DATE \
  MODE=$MODE
