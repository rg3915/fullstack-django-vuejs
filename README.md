# fullstack-django-vuejs-2023

Teste de Django e VueJS no Docker.

## Este projeto foi feito com:

* [Python 3.10.4](https://www.python.org/)
* [Django 4.1.5](https://www.djangoproject.com/)
* [Django Rest Framework 3.14.0](https://www.django-rest-framework.org/)
* [VueJS 3.2.13](https://vuejs.org/)

## Como rodar o projeto?

* Clone esse repositório.
* Crie um virtualenv com Python 3.
* Ative o virtualenv.
* Instale as dependências.
* Rode as migrações.

```
git clone https://github.com/rg3915/fullstack-django-vuejs-2023.git
cd fullstack-django-vuejs-2023

python contrib/env_gen.py

docker-compose up -d

docker container exec -it \
lorem_app \
python manage.py migrate

docker container exec -it \
lorem_app \
python manage.py createsuperuser --username="admin" --email=""
```
