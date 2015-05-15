from __future__ import absolute_import
import os

from celery import Celery
from celery.signals import worker_process_init

from django.conf import settings
import django


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'exemple.settings')

app = Celery('exemple')
app.config_from_object('django.conf:settings')
app.autodiscover_tasks(lambda: settings.INSTALLED_APPS)

django.setup()

@worker_process_init.connect
def configure_workers(*args, **kwargs):
    django.setup()
