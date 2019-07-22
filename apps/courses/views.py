from django.shortcuts import render
from django.views.generic import View
from django.http import HttpResponse
from django.db.models import Count, Q
from .models import Course, Lesson, Video, CourseResource
from users.models import User_wang
from organization.models import CourseOrg, Teacher
from operation.models import UserFavorite, UserCourse, CourseComments
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
# Create your views here.


class CourseList(View):
    def get(self, request):
        current_courses = 'courses'

        course_sort = request.GET.get('sort', 'all')
        if course_sort == 'new':
            course_list = Course.objects.all().order_by('-add_time')
        elif course_sort == 'hot':
            course_list = Course.objects.all().order_by('-fav_nums')
        elif course_sort == 'student':
            course_list = Course.objects.all().order_by('-students')
        else:
            course_list = Course.objects.all()
        # 全局搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            course_list = course_list.filter(Q(name__icontains=search_keywords) | Q(desc__icontains=search_keywords)
                                             | Q(detail__icontains=search_keywords))

        recommends = Course.objects.all().order_by('-students')[:4]

        # 分页处理
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(course_list, 6, request=request)
        course_lists = p.page(page)
        return render(request, 'course_templates/course-list.html', {
                                                                    'course_sort': course_sort,
                                                                    'courses': current_courses,
                                                                    'course_lists': course_lists,
                                                                    'recommends': recommends,
                                                                    })


class CourseDetails(View):

    def get(self, request, course_id):
        course_detail = Course.objects.get(pk=int(course_id))
        course_lesson = course_detail.lesson_set.all().count()
        course_detail.click_nums += 1
        course_detail.save()
        fav_course_status = False
        fav_org_status = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(fav_id=course_id, fav_type=1):
                fav_course_status = True
            if UserFavorite.objects.filter(user=request.user,fav_id=course_detail.course_org.id, fav_type=2):
                fav_org_status = True

        return render(request, 'course_templates/course-detail.html', {
                                                                       'course_detail': course_detail,
                                                                        'fav_course_status': fav_course_status,
                                                                        'fav_org_status': fav_org_status,
                                                                        'course_id': course_id,
                                                                        'course_lesson': course_lesson,
                                                                      })


class FavCourse(View):

    def post(self, request):
        fav_id = int(request.POST.get('fav_id', 0))
        fav_type = int(request.POST.get('fav_type', 0))
        if request.user.is_authenticated:
            exist_fav = UserFavorite.objects.filter(user=request.user, fav_id=fav_id, fav_type=fav_type)
            course_fav = Course.objects.get(pk=fav_id)
            org_fav = CourseOrg.objects.get(pk=course_fav.course_org.id)
            if exist_fav:

                exist_fav.delete()
                if fav_type == 1:  # 课程收藏数 -1
                    course_fav = Course.objects.get(pk=fav_id)
                    course_fav.fav_nums -= 1
                    if course_fav.fav_nums < 0:
                        course_fav.fav_nums = 0
                    course_fav.save()
                elif fav_type == 2:  # 课程机构收藏数 -1
                    org_fav = CourseOrg.objects.get(pk=fav_id)
                    org_fav.fav_nums -= 1
                    if org_fav.fav_nums < 0:
                        org_fav.fav_nums = 0
                    org_fav.save()
                return HttpResponse('{"status": "success", "msg": "收藏"}', content_type='application/json')
            else:
                if fav_id > 0 and fav_type > 0:
                    # 课程收藏或课程机构收藏
                    fav = UserFavorite()
                    fav.user = request.user
                    fav.fav_id = fav_id
                    fav.fav_type = fav_type
                    fav.save()
                    if fav_type == 1: # 课程收藏数 +1
                        course_fav = Course.objects.get(pk=fav_id)
                        course_fav.fav_nums += 1
                        course_fav.save()
                    elif fav_type == 2: # 课程机构收藏数 +1
                        org_fav = CourseOrg.objects.get(pk=fav_id)
                        org_fav.fav_nums += 1
                        org_fav.save()
                    return HttpResponse('{"status": "success", "msg": "已收藏"}', content_type='application/json')
                else:
                    return HttpResponse('{"status": "fail", "msg": "收藏出错"}', content_type='application/json')
        else:
            return HttpResponse('{"status": "fail", "msg": "用户未登录"}', content_type='application/json')


class CourseVideo(View):
    def get(self, request, course_id):
        has_learned = ''

        course = Course.objects.get(pk=course_id)
        # course.image.
        if request.user.is_authenticated:
            courses = []
            studycourse =UserCourse.objects.filter(user=request.user, course=course)
            # has_learned = UserCourse.objecs.filter(user=request.user)
            # 对于学过本门课程的同学还学过其他的什么课程 查找出其他的学习人数高的课程
            user_id = [u.user.id for u in UserCourse.objects.filter(course=course)]
            has_learned = UserCourse.objects.filter(user_id__in=user_id).values_list('course_id').annotate(user_count=Count('user_id')).order_by('-user_count')[:2]
            for c in has_learned:
                courses.append(c[0])
            has_learned = Course.objects.filter(Q(id__in=courses), ~Q(id__in=course_id))
            if not studycourse:
                course.students += 1
                course.save()
                u = UserCourse()
                u.user = request.user
                u.course = course
                u.save()

        sessions = course.lesson_set.all()
        resources = CourseResource.objects.filter(course=course)

        # has_learned = UserCourse.objects.filter(user=request.user)
        return render(request, 'course_templates/course-video.html', {
                                                                      'course': course,
                                                                      'course_id': course_id,
                                                                      'sessions': sessions,
                                                                      'resources': resources,
                                                                      'has_learned': has_learned,
        })


class CourseComment(View):

    def get(self, request, course_id):
        has_learned = ''
        courses = []
        course = Course.objects.get(pk=course_id)
        if request.user.is_authenticated:

            # has_learned = UserCourse.objects.filter(user=request.user)
            studycourse = UserCourse.objects.filter(user=request.user, course=course)
            if not studycourse:
                course.students += 1
                course.save()
                u = UserCourse()
                u.user = request.user
                u.course = course
                u.save()
        course_comment = CourseComments.objects.filter(course=course)
        resources = CourseResource.objects.filter(course=course)
        # 对于学过本门课程的同学还学过其他的什么课程 查找出其他的学习人数高的课程
        user_id = [u.user.id for u in UserCourse.objects.filter(course=course)]
        has_learned = UserCourse.objects.filter(user_id__in=user_id).values_list('course_id')\
                          .annotate(user_count=Count('user_id')).order_by('-user_count')[:2]
        for c in has_learned:
            courses.append(c[0])
        has_learned = Course.objects.filter(Q(id__in=courses), ~Q(id__in=course_id))
        return render(request, 'course_templates/course-comment.html', {
                                                                    'course': course,
                                                                    'course_id': course_id,
                                                                    'course_comment': course_comment,
                                                                    'resources': resources,
                                                                    'has_learned': has_learned,
        })


class AddComment(View):
    def post(self, request):

        course_id = int(request.POST.get('course_id', 0))
        comment = request.POST.get('comments', '')
        if request.user.is_authenticated:
            if course_id > 0:
                course = Course.objects.get(pk=course_id)
                # write_comment = CourseComments.objects.filter(user=request.user, course=course)
                write_comment = CourseComments()
                write_comment.user = request.user
                write_comment.course = course
                write_comment.comments = comment
                write_comment.save()
                return HttpResponse('{"status": "success"}', content_type='application/json')
            else:
                return HttpResponse('{"status": "fail", "msg": "评论出错"}', content_type='application/json')
        else:
            return HttpResponse('{"status": "fail", "msg": "用户未登录"}', content_type='application/json')
