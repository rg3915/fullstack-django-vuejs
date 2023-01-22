# fullstack-django-vuejs-2023

Teste de Django e VueJS no Docker.

## Este projeto foi feito com:

- [Python 3.10.6](https://www.python.org/)
- [Django 4.1.5](https://www.djangoproject.com/)
- [Django Rest Framework 3.14.0](https://www.django-rest-framework.org/)
- [VueJS 3.2.13](https://vuejs.org/)
- [Node 18](https://nodejs.org/en/)

## Como rodar o projeto?

- Clone esse repositório.
- Crie um virtualenv com Python 3.
- Ative o virtualenv.
- Instale as dependências.
- Rode as migrações.

```
git clone https://github.com/rg3915/fullstack-django-vuejs.git
cd fullstack-django-vuejs

python contrib/env_gen.py

docker-compose up --build -d
docker-compose run backend manage migrate
docker-compose run backend manage createsuperuser --username="admin" --email=""
```

## Links

https://v2.vuejs.org/v2/cookbook/dockerize-vuejs-app.html

https://dev.to/programmingdecoded/docker-configuration-with-nginx-routing-for-vue-and-laravel-49e9

https://stackoverflow.com/questions/72548750/docker-nginx-reverse-proxy-to-vue-vite-and-backend-containers-unexpected-result
