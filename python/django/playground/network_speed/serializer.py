from rest_framework import serializers
from network_speed.models import NetWorkSpeedModel

class NetWorkSpeedSerializer(serializers.ModelSerializer):
    class Meta:
        model = NetWorkSpeedModel
        fields = ('upload_speed', 'download_speed', 'date', 'description')