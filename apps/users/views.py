from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from .models import User_wang, EmailVerifyRecord, Banner
from .forms import LoginForm, RegisterFrom, ForgetPassword, FindPasswordForm
from utils.send_email import SendEmailCode
from operation.models import UserMessage
from courses.models import Course
from organization.models import CourseOrg


class CustomsBackends(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = User_wang.objects.get(Q(username=username)|Q(email=username))
            s = User_wang.groups.name
            print(s)
            if user.check_password(password):
                return user

        except Exception as e:
            return None


class LoginIndexView(View):

    def get(self, request):
        return render(request, 'user_template/login.html', {})

    def post(self, request):
        loginform = LoginForm(request.POST)
        if loginform.is_valid():
            user_name = request.POST.get('username', '')
            pass_word = request.POST.get('password', '')
            user = authenticate(username=user_name, password=pass_word)
            if user:
                if user.is_active == 1:
                    login(request, user)
                    # request.session.set_expiry(60)
                    return HttpResponseRedirect(reverse('index'))
                    # return render(request, 'index.html')
                else:
                    return render(request, 'user_template/login.html', {'error':'该用户尚未激活'})
            else:
                return render(request, 'user_template/login.html', {'error': "用户名或密码错误"})
        else:
            return render(request, 'user_template/login.html', {'loginform': loginform})


class Outlogin(View):
    def get(self, request):
        logout(request)
        return HttpResponseRedirect(reverse('index'))
        # return render(request, 'index.html')


class RegisterView(View):
    def get(self, request):
        register = RegisterFrom()
        return render(request, 'user_template/register.html', {'register': register})

    def post(self, request):

        register = RegisterFrom(request.POST)
        if register.is_valid():
            user_name = request.POST.get('email','')
            if User_wang.objects.filter(email=user_name):
                return render(request, 'user_template/register.html', {'register': register,'registered': '此邮箱已被注册'})
            else:
                pass_word = make_password(request.POST.get('password',''))
                # User_wang.objects.create(username=user_name, password=pass_word, email=user_name)
                user = User_wang()
                user.is_active = 0
                user.username = user_name
                user.password = pass_word
                user.email = user_name
                user.save()
                SendEmailCode(user_name, 'register')
                # 写入欢迎消息
                usermessage = UserMessage()
                usermessage.user = user
                usermessage.message = '欢迎加入我们的大家庭'
                usermessage.save()

                return render(request, 'user_template/login.html')
        else:
            return render(request, 'user_template/register.html', {'register': register})


class SendEmail(View):

    def get(self, request, sendemail_id):
        emails = EmailVerifyRecord.objects.filter(code=sendemail_id)
        if emails:
            for i in emails:
                email = i.email
                user_email = User_wang.objects.get(email=email)
                user_email.is_active = 1
                user_email.save()
                return render(request, 'user_template/login.html')
        else:
            return render(request, 'user_template/login.html', {'SendEmailError':'链接出错，激活失败'})


class ForgetEmailPassword(View):
    def get(self, request):
        forgetpwd = ForgetPassword()
        return render(request, 'user_template/forgetpwd.html', {'forgetcaptche': forgetpwd})

    def post(self, request):
        forgetpassword = ForgetPassword(request.POST)
        if forgetpassword.is_valid():
            email = request.POST.get('email', '')
            emails = User_wang.objects.filter(email=email)
            if emails:
                for e in emails:
                    SendEmailCode(e.email, 'forget')

                return render(request, 'user_template/login.html', {'forgetactivate':'邮件已发送到你的邮箱，请查收'})
            else:
                return render(request, 'user_template/forgetpwd.html', {'forgetcaptche':forgetpassword, 'emailerror':'邮箱错误'})
        else:
            return render(request, 'user_template/forgetpwd.html', {'forgetcaptche':forgetpassword})


class FindPassword(View):
    def get(self, request, findpassword):
        findpwd = ForgetPassword()
        emails = EmailVerifyRecord.objects.filter(code=findpassword)
        if emails:
            for e in emails:
                email = e.email
                return render(request, 'user_template/password_reset.html',{'email':email})
        else:

            return render(request, 'user_template/forgetpwd.html', {'forgetcaptche': findpwd, 'failure': '该验证码已失效'})


class ModifyPassword(View):
    def post(self, request):
        modifypwd = FindPasswordForm(request.POST)
        if modifypwd.is_valid():
            email = request.POST.get('email', '')
            password = request.POST.get('password', '')
            password1 = request.POST.get('password2', '')
            if password != password1:
                return render(request, 'user_template/password_reset.html', {'passworderror': '两次密码不一致'})
            else:
                emails = User_wang.objects.filter(email=email)
                if emails:
                    for e in emails:
                        e.password = make_password(password)
                        e.address = 'he'
                        e.save()
                    return render(request, 'user_template/login.html', {'ModifyPasswordSuccess': '修改密码成功！'})
                else:
                    return render(request, 'user_template/password_reset.html', {'linkerror':'链接失效'})
        else:
            return render(request, 'user_template/password_reset.html')


class Index(View):
    # 首页
    def get(self, request):
        banners = Banner.objects.all()
        course_banner = Course.objects.filter(is_banner=True)
        courses = Course.objects.all().order_by('learn_times')[:6]
        orgs = CourseOrg.objects.all().order_by('fav_nums')[:15]
        return render(request, 'index.html', {
                                            'orgs': orgs,
                                            'courses': courses,
                                            'banners': banners,
                                            'course_banner': course_banner,
        })


# def page_not_found(request):
#     # 全局404c错误
from django.shortcuts import render_to_response
#     response = render_to_response('404.html')
#     response.status_code = 404
#     return response
#
#
# def page_not_found1(request):
#     # 全局404c错误
#     from django.shortcuts import render_to_response
#     response = render_to_response('500.html')
#     response.status_code = 404
#     return response