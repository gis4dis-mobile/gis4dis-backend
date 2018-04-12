from django.contrib import admin
from .models import Category, Phenomenon, Parameter, PhenomenonParameterValue, MetadataObservation, Dictionary, Help, \
    UserProfile, PhenomenonPhoto, Localization, PhenomenonLocalization, ParameterLocalization, DictionaryLocalization, HelpLocalization

# Register your models here
admin.site.register(Category)
admin.site.register(Phenomenon)
admin.site.register(Parameter)
admin.site.register(PhenomenonParameterValue)
admin.site.register(MetadataObservation)
admin.site.register(Dictionary)
admin.site.register(Help)
admin.site.register(UserProfile)
admin.site.register(PhenomenonPhoto)
admin.site.register(Localization)
admin.site.register(PhenomenonLocalization)
admin.site.register(ParameterLocalization)
admin.site.register(DictionaryLocalization)
admin.site.register(HelpLocalization)
