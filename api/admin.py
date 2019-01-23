from django.contrib import admin
from .models import *
from django.conf import settings

admin.site.register(Category)
admin.site.register(PhenomenonParameterValue)
admin.site.register(MetadataObservation)
admin.site.register(UserProfile)
admin.site.register(PhenomenonPhoto)
admin.site.register(Localization)
admin.site.register(PhenomenonLocalization)
admin.site.register(ParameterLocalization)
admin.site.register(DictionaryLocalization)
admin.site.register(HelpLocalization)
admin.site.register(Version)


@admin.register(Phenomenon)
class PhenomenonAdmin(admin.ModelAdmin):
    class Media:
        static_url = getattr(settings, 'STATIC_URL', '/static')
        js = [static_url + 'js/lang-slug.js', ]


@admin.register(Parameter)
class ParameterAdmin(admin.ModelAdmin):
    class Media:
        static_url = getattr(settings, 'STATIC_URL', '/static')
        js = [static_url + 'js/lang-slug.js', ]


@admin.register(Dictionary)
class DictionaryAdmin(admin.ModelAdmin):
    class Media:
        static_url = getattr(settings, 'STATIC_URL', '/static')
        js = [static_url + 'js/lang-slug.js', ]


@admin.register(Help)
class HelpAdmin(admin.ModelAdmin):
    class Media:
        static_url = getattr(settings, 'STATIC_URL', '/static')
        js = [static_url + 'js/lang-slug.js', ]
