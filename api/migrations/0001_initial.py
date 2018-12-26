# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2017-08-19 18:46
from __future__ import unicode_literals

from django.conf import settings
import django.contrib.gis.db.models.fields
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Drought',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='Help',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('title', models.CharField(max_length=255)),
                ('description', models.TextField(max_length=2048)),
            ],
        ),
        migrations.CreateModel(
            name='HelpPictures',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255)),
                ('image', models.ImageField(upload_to='')),
                ('help', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Help')),
            ],
        ),
        migrations.CreateModel(
            name='Observation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField()),
                ('observation_time', models.TimeField()),
                ('observation_time_range', models.TimeField()),
                ('send_date', models.DateTimeField()),
                ('municipality', models.CharField(max_length=255)),
                ('location', django.contrib.gis.db.models.fields.PointField(srid=4326)),
                ('note', models.TextField(max_length=1024)),
            ],
        ),
        migrations.CreateModel(
            name='ObservationPhenomenon',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('drought', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Drought')),
                ('observation', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Observation')),
            ],
        ),
        migrations.CreateModel(
            name='Phenomenon',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('phenomenon', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=255)),
                ('last_name', models.CharField(max_length=255)),
                ('age', models.IntegerField()),
                ('education', models.CharField(choices=[('0', 'bez vzdělání'), ('1', 'neúplné základní vzdělání'), ('2', 'základní vzdělání'), ('3', 'střední vzdělání')], max_length=1)),
                ('education_field', models.CharField(default=None, max_length=255)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='observationphenomenon',
            name='phenomenon',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Phenomenon'),
        ),
        migrations.AddField(
            model_name='help',
            name='phenomenon',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Phenomenon'),
        ),
    ]