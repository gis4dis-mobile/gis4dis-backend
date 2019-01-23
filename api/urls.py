from django.conf.urls import url, include
from . import views

from django.conf.urls.static import static
from rest import settings


urlpatterns = [
    #url(r'^$', views.index, name='index'),
    url(r'^observations/$', views.ObservationList.as_view()),
    url(r'^profile/$', views.UserProfileUpdate.as_view()),
    url(r'^profile/(?P<pk>[0-9]+)/$', views.UserProfileDetail.as_view()),
    url(r'^photos/$', views.PhotoList.as_view()),
    url(r'^photos/(?P<pk>[0-9]+)/$', views.PhotoDetail.as_view()),
    url(r'^config/$', views.Config.as_view()),
    url(r'^localization/$', views.LocalizationList.as_view()),
    url(r'^version/$', views.VersionDetail.as_view()),
]

# TODO dont forget set serving photos via NGINX in production mode
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)