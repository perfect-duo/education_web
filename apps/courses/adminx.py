import xadmin

from courses.models import Course, Lesson, Video, CourseResource, BannerCourse


class Le(object):
    model = Lesson
    extra = 1


class Li(object):
    model = CourseResource
    extra = 0


class CourseAdmin(object):
    list_display = ('name', 'desc', 'course_org', 'detail', 'degree', 'learn_times', 'students',
                    'fav_nums', 'image', 'is_banner', 'click_nums', 'add_time')
    search_fields = ('name', 'course_org', 'desc', 'detail', 'degree', 'learn_times', 'students',
                     'fav_nums', 'image', 'click_nums')
    list_filter = ('name', 'desc', 'course_org', 'detail', 'degree', 'learn_times', 'students',
                   'fav_nums', 'image', 'click_nums', 'add_time')
    inlines = [Le,Li]
    # refresh_times = (2, 5)
    style_fields = {'detail': 'ueditor'}

    def queryset(self):
        qs = super(CourseAdmin, self).queryset()
        qs = qs.filter(is_banner=False)
        return qs

    def save_models(self):
        # 计算课程机构的课程数
        super(CourseAdmin, self).save_models()

        obj = self.new_obj

        # obj.save()
        if obj.course_org is not None:
            course_org = obj.course_org
            course_org.course_nums = Course.objects.filter(course_org=course_org).count()
            course_org.save()


class BannerCourseAdmin(object):
    list_display = ('name', 'desc', 'course_org', 'detail', 'degree', 'learn_times', 'students',
                    'fav_nums', 'image', 'is_banner', 'click_nums', 'add_time')
    search_fields = ('name', 'desc', 'course_org', 'detail', 'degree', 'learn_times', 'students',
                     'fav_nums', 'image', 'click_nums')
    list_filter = ('name', 'desc', 'course_org', 'detail', 'degree', 'learn_times', 'students',
                   'fav_nums', 'image', 'click_nums', 'add_time')
    inlines = [Le,Li]

    def queryset(self):
        qs = super(BannerCourseAdmin, self).queryset()
        qs = qs.filter(is_banner=True)
        return qs


class LessonAdmin(object):
    list_display = ('course', 'name', 'add_time')
    search_fields = ('course__name', 'name')
    list_filter = ('course__name', 'name', 'add_time')


class VideoAdmin(object):
    list_display = ('lesson', 'name', 'add_time')
    search_fields = ('lesson__name', 'name')
    list_filter = ('lesson__name', 'name', 'add_time')


class CourseRecourseAdmin(object):
    list_display = ('course', 'name', 'download', 'add_time')
    search_fields = ('course__name', 'name', 'download')
    list_filter = ('course__name', 'name', 'download', 'add_time')


xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(BannerCourse, BannerCourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseRecourseAdmin)