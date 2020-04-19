from django.db import models
from django.core.validators import MinValueValidator


class NetWorkSpeedModel(models.Model):
    """
    ネットワークスピードの測定結果モデル
    """
    class Meta:
        db_table = 'network_speed'

    def __repr__(self):
        return "{0}, up:{1:6.2f}Mbps, down:{2:6.2f}Mbps".format(self.date, self.upload_speed/(1024**2), self.download_speed/(1024**2))

    def __str__(self):
        return "{0}, up:{1:6.2f}Mbps, down:{2:6.2f}Mbps".format(self.date, self.upload_speed/(1024**2), self.download_speed/(1024**2))

    upload_speed = models.FloatField(verbose_name='upload_speed', validators=[MinValueValidator(0)])
    download_speed = models.FloatField(verbose_name='download_speed', validators=[MinValueValidator(0)])
    date = models.DateTimeField(verbose_name='date')
    description = models.TextField(verbose_name='description', max_length=256, blank=True, null=True)