from django.db import models
from django.contrib.gis.db import models as gismodels
from django.contrib.postgres.fields import JSONField
from django.contrib.auth.models import User
from ckeditor_uploader.fields import RichTextUploadingField


class Category(models.Model):
    name = models.CharField(max_length=255)

    class Meta:
        verbose_name_plural = 'Categories'

    def __str__(self):
        return self.name


# class CategoryLocalization(models.Model):
#     category = models.ForeignKey('Category', on_delete=models.CASCADE, related_name='localization')
#     language = models.CharField(max_length=3)
#     name = models.CharField(max_length=255)
#
#     class Meta:
#         verbose_name_plural = 'Category localizations'
#
#     def __str__(self):
#         return self.name


class Phenomenon(models.Model):
    name = models.CharField(max_length=255)
    i18n_tag = models.CharField(max_length=512, unique=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='category')

    def __str__(self):
        return self.name


class PhenomenonLocalization(models.Model):
    phenomenon = models.ForeignKey('Phenomenon', on_delete=models.CASCADE, related_name='localization')
    language = models.CharField(max_length=3)
    name = models.CharField(max_length=255)

    class Meta:
        verbose_name_plural = 'Phenomenon localizations'

    def __str__(self):
        return self.name


class Parameter(models.Model):
    name = models.CharField(max_length=255)
    i18n_tag = models.CharField(max_length=512, unique=True)
    phenomenon = models.ForeignKey(Phenomenon, on_delete=models.CASCADE, related_name='parameters')
    type = models.CharField(max_length=255)
    element = models.CharField(max_length=255)

    def __str__(self):
        return self.name


class ParameterLocalization(models.Model):
    parameter = models.ForeignKey('Parameter', on_delete=models.CASCADE, related_name='localization')
    language = models.CharField(max_length=3)
    name = models.CharField(max_length=255)

    class Meta:
        verbose_name_plural = 'Parameter localizations'

    def __str__(self):
        return self.name


class PhenomenonParameterValue(models.Model):
    phenomenon = models.ForeignKey(Phenomenon, on_delete=models.CASCADE)
    parameter = models.ForeignKey(Parameter, on_delete=models.CASCADE)
    value = models.CharField(max_length=255)

    def __str__(self):
        return '{}: {}'.format(self.parameter, self.value)


class PhenomenonPhoto(models.Model):
    owner = models.ForeignKey(User, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='photos', max_length=255, blank=True)
    parameter = models.ForeignKey(PhenomenonParameterValue, on_delete=models.CASCADE, blank=True, null=True)
    observation = models.ForeignKey('MetadataObservation', related_name='photos', on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self):
        return str(self.image)


class MetadataObservation(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)
    observation_date = models.DateTimeField(blank=True, null=True)
    send_date = models.DateTimeField(auto_now_add=True)
    geometry = gismodels.PointField(srid=4326, blank=True, null=True)
    note = models.TextField(max_length=1024, blank=True, null=True)
    values = models.ManyToManyField(PhenomenonParameterValue)

    def __str__(self):
        return 'Observation from {}'.format(self.observation_date)


class Dictionary(models.Model):
    value = models.CharField(max_length=255)
    i18n_tag = models.CharField(max_length=512, unique=True)
    parameter = models.ForeignKey(Parameter, on_delete=models.CASCADE, related_name='options')

    class Meta:
        verbose_name_plural = 'Dictionaries'

    def __str__(self):
        return self.value


class DictionaryLocalization(models.Model):
    dictionary = models.ForeignKey('Dictionary', on_delete=models.CASCADE, related_name='localization')
    language = models.CharField(max_length=3)
    name = models.CharField(max_length=255)

    class Meta:
        verbose_name_plural = 'Dictionary localizations'

    def __str__(self):
        return self.name


class Help(models.Model):
    phenomenon = models.ForeignKey(Phenomenon, on_delete=models.CASCADE, related_name='help')
    #name = models.CharField(max_length=255)
    text = RichTextUploadingField()
    i18n_tag = models.CharField(max_length=512, unique=True)

    def __str__(self):
        return self.phenomenon.name


class HelpLocalization(models.Model):
    help = models.ForeignKey('Help', on_delete=models.CASCADE, related_name='localization')
    language = models.CharField(max_length=3)
    #name = models.CharField(max_length=255)
    text = RichTextUploadingField()

    class Meta:
        verbose_name_plural = 'Help localizations'

    def __str__(self):
        return self.help.phenomenon.name


class Localization(models.Model):
    language = models.CharField(max_length=3)
    dictionary = JSONField()

    def __str__(self):
        return self.language


class Version(models.Model):
    name = models.CharField(max_length=50)
    version = models.CharField(max_length=5)

    def __str__(self):
        return self.name


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

    def __str__(self):
        return '{} {}'.format(self.first_name, self.last_name)