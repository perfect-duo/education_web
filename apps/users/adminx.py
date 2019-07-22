import xadmin
from xadmin import views
# Register your models here.
from users.models import EmailVerifyRecord, Banner


class EmailVerifyRecordAdmin(object):

    list_display = ('code', 'email', 'send_type', 'send_time')
    search_fields = ('code', 'email', 'send_type')
    list_filter = ('code', 'email', 'send_type', 'send_time')
    ordering = ['-email']


class BannerAdmin(object):
    list_display = ('title', 'image', 'url', 'index', 'add_time')
    search_fields = ('title', 'image', 'url', 'index')
    list_filter = ('title', 'image', 'url', 'index', 'add_time')


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


class RefreshAdmin(object):
    refresh_times = (2, 5)


class ShowDetailsAdmin(object):
    show_all_rel_details = True


class GlobingSetting(object):

    site_title = '王的后台管理'
    site_footer = '技术支持@www.1449907540.com'
    menu_style = 'accordion'


xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)
xadmin.site.register(Banner, BannerAdmin)
xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobingSetting)
xadmin.site.register(views.ListAdminView, RefreshAdmin)