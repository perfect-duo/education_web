# Generated by Django 2.0.7 on 2018-08-13 04:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0004_auto_20180806_1718'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='lesson_type',
            field=models.CharField(default='后端开发', max_length=50, verbose_name='课程类别'),
        ),
    ]
