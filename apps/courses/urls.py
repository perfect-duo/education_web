from django.urls import re_path
from .views import CourseList, CourseDetails, FavCourse, CourseVideo, CourseComment, AddComment

app_name = 'course'
urlpatterns = [
    re_path(r'^course_list/$', CourseList.as_view(), name='list'),
    re_path(r'^course_detail/(?P<course_id>\d+)/$', CourseDetails.as_view(), name='detail'),
    # 收藏课程或课程机构
    re_path(r'^fav_course/$', FavCourse.as_view(), name='fav_course'),
    re_path(r'^course_video/(?P<course_id>\d+)/$', CourseVideo.as_view(), name='video'),
    re_path(r'^course_comment/(?P<course_id>\d+)/$', CourseComment.as_view(), name='comment'),

    # 对课程进行评论
    re_path(r'^course_add_comment/$', AddComment.as_view(), name='add_comment'),
]