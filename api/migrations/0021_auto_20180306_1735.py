# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2018-03-06 16:35
from __future__ import unicode_literals

import ckeditor_uploader.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0020_auto_20180107_1336'),
    ]

    operations = [
        migrations.AlterField(
            model_name='help',
            name='text',
            field=ckeditor_uploader.fields.RichTextUploadingField(),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='education',
            field=models.CharField(choices=[('1', 'základní vzdělání'), ('2', 'střední vzdělání'), ('3', 'Vysokoškolské vzdělání')], max_length=128),
        ),
    ]
