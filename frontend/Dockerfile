# https://v2.vuejs.org/v2/cookbook/dockerize-vuejs-app.html
# build stage
FROM node:lts-alpine as build-stage

# install simple http server for serving static content
RUN npm install -g http-server

WORKDIR /app

COPY frontend/package*.json ./

RUN npm install

COPY frontend .

RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
