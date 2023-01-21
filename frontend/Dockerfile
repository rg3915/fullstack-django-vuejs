# syntax=docker/dockerfile:1.2

FROM --platform=linux/x86_64 node:18-alpine as build-stage

WORKDIR /app
# Dependencies
COPY *.json *.js .browserslistrc ./

RUN npm ci

COPY . .

ENV NODE_OPTIONS=--max-old-space-size=32768

RUN npm run build

# NGINX
FROM nginx:1.23-alpine as nginx-stage

RUN apk add --no-cache dumb-init tree

# copy config
COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf

# copy from build
COPY --chown=nginx:nginx --from=build-stage /app/dist /etc/nginx/html
COPY --chown=nginx:nginx docker/nginx/html /etc/nginx/html

RUN ls -la /etc/nginx/html

COPY docker/docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/usr/bin/dumb-init",  "--", "/docker-entrypoint.sh"]

# args
ARG APP_VERSION=unknown
ARG GIT_HASH=unknown
ARG BUILDER=unknown
ARG BUILD_NUMBER=unknown
ARG BUILD_DATE=unknown
ARG MODE=production

# Labels.
LABEL name="django-fullstack-front" \
  description="Django Fullstac Front" \
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

EXPOSE 80

CMD ["http"]