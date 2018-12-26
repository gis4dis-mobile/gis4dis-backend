# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2017-10-14 15:38
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0005_auto_20171013_1738'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='metadataobservation',
            name='values',
        ),
        migrations.AddField(
            model_name='metadataobservation',
            name='values',
            field=models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='api.PhenomenonParameterValue'),
            preserve_default=False,
        ),
    ]
