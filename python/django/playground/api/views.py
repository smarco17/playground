from django.shortcuts import render
from rest_framework import viewsets
from network_speed.models import NetWorkSpeedModel
from network_speed.serializer import NetWorkSpeedSerializer


class NetWorkSpeedViewset(viewsets.ModelViewSet):
    queryset = NetWorkSpeedModel.objects.all()
    serializer_class = NetWorkSpeedSerializer
