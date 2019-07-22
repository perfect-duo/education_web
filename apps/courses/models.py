from datetime import datetime
from DjangoUeditor.models import UEditorField
from django.db import models
from django.shortcuts import reverse
from organization.models import CourseOrg, Teacher
# Create your models here.


class Course(models.Model):
    course_org = models.ForeignKey(CourseOrg, verbose_name='课程机构', on_delete=models.CASCADE,null=True, blank=True)
    name = models.CharField(max_length=50, verbose_name='课程名')
    is_banner = models.BooleanField(default=False, verbose_name='是否轮播')
    teacher = models.ForeignKey(Teacher, verbose_name='讲师', null=True, blank=True, on_delete=models.CASCADE)
    desc = models.CharField(max_length=200, verbose_name='课程描述')
    detail = UEditorField(verbose_name='课程详情	', width=600, height=300, toolbars="full", imagePath="courseUEditor/image/",
                          filePath="courseUEditor/file/", upload_settings={"imageMaxSize":1204000}, default='')
    degree = models.CharField(choices=(('cj', '初级'), ('zj', '中级'), ('gj', '高级')),max_length=2)
    learn_times = models.IntegerField(default=0, verbose_name='学习时长')
    students = models.IntegerField(default=0,verbose_name='学习人数')
    fav_nums = models.IntegerField(default=0,verbose_name='收藏人数')
    image = models.ImageField(upload_to='courses/%Y/%m', verbose_name='封面图案', max_length=100, blank=True)
    click_nums = models.IntegerField(default=0,verbose_name='点击量')
    lesson_type = models.CharField(default='后端开发', verbose_name='课程类别', max_length=50)
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    # def get_lesson(self):
    #     # 课程章节
    #     return self.lesson_set.all()

    def get_courseuser(self):
        return self.usercourse_set.all()[:4]

    def get_absolute_url(self):
        return reverse("course:list")

    class Meta:

        verbose_name = '课程'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class BannerCourse(Course):
    class Meta:
        verbose_name = '轮播课程'
        verbose_name_plural = verbose_name
        proxy = True


class Lesson(models.Model):
    course = models.ForeignKey(Course, verbose_name='课程', on_delete=models.CASCADE)
    name = models.CharField(max_length=50, verbose_name='章节名')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '章节'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Video(models.Model):
    lesson = models.ForeignKey(Lesson,verbose_name='章节', on_delete=models.CASCADE)
    name = models.CharField(max_length=50, verbose_name='视频名')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '视频'
        verbose_name_plural = '视频s'

    def __str__(self):
        return self.name


class CourseResource(models.Model):
    course = models.ForeignKey(Course,verbose_name='课程', on_delete=models.CASCADE)
    name = models.CharField(max_length=50, verbose_name='资源名')
    download = models.FileField(upload_to='course/resource/%Y/%m',max_length=100, verbose_name='资源文件')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '课程资源'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
    