from random import randint, random
from django.core.mail import send_mail
from users.models import EmailVerifyRecord
from wang_django.settings import EMAIL_FROM


def create_char(length=8):
    string = ''
    chars = "QWRETYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890"
    long = len(chars)-1
    for i in range(length):
        string += chars[randint(0, long)]

    return string


def SendEmailCode(email, send_type='register'):

    email_sends_code = ''
    email_sends = EmailVerifyRecord()
    if send_type == 'update_email':
        for i in range(5):
            email_sends_code = email_sends_code + chr(randint(65, 90))
        email_sends.code = email_sends_code
    else:
        email_sends.code = create_char()

    email_sends.email = email
    email_sends.send_type = send_type
    email_sends.save()

    send_title = ''
    send_content = ''
    if send_type == 'update_email':
        send_title = '官网邮箱更改'
        send_content = '验证码：{0}'.format(email_sends.code)
        send_mail(send_title, send_content, EMAIL_FROM, [email])
    elif send_type == 'register':
        send_title = '官网注册激活链接'
        send_content = '请点击下面的链接进行激活，如果没有激活，将无法进行登陆 http://127.0.0.1:8000/users/email_sends/{0}'.format(email_sends.code)
        send_mail(send_title, send_content, EMAIL_FROM, [email])

    elif send_type == 'forget':
        send_title = '官网找回密码激活链接'
        send_content = '请点击下面的链接进行激活，如果没有激活，将无法进行密码重置 http://127.0.0.1:8000/users/findpassword/{0}'.format(email_sends.code)
        send_mail(send_title, send_content, EMAIL_FROM, [email])
