from django.urls import re_path
from organization.views import OrgList, AddUserAsk, OrgDetail, OrgCourse, OrgIntroduce,\
    OrgTeacher, AddFavView, TeacherList, TeacherDetail, AddTeacher
app_name = 'organization'

urlpatterns = [
    re_path(r'^org_list/$', OrgList.as_view(), name='orglist'),
    re_path(r'^add_ask/$', AddUserAsk.as_view(), name='addask'),
    re_path(r'^org_detail/(?P<org_id>\d+)/$', OrgDetail.as_view(), name='org_detail'),
    re_path(r'^org_course/(?P<org_id>\d+)/$', OrgCourse.as_view(), name='org_course'),
    re_path(r'^org_introduce/(?P<org_id>\d+)/$', OrgIntroduce.as_view(), name='org_introduce'),
    re_path(r'^org_teacher/(?P<org_id>\d+)/$', OrgTeacher.as_view(), name='org_teacher'),
    re_path(r'^teacher_list/$', TeacherList.as_view(), name='teacherlist'),
    re_path(r'^teacher_detail/(?P<teacher_id>\d+)/$', TeacherDetail.as_view(), name='teacherdetail'),
    # 用户收藏机构
    re_path(r'^add_fav/$', AddFavView.as_view(), name='add_fav'),
    re_path(r'^add_teacher/$', AddTeacher.as_view(), name='add_teacher'),

]
