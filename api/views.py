from django.http import JsonResponse
from allauth.socialaccount.providers.google.views import GoogleOAuth2Adapter
from allauth.socialaccount.providers.facebook.views import FacebookOAuth2Adapter
from allauth.socialaccount.providers.oauth2.client import OAuth2Client
from django.contrib.gis.geos import Polygon, Point
from django.contrib.gis.measure import Distance
from django.http import Http404
from django.http import JsonResponse
from rest_auth.registration.views import SocialLoginView
from rest_framework import status
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response
from rest_framework.views import APIView
from django.contrib.auth.models import User

from .models import MetadataObservation, Phenomenon, PhenomenonPhoto, UserProfile, Localization, Version
from .serializers import MetadataObservationSerializer, MetadataObservationSerializerId, PhenomenonSerializer, \
    PhenomenonPhotoSerializer, UserProfileSerializer, VersionSerializer


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
        serializer = MetadataObservationSerializerId(data=request.data, context={'request': request})
        if serializer.is_valid():
            serializer.save()

            # returning object with name instead of ids of parameters
            observation = MetadataObservation.objects.get(pk=serializer.data.get('id'))
            serializer_object = MetadataObservationSerializer(observation, many=False)
            return Response(serializer_object.data, status=status.HTTP_201_CREATED)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UserProfileDetail(APIView):
    def get_object(self, pk):
        try:
            return UserProfile.objects.get(user_id=pk)
        except UserProfile.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        profile = self.get_object(pk)
        serializer = UserProfileSerializer(profile)
        return Response(serializer.data)


class UserProfileUpdate(APIView):
    def get_object(self, pk):
        try:
            return UserProfile.objects.get(user_id=pk)
        except UserProfile.DoesNotExist:
            raise Http404

    def put(self, request, format=None):
        instance = self.get_object(request.data.get('user'))
        instance.user = User.objects.get(pk=request.data.get('user', None))
        instance.first_name = request.data.get('first_name', None)
        instance.last_name = request.data.get('last_name', None)
        instance.education = request.data.get('education', None)
        instance.gender = request.data.get('gender', None)
        instance.qualification = request.data.get('qualification', None)
        instance.age = request.data.get('age', None)
        instance.save()

        serializer = UserProfileSerializer(data=request.data)
        serializer.is_valid(raise_exception=False)

        return Response(serializer.data)

        # serializer = UserProfileSerializer(data=request.data)
        # if serializer.is_valid():
        #     serializer.save()
        #     return Response(serializer.data)
        # return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


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
        print(serializer.errors)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class VersionDetail(APIView):
    def get(self, request, format=None):
        name = self.request.query_params.get('name', None)

        if name:
            version = Version.objects.filter(name=name)
        else:
            version = Version.objects.all()

        serializer = VersionSerializer(version, many=True)
        return Response(serializer.data)


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
    """
    Represents configuration view which is used for app initialization
    """
    def get(self, request, format=None):
        structure = Phenomenon.objects.all()
        serializer = PhenomenonSerializer(structure, many=True)
        return Response(serializer.data)


class LocalizationList(APIView):
    def get(self, request, format=None):

        response_data = []

        phenomenons = Phenomenon.objects.select_related().all()

        for phenomenon in phenomenons:

            phenomenon_data = {}

            for phenomenon_localization in phenomenon.localization.all():
                phenomenon_data[phenomenon_localization.language] = {}
                phenomenon_data[phenomenon_localization.language][phenomenon.i18n_tag] = phenomenon_localization.name

            # phenomenon_data['version'] = Version.objects.get(name='localization').version

            parameters = phenomenon.parameters.all()

            for parameter in parameters:

                for parameter_localization in parameter.localization.all():
                    phenomenon_data[parameter_localization.language][parameter.i18n_tag] = parameter_localization.name

                dictionaries = parameter.options.all()

                for dictionary in dictionaries:

                    for dictionary_localization in dictionary.localization.all():
                        phenomenon_data[dictionary_localization.language][dictionary.i18n_tag] = dictionary_localization.name

                helps = phenomenon.help.all()

                for help in helps:

                    for help_localization in help.localization.all():
                        phenomenon_data[help_localization.language][help.i18n_tag] = help_localization.text

            response_data.append(phenomenon_data)

        app_localizations = Localization.objects.all()
        app_data = {}
        for app_localization in app_localizations:
            app_data[app_localization.language] = app_localization.dictionary
        response_data.append(app_data)

        return JsonResponse(response_data, safe=False)


class FacebookLogin(SocialLoginView):
    adapter_class = FacebookOAuth2Adapter
    callback_url = 'http://zelda.sci.muni.cz/rest-auth/facebook/'
    client_class = OAuth2Client


class GoogleLogin(SocialLoginView):
    adapter_class = GoogleOAuth2Adapter
    callback_url = 'http://zelda.sci.muni.cz/rest-auth/google/'
    client_class = OAuth2Client
