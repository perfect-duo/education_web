from django.urls import re_path
from . import views
app_name = 'users_urls'
urlpatterns = [
    re_path('^$', views.LoginIndexView.as_view(), name='login'),
    re_path('^logout/$', views.Outlogin.as_view(), name='logout'),
    re_path(r'^register/$', views.RegisterView.as_view(), name='register'),
    re_path(r'^email_sends/(?P<sendemail_id>[a-zA-Z0-9]+)/$', views.SendEmail.as_view(), name='send_email'),
    re_path(r'forget/$', views.ForgetEmailPassword.as_view(), name='forgetpwd'),
    re_path(r'^findpassword/(?P<findpassword>[a-zA-Z0-9]+)/$', views.FindPassword.as_view(), name='find_email'),
    re_path(r'^modifyPassword/$', views.ModifyPassword.as_view(), name='ModifyPassword')


]

