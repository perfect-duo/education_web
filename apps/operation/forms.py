import re
from django import forms
from users.models import User_wang


class HeadImageForms(forms.ModelForm):

    class Meta:
        fields = ['image']
        model = User_wang


class ModifyPwdFrom(forms.Form):
    password1 = forms.CharField(required=True, min_length=6)
    password2 = forms.CharField(required=True, min_length=6)


# class ModifyPwdFrom(forms.ModelForm):
#
#     class Meta:
#         fields = ['password']
#         model = User_wang
#
#     def clean_password(self):
#         pwd1 = self.cleaned_data['password1']
#         pwd2 = self.cleaned_data['password2']
#
#         regix = '(?!^\\d+$)(?!^[a-zA-Z]+$)(?!^[_#@]+$).{6,}'
#         s = re.compile(regix)
#         if s.match(pwd1) and s.match(pwd2):
#             return pwd1, pwd2
#         else:
#             raise forms.ValidationError('密码过于简单', code='password_invalid')


class UserForms(forms.ModelForm):

    class Meta:
        fields = ['nick_name', 'birthday', 'gender', 'address', 'mobile', 'email']
        model = User_wang