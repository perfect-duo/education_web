from datetime import  datetime
from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here


class User_wang(AbstractUser):
    nick_name = models.CharField(max_length=50,verbose_name='用户昵称',default='')
    birthday = models.DateField(verbose_name='生日',default=datetime.now, null=True,blank=True)
    gender = models.CharField(max_length=6,choices=(('male','男'),('female','女')),default='female')
    address = models.CharField(max_length=50,default='')
    mobile = models.CharField(max_length=11,null=True,blank=True,default='')
    image = models.ImageField(upload_to='images/%Y/%m',default='images/to.png', null=True,blank=True)

    class Meta:
        verbose_name= '用户信息'
        verbose_name_plural =verbose_name

    def unread_message(self):
        from operation.models import UserMessage
        return UserMessage.objects.filter(user__id=self.id, has_read=False).count()

    def __unicode__(self):
        return self.username


class EmailVerifyRecord(models.Model):
    code = models.CharField(max_length=20,verbose_name='验证码')
    email = models.EmailField(max_length=50,verbose_name='邮箱')
    send_type = models.CharField(choices=(('register','注册'), ('forget','忘记密码'), ('update_email', '修改邮箱')), max_length=15)
    send_time = models.DateTimeField(default=datetime.now)

    class Meta:
        verbose_name = '邮箱验证码'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return '{0}({1})'.format(self.code, self.email)


class Banner(models.Model):  # 轮播图
    title = models.CharField(max_length=100,verbose_name='标题')
    image = models.ImageField(upload_to='banner/%Y/%m',verbose_name='轮播图')
    url = models.URLField(max_length=100,verbose_name='访问地址')
    index = models.IntegerField(default=100,verbose_name='顺序')
    add_time = models.DateTimeField(default=datetime.now,verbose_name='添加时间')

    class Meta:
        verbose_name = '轮播图'
        verbose_name_plural = verbose_name
