import celery
from datetime import timedelta
import logging

logging.basicConfig()
logger = logging.getLogger(__name__)

@celery.decorators.periodic_task(run_every=timedelta(seconds=20))
def test():
    logger.warning("test")
    print(2 + 2)
