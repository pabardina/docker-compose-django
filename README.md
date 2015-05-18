# docker-compose-django

Docker Compose with :

* Django
* Gunicorn
* Celery
* PostgreSQL
* Redis
* Nginx

### Start

Create a data container : `docker create -v /data --name data ubuntu:14.10 /bin/true`

Then start docker-compose : `docker-compose up -d`
