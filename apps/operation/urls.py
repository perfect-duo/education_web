from django.urls import re_path
from .views import PersonalDate, HeadImage, ModifyPwd, SendModifyEmail, SuccessEmail,\
    UserInformationModify, UserCenterCourse, UserCenterFav, DeleteFav, UserCenterMessage


app_name = 'userdate'
urlpatterns = [
    # 用户个人资料
    re_path(r'^date/$', PersonalDate.as_view(), name='self_date'),
    re_path(r'^image/$', HeadImage.as_view(), name='self_image'),
    re_path(r'^modify_pwd/$', ModifyPwd.as_view(), name='modify_pwd'),
    re_path(r'^modify_email/$', SendModifyEmail.as_view(), name='modify_email'),
    re_path(r'^modify_button/$', SuccessEmail.as_view(), name='modify_button'),
    re_path(r'^userinfo_save/$', UserInformationModify.as_view(), name='modify_info'),
    # 用户课程
    re_path(r'^user_course/$', UserCenterCourse.as_view(), name='user_course'),
    # 用户收藏
    re_path(r'^user_fav/(?P<fav_type_id>\d+)/$', UserCenterFav.as_view(), name='user_fav'),
    re_path(r'^delete_fav/$', DeleteFav.as_view(), name='delete_fav'),
    # 用户消息
    re_path(r'^user_message/$', UserCenterMessage.as_view(), name='user_message'),
]