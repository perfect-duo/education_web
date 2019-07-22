import re
from django import forms
from operation.models import UserAsk


class UserAskForm(forms.ModelForm):
    class Meta:
        fields = ['name', 'mobile', 'course_name']
        model = UserAsk

    def clean_mobile(self):
        mobile = self.cleaned_data['mobile']

        regex_mobile = '^1[3|4|5|8][0-9]\d{8}$'
        p = re.compile(regex_mobile)
        if p.match(mobile):
            return mobile
        else:
            raise forms.ValidationError("手机号码格式错误", code='mobile_invalid')