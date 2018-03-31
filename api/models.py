from django.db import models
from django.contrib.gis.db import models as gismodels
from django.contrib.postgres.fields import JSONField
from django.contrib.auth.models import User
from ckeditor_uploader.fields import RichTextUploadingField


class Category(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name


class Phenomenon(models.Model):
    name = models.CharField(max_length=255)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='category')

    def __str__(self):
        return self.name


class Parameter(models.Model):
    name = models.CharField(max_length=255)
    phenomenon = models.ForeignKey(Phenomenon, on_delete=models.CASCADE, related_name='parameters')
    type = models.CharField(max_length=255)
    element = models.CharField(max_length=255)

    def __str__(self):
        return self.name


class PhenomenonParameterValue(models.Model):
    phenomenon = models.ForeignKey(Phenomenon, on_delete=models.CASCADE)
    parameter = models.ForeignKey(Parameter, on_delete=models.CASCADE)
    value = models.CharField(max_length=255)

    def __str__(self):
        return self.value


class PhenomenonPhoto(models.Model):
    owner = models.ForeignKey(User, on_delete=models.CASCADE)
    parameter = models.ForeignKey(PhenomenonParameterValue, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='photos', max_length=255, blank=True)


class MetadataObservation(models.Model):
    date = models.DateField(blank=True, null=True)
    observation_time = models.TimeField(blank=True, null=True)
    send_date = models.DateTimeField(auto_now_add=True)
    geometry = gismodels.PointField(srid=4326, blank=True, null=True)
    note = models.TextField(max_length=1024, blank=True, null=True)
    values = models.ManyToManyField(PhenomenonParameterValue)


class Dictionary(models.Model):
    value = models.CharField(max_length=255)
    parameter = models.ForeignKey(Parameter, on_delete=models.CASCADE, related_name='options')

    def __str__(self):
        return self.value


class Help(models.Model):
    phenomenon = models.ForeignKey(Phenomenon, on_delete=models.CASCADE, related_name='help')
    name = models.CharField(max_length=255)
    text = RichTextUploadingField()

    def __str__(self):
        return self.name


class Localization(models.Model):
    language = models.CharField(max_length=3)
    dictionary = JSONField()


class UserProfile(models.Model):
    EDUCATION = (
        ('1', 'základní vzdělání'),
        ('2', 'střední vzdělání'),
        ('3', 'vysokoškolské vzdělání'),
    )
    GENDER = (
        ('1', 'male'),
        ('2', 'female'),
    )
    QUALIFICATION = (
        ('1', 'Geography'),
        ('2', 'GIS and cartography'),
        ('3', 'Environmental'),
        ('4', 'Other'),
    )

    user = models.OneToOneField(User, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    age = models.IntegerField()
    education = models.CharField(max_length=128, choices=EDUCATION, blank=True)
    gender = models.CharField(max_length=10, choices=GENDER, blank=True)
    qualification = models.CharField(max_length=128, choices=QUALIFICATION, blank=True)