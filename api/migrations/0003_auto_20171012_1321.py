# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2017-10-12 13:21
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_auto_20171011_1930'),
    ]

    operations = [
        migrations.AddField(
            model_name='parameter',
            name='element',
            field=models.CharField(default='', max_length=255),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='dictionary',
            name='parameter',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='dictionaries', to='api.Parameter'),
        ),
        migrations.AlterField(
            model_name='help',
            name='phenomenon',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='help', to='api.Phenomenon'),
        ),
        migrations.AlterField(
            model_name='parameter',
            name='phenomenon',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='parameters', to='api.Phenomenon'),
        ),
        migrations.AlterField(
            model_name='phenomenon',
            name='category',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='category', to='api.Category'),
        ),
    ]
