from django.urls import path
from network_speed.views import DispView

app_name='network_speed'
urlpatterns = [
    path('', DispView.as_view(), name='disp')
]