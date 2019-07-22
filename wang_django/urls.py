"""wang_django URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import re_path
from django.urls import include
import xadmin
from django.views.generic import TemplateView
from django.views.static import serve
from wang_django.settings import MEDIA_ROOT# ,STATIC_ROOT
from users.views import Index
from django.conf.urls import handler404, handler500
urlpatterns = [
    re_path('xadmin/', xadmin.site.urls),
    re_path(r'^index/$', Index.as_view(), name='index'),
    re_path(r'^users/', include('users.urls')),
    re_path(r'^organization/', include('organization.urls')),
    re_path(r'^captcha/', include('captcha.urls')),
    re_path(r'^course/', include('courses.urls')),
    re_path(r'^usercenter/', include('operation.urls')),
    # 配置上传文件的路径， 让前端可以找到文件放在那里
    re_path(r'^images/(?P<path>.*)$', serve, {'document_root': MEDIA_ROOT}),
    # re_path(r'^static/(?P<path>.*)$', serve, {'document_root': STATIC_ROOT}),
    # 配置富文本编辑器
    re_path(r'^ueditor/', include('DjangoUeditor.urls')),
]



