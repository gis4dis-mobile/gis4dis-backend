from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse, JsonResponse
from allauth.socialaccount.providers.facebook.views import FacebookOAuth2Adapter
from allauth.socialaccount.providers.google.views import GoogleOAuth2Adapter
from rest_auth.registration.views import SocialLoginView
from allauth.socialaccount.providers.oauth2.client import OAuth2Client

from .models import MetadataObservation, Phenomenon, PhenomenonPhoto, UserProfile
from .serializers import MetadataObservationSerializer, PhenomenonSerializer, PhenomenonPhotoSerializer, UserProfileSerializer
from rest_framework.parsers import JSONParser

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import authentication_classes, permission_classes

from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from django.http import Http404
from rest_framework.pagination import PageNumberPagination
from django.contrib.gis.geos import Polygon, Point
from django.contrib.gis.measure import Distance


#@authentication_classes((TokenAuthentication,))
#@permission_classes((IsAuthenticated,))
class ObservationList(APIView):
    def get(self, request, format=None):
        radius = self.request.query_params.get('radius', None)
        point = self.request.query_params.get('point', None)
        bbox = self.request.query_params.get('bbox', None)
        user = self.request.query_params.get('user', None)
        phenomenon = self.request.query_params.get('phenomenon', None)

        if (radius and point) and len(point.split(',')) == 2:
            # value in meters
            longitude, latitude = point.split(',')
            point_within = Point(float(longitude), float(latitude))
            observations = MetadataObservation.objects.filter(geometry__distance_lte=(point_within, Distance(m=radius)))
        elif bbox and len(bbox.split(',')) == 4:
            # (xmin, ymin, xmax, ymax)
            observations = MetadataObservation.objects.filter(geometry__intersects=Polygon.from_bbox(bbox.split(',')))
        else:
            observations = MetadataObservation.objects.all()

        paginator = PageNumberPagination()
        result_page = paginator.paginate_queryset(observations, request)
        serializer = MetadataObservationSerializer(result_page, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):
        serializer = MetadataObservationSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UserProfileDetail(APIView):
    def get_object(self, pk):
        try:
            return UserProfile.objects.get(pk=pk)
        except UserProfile.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        profile = self.get_object(pk)
        serializer = UserProfileSerializer(profile)
        return Response(serializer.data)


class UserProfileUpdate(APIView):
    def get_object(self, pk):
        try:
            return UserProfile.objects.get(pk=pk)
        except UserProfile.DoesNotExist:
            raise Http404

    def put(self, request, format=None):
        serializer = UserProfileSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


#@authentication_classes((TokenAuthentication,))
#@permission_classes((IsAuthenticated,))
class PhotoList(APIView):
    def get(self, request, format=None):
        photos = PhenomenonPhoto.objects.all()
        serializer = PhenomenonPhotoSerializer(photos, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):
        serializer = PhenomenonPhotoSerializer(data=request.data)
        print(request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class PhotoDetail(APIView):
    def get_object(self, pk):
        try:
            return PhenomenonPhoto.objects.get(pk=pk)
        except PhenomenonPhoto.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        photo = self.get_object(pk)
        serializer = PhenomenonPhotoSerializer(photo)
        return Response(serializer.data)

    def delete(self, request, pk, format=None):
        photo = self.get_object(pk=pk)
        photo.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class Config(APIView):
    def get(self, request, format=None):
        structure = Phenomenon.objects.all()
        serializer = PhenomenonSerializer(structure, many=True)
        return Response(serializer.data)


class FacebookLogin(SocialLoginView):
    adapter_class = FacebookOAuth2Adapter
    callback_url = 'http://zelda.sci.muni.cz/rest-auth/facebook/'
    client_class = OAuth2Client


class GoogleLogin(SocialLoginView):
    adapter_class = GoogleOAuth2Adapter
    callback_url = 'http://zelda.sci.muni.cz/rest-auth/google/'
    client_class = OAuth2Client
