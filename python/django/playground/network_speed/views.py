from django.shortcuts import render
from django.views import View


class DispView(View):
    """
    ネットワークのスピード測定結果を表示するビュー
    """

    context = {
        'title': 'network_speed',
    }

    def get(self, request, *args, **kwargs):
        return render(request, 'network_speed/disp.html', context=self.context)

    def post(self, request, *args, **kwargs):
        pass
