from django.shortcuts import render
from django.views.generic import View
from django.http import HttpResponse
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Q
from .models import CityDict, CourseOrg, Teacher
from .forms import UserAskForm
from operation.models import UserFavorite
# Create your views here.


class OrgList(View):

    def get(self, request):
        organizations = 'organizations'
        citys = CityDict.objects.all()
        # org_count = citys.count()
        category = request.GET.get('categ ory', 'all')
        city_id = request.GET.get('city', 'all')
        student_nums = request.GET.get('sort', 'all')
        # courseorgs = CourseOrg.objects.all()

        # 进行机构和城市的排序
        if city_id != 'all' and category == 'all':
            courseorgs = CourseOrg.objects.filter(city_id=int(city_id))
        elif city_id != 'all' and category != 'all':
            courseorgs = CourseOrg.objects.filter(city_id=int(city_id), category=category)
        elif city_id == 'all' and category != 'all':
            courseorgs = CourseOrg.objects.filter(category=category)

        else:
            courseorgs = CourseOrg.objects.all()

        # 全局搜索机构
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            courseorgs = courseorgs.filter(Q(name__icontains=search_keywords) | Q(desc_icontains=search_keywords))
        # 进行课程和学习人数的排序
        if student_nums != 'all':
            if student_nums == 'student':
                courseorgs = courseorgs.order_by('-students')
            elif student_nums == 'courses':
                courseorgs = courseorgs.order_by('-course_nums')
        else:
            courseorgs = courseorgs.order_by('-students')

        # 进行分页显示
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(courseorgs, 4, request=request)
        people = p.page(page)

        org_count = courseorgs.count()
        hot_orgs = courseorgs.order_by('-click')[:3]
        return render(request, 'org_templates/org-list.html', {
                                                                'citys': citys,
                                                                'org_count': org_count,
                                                                'people': people,
                                                                'city_id': city_id,
                                                                'category': category,
                                                                'hot_orgs': hot_orgs,
                                                                'student_nums': student_nums,
                                                                'organizations': organizations,
                                                                })


class AddUserAsk(View):

    def post(self, request):
        userask = UserAskForm(request.POST)
        if userask.is_valid():
            userask.save(commit=True)
            return HttpResponse('{"status": "success"}', content_type='application/json')
        else:
            return HttpResponse('{"status": "fail", "msg": "添加出错"}', content_type='application/json')


class OrgDetail(View):
    def get(self, request, org_id):
        current_page = 'org_detail'
        fav_status = False
        org = CourseOrg.objects.get(pk=int(org_id))
        all_course = org.course_set.all()[:3]
        all_teachers = org.teacher_set.all()[:3]
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=int(org_id), fav_type=2):
                fav_status = True
        return render(request, 'org_templates/org-detail-homepage.html', {'all_course': all_course,
                                                                          'all_teacher': all_teachers,
                                                                          'org': org,
                                                                          'org_id': org_id,
                                                                          'current_page': current_page,
                                                                          'fav_status': fav_status,
                                                                          })


class OrgCourse(View):
    def get(self, request, org_id):
        current_page = 'courses'
        fav_status = False
        org = CourseOrg.objects.get(pk=int(org_id))
        all_course = org.course_set.all()
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_course, 3, request=request)
        courses = p.page(page)
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=int(org_id), fav_type=2):
                fav_status = True

        return render(request, 'org_templates/org-detail-course.html', {'courses': courses,
                                                                        'org_id': org_id,
                                                                        'current_page': current_page,
                                                                        'org': org,
                                                                        'fav_status': fav_status,
                                                                        })


class OrgIntroduce(View):

    def get(self, request, org_id):
        current_page = 'introduce'
        fav_status = False
        introduce = CourseOrg.objects.get(pk=int(org_id))
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=int(org_id), fav_type=2):
                fav_status = True
        return render(request, 'org_templates/org-detail-desc.html', {'current_page': current_page,
                                                                      'org_introduce': introduce,
                                                                      'org_id': org_id,
                                                                      'fav_status': fav_status,
                                                                      })


class OrgTeacher(View):

    def get(self, request, org_id):
        current_page = 'teacher'
        fav_status = False
        org_teacher = CourseOrg.objects.get(pk=int(org_id))
        teachers = org_teacher.teacher_set.all()
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=int(org_id), fav_type=2):
                fav_status = True

        return render(request, 'org_templates/org-detail-teachers.html', {
                                                                          'org_teacher': org_teacher,
                                                                          'teachers': teachers,
                                                                          'current_page': current_page,
                                                                          'org_id': org_id,
                                                                          'fav_status': fav_status,
                                                                          })


class AddFavView(View):
    # def get(self, request):
    #     # 如果用户没有登陆，跳转到登陆界面进行登陆
    #     return render(request, 'user_template/login.html', {})
    '''
    用户收藏课程机构
    '''
    def post(self, request):

            # return render(request, 'user_template/login.html', {})
            fav_id = int(request.POST.get('fav_id', 0))
            fav_type = int(request.POST.get('fav_type', 0))
            if not request.user.is_authenticated:
                # return render(request, 'user_template/login.html', {})
                return HttpResponse('{"status": "fail", "msg": "用户未登录"}', content_type='application/json')
            else:
                courseorg_id = CourseOrg.objects.get(pk=fav_id)
                exist = UserFavorite.objects.filter(user=request.user, fav_id=fav_id, fav_type=fav_type)
                if exist:
                    exist.delete()
                    # 收藏数减少 1
                    courseorg_id.fav_nums -= 1
                    if courseorg_id.fav_nums < 0:
                        courseorg_id.fav_nums = 0
                    courseorg_id.save()
                    return HttpResponse('{"status": "success", "msg": "收藏"}', content_type='application/json')
                else:
                    if fav_id > 0 and fav_type > 0:
                        fav_exist = UserFavorite()
                        fav_exist.fav_id = fav_id
                        fav_exist.fav_type = fav_type
                        fav_exist.user = request.user
                        fav_exist.save()
                        # 收藏数加 1
                        courseorg_id.fav_nums += 1
                        courseorg_id.save()
                        return HttpResponse('{"status": "success", "msg": "已收藏"}', content_type='application/json')
                    else:
                        return HttpResponse('{"status": "fail", "msg": "收藏出错"}', content_type='application/json')


class TeacherList(View):
    def get(self, request):
        tl = 'tl'
        teachers = Teacher.objects.all()
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            teachers = teachers.filter(name__icontains=search_keywords)
        teacher_nums = teachers.count()
        sort = request.GET.get('sort', 'all')
        click_teacher = teachers.order_by('-click_nums')[:4]
        if sort == 'hot':
            teachers = teachers.order_by('-fav_nums')
            active = 'hot'
        else:
            active = 'all'

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(teachers, 3, request=request)
        teacher_list = p.page(page)

        return render(request, 'org_templates/teachers-list.html', {
                                                                    'tl': tl,
                                                                    'teacher_list': teacher_list,
                                                                    'active': active,
                                                                    'click_nums': click_teacher,
                                                                    'teachers_nums': teacher_nums,
        })


class TeacherDetail(View):
    def get(self, request, teacher_id):
        fav_teacher = False
        fav_org = False
        teacher_detail = Teacher.objects.get(pk=int(teacher_id))
        click_teacher = Teacher.objects.all().order_by('-click_nums')[:4]
        teacher_course = teacher_detail.course_set.all()
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=teacher_id, fav_type=3):
                fav_teacher = True
            if UserFavorite.objects.filter(user=request.user, fav_id=teacher_detail.org.id, fav_type=2):
                fav_org = True

        return render(request, 'org_templates/teacher-detail.html', {
                                                                    'teacher_detail': teacher_detail,
                                                                    'teacher_course': teacher_course,
                                                                    'click_teacher': click_teacher,
                                                                    'teacher_id': teacher_id,
                                                                    'fav_org': fav_org,
                                                                    'fav_teacher': fav_teacher,
        })


class AddTeacher(View):

    def post(self, request):
        fav_id = int(request.POST.get('fav_id', 0))
        fav_type = int(request.POST.get('fav_type', 0))
        exist_teacher = UserFavorite.objects.filter(user=request.user, fav_id=fav_id, fav_type=fav_type)

        if request.user.is_authenticated:
            if exist_teacher:
                exist_teacher.delete()
                if fav_type == 3:
                    teacher = Teacher.objects.get(pk=fav_id)
                    teacher.fav_nums -= 1
                    teacher.save()
                elif fav_type == 2:
                    org = CourseOrg.objects.get(pk=fav_id)
                    org.fav_nums -= 1
                    org.save()

                return HttpResponse('{"status": "success", "msg": "收藏"}', content_type='application/json')
            else:
                if fav_id > 0 and fav_type > 0:
                    save = UserFavorite()
                    save.user = request.user
                    save.fav_id = fav_id
                    save.fav_type = fav_type
                    save.save()
                    if fav_type == 3:
                        teacher = Teacher.objects.get(pk=fav_id)
                        teacher.fav_nums += 1
                        teacher.save()
                    elif fav_type == 2:
                        org = CourseOrg.objects.get(pk=fav_id)
                        org.fav_nums += 1
                        org.save()
                    return HttpResponse('{"status": "success", "msg": "已收藏"}', content_type='application/json')

                else:
                    return HttpResponse('{"status": "fail", "msg": "收藏出错"}', content_type='application/json')

        else:
            return HttpResponse('{"status": "fail", "msg": "用户未登录"}', content_type='application/json')