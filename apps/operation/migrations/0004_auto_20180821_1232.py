# Generated by Django 2.0.7 on 2018-08-21 12:32

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('operation', '0003_auto_20180813_1326'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usermessage',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='接收用户'),
        ),
    ]
