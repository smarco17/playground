from django.core.management.base import BaseCommand
from django.utils import timezone
from network_speed.models import NetWorkSpeedModel
from network_speed.script.speed_test import get_upload_speed, get_download_speed

class Command(BaseCommand):
    """
    ネットワークのスピードを測定し、データベースに反映するコマンド
    """

    def add_arguments(self, parser):
        parser.add_argument('argument')

    def handle(self, *args, **options):
        arg = options['argument']
        nwsm = NetWorkSpeedModel(upload_speed=get_upload_speed(0), download_speed=get_download_speed(0), date=timezone.datetime.now(), description=arg)
        nwsm.save()
