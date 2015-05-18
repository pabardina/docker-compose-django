FROM ubuntu:14.10

ENV PYTHONUNBUFFERED 1

WORKDIR /code

RUN apt-get update && apt-get upgrade -qq
RUN apt-get install -y build-essential git
RUN apt-get install -y python python-dev python-setuptools python-software-properties libpq-dev libxml2 gcc libxslt1-dev vim
RUN apt-get install -y supervisor
RUN apt-get install -y libgeos-dev && rm -rf /var/lib/apt/lists/*
RUN apt-get -y autoremove
RUN easy_install pip

RUN mkdir -p /var/log/supervisor /etc/supervisor/conf.d
ADD docker_config/supervisor.conf /etc/supervisor/conf.d/myconf.conf

ADD requirements.txt /code/requirements.txt

RUN pip install -r /code/requirements.txt
