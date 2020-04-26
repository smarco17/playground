from django.urls import path, include
from rest_framework.routers import DefaultRouter
from api.views import NetWorkSpeedViewset

router = DefaultRouter()
router.register('network_speed', NetWorkSpeedViewset)

urlpatterns = [
    path('', include(router.urls)),
]