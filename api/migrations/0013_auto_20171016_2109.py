# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2017-10-16 21:09
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0012_auto_20171016_1640'),
    ]

    operations = [
        migrations.AlterField(
            model_name='phenomenonparametervalue',
            name='image',
            field=models.ImageField(blank=True, max_length=255, upload_to='photos'),
        ),
    ]
