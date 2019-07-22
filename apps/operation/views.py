import json
from datetime import datetime
from django.shortcuts import render
from django.views.generic import View
from django.http import HttpResponse
from django.contrib.auth.hashers import make_password
from .forms import HeadImageForms, ModifyPwdFrom, UserForms
from users.models import User_wang, EmailVerifyRecord
from utils.send_email import SendEmailCode
from .models import UserCourse, UserFavorite, UserMessage
from courses.models import Course, CourseOrg, Teacher


class PersonalDate(View):

    def get(self, request):

        if request.user.is_authenticated:
            left_column = 'personal_date'
            current_date = request.user.birthday.strftime("%Y-%m-%d")
            return render(request, 'operation_templates/usercenter-info.html', {
                                                                                'current_date': current_date,
                                                                                'left_column': left_column,
            })
        else:
            return render(request, 'user_template/login.html', {})


class HeadImage(View):

    def post(self, request):

        image = HeadImageForms(request.POST, request.FILES)
        if image.is_valid():
                head_image = image.cleaned_data['image']
                request.user.image = head_image
                request.user.save()
        # 或者使用另外一种方法
        # image = HeadImageForms(request.POST, request.FILES, instance=request.user)
        # if image.is_valid():
        #     head_iamge = image.cleaned_data['image']
        #     head_iamge.save()


class ModifyPwd(View):
    def post(self, request):
        exist = ModifyPwdFrom(request.POST)
        if exist.is_valid():
            pwd1 = request.POST.get('password1', '')
            pwd2 = request.POST.get('password2', '')
            if pwd1 == pwd2:
                user = User_wang.objects.get(pk=request.user.id)
                user.password = make_password(pwd2)
                user.save()
                return HttpResponse('{"status": "success"}', content_type='application/json')
            else:
                return HttpResponse('{"status": "fail", "msg": "密码不一致"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(exist.errors), content_type='application/json')


class SendModifyEmail(View):
    ''''
    # 发送邮箱验证码
    '''
    def get(self, request):

        code = request.GET.get('email', '')
        email = User_wang.objects.filter(email=code)
        if email:
            return HttpResponse('{"status": "failure"}', content_type='application/json')
        else:
            SendEmailCode(code, 'update_email')
            return HttpResponse('{"status": "success"}', content_type='application/json')


class SuccessEmail(View):

    def post(self, request):

        email = request.POST.get('email', '')
        code = request.POST.get('code', '')
        email_code = EmailVerifyRecord.objects.filter(email=email, code=code, send_type='update_email')
        if email_code:
            request.user.email = email
            request.user.save()
            return HttpResponse('{"status": "success"}', content_type='application/json')
        else:
            return HttpResponse('{"status": "failure"}', content_type='application/json')


class UserInformationModify(View):
    def post(self, request):
        user_information = UserForms(request.POST, instance=request.user)
        if user_information.is_valid():
            user_information.save()
            return HttpResponse('{"status": "success"}', content_type='application/json')
        else:
            return HttpResponse('{"status": "failure", "msg": "保存出错！"}', content_type='application/json')


class UserCenterCourse(View):

    def get(self, request):
        if request.user.is_authenticated:
            left_column = 'course'
            user_course = UserCourse.objects.filter(user=request.user)

            return render(request, 'operation_templates/usercenter-mycourse.html', {
                                                                                    'user_course': user_course,
                                                                                    'left_column': left_column,
            })
        else:
            return render(request, 'user_template/login.html', {})


class UserCenterFav(View):
    def get(self, request, fav_type_id):
        if request.user.is_authenticated:
            left_column = 'user_fav'
            # 查询收藏课程
            if int(fav_type_id) == 1:
                user_fav = UserFavorite.objects.filter(user=request.user, fav_type=int(fav_type_id))
                course_list = []
                for list in user_fav:
                    user_fav_course = Course.objects.get(pk=list.fav_id)
                    course_list.append(user_fav_course)
                return render(request, 'operation_templates/usercenter-fav-course.html', {
                                                                                    'course_list': course_list,
                                                                                    'left_column': left_column,
                                                                                    'fav_type_id': fav_type_id,
                                                                                    })
            # 查询收藏机构
            elif int(fav_type_id) == 2:
                user_fav = UserFavorite.objects.filter(user=request.user, fav_type=int(fav_type_id))

                org_list = []
                for list in user_fav:
                    user_fav_org = CourseOrg.objects.get(pk=list.fav_id)
                    org_list.append(user_fav_org)

                return render(request, 'operation_templates/usercenter-fav-org.html', {
                                                                                    'org_list': org_list,
                                                                                    'left_column': left_column,
                                                                                    'fav_type_id': fav_type_id,
                                                                                    })
            # 查询收藏教师
            elif int(fav_type_id) == 3:
                user_fav = UserFavorite.objects.filter(user=request.user, fav_type=int(fav_type_id))

                teacher_list = []
                for list in user_fav:
                    user_fav_teacher = Teacher.objects.get(pk=list.fav_id)
                    teacher_list.append(user_fav_teacher)
                return render(request, 'operation_templates/usercenter-fav-teacher.html', {
                                                                                    'teacher_list': teacher_list,
                                                                                    'left_column': left_column,
                                                                                    'fav_type_id': fav_type_id,
                                                                                    })
        else:
            return render(request, 'user_template/login.html', {})


class DeleteFav(View):

    def post(self, request):
        fav_id = request.POST.get('fav_id', '')
        fav_type = request.POST.get('fav_type', '')
        exist = UserFavorite.objects.filter(user=request.user, fav_id=int(fav_id), fav_type=int(fav_type))
        if exist:
            exist.delete()
            if int(fav_type) == 1:
                course = Course.objects.get(pk=int(fav_id))
                course.fav_nums -= 1
                if course.fav_nums < 0:
                    course.fav_nums = 0
                course.save()
            elif int(fav_type) == 2:
                org = CourseOrg.objects.get(pk=int(fav_id))
                org.fav_nums -= 1
                if org.fav_nums < 0:
                    org.fav_nums = 0
                org.save()
            elif int(fav_type) == 3:
                teacher = Teacher.objects.get(pk=int(fav_id))
                teacher.fav_nums -= 1
                if teacher.fav_nums < 0:
                    teacher.fav_nums = 0
                teacher.save()
            return HttpResponse('{"status": "success"}', content_type='application/json')


class UserCenterMessage(View):
    def get(self, request):
        if request.user.is_authenticated:
            column_left = 'fav_message'

            all_message = UserMessage.objects.filter(user=request.user)
            for read in all_message:
                read.has_read = True
                read.save()
            return render(request, 'operation_templates/usercenter-message.html', {
                                                                                    'all_message': all_message,
                                                                                    'column_left': column_left,
            })
        else:
            return render(request, 'user_template/login.html', {})