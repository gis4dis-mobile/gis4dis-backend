"""rest URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from api.views import FacebookLogin, GoogleLogin#, UserLoginView
from django.views.generic import TemplateView
from django.conf.urls.static import static
from rest import settings

urlpatterns = [
    #url(r'^rest/rest-auth/login', UserLoginView.as_view(), name='login'),
    url(r'^rest/rest-auth/', include('rest_auth.urls')),
    url(r'^rest/rest-auth/registration/', include('rest_auth.registration.urls')),
    url(r'^rest/rest-auth/facebook/$', FacebookLogin.as_view(), name='fb_login'),
    url(r'^rest/rest-auth/google/$', GoogleLogin.as_view(), name='google_login'),
    url(r'^rest/accounts/', include('allauth.urls'), name='socialaccount_signup'),
    url(r'^rest/api/', include('api.urls', namespace='api')),
    url(r'^rest/admin/', admin.site.urls),
    url(r'^rest/password-reset/confirm/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',
        TemplateView.as_view(template_name="registration/password_reset_confirm.html"), name='password_reset_confirm'),
    url(r'^rest/ckeditor/', include('ckeditor_uploader.urls')),
]

# TODO dont forget set serving photos via NGINX in production mode
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)