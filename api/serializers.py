from rest_framework import serializers
from rest_auth.models import TokenModel
from django.contrib.auth.models import User
from rest_framework_gis.serializers import GeoFeatureModelSerializer

from api.fields import Base64ImageField
from .models import MetadataObservation, Help, Phenomenon, Parameter, Dictionary, PhenomenonParameterValue, \
    PhenomenonPhoto, UserProfile, Version


class UserProfileSerializer(serializers.ModelSerializer):
    full_name = serializers.SerializerMethodField()

    def get_full_name(self, obj):
        return '{} {}'.format(obj.first_name, obj.last_name)

    class Meta:
        model = UserProfile
        fields = ('user', 'full_name', 'first_name', 'last_name', 'age', 'education', 'gender', 'qualification')

    def create(self, validated_data):
        profile, created = UserProfile.objects.update_or_create(
            user=validated_data.get('user', None),
            defaults={'user': validated_data.get('user', None),
                      'first_name': validated_data.get('first_name', None),
                      'last_name': validated_data.get('last_name', None),
                      'education': validated_data.get('education', None),
                      'gender': validated_data.get('gender', None),
                      'qualification': validated_data.get('qualification', None),
                      'age': validated_data.get('age', None)})
        return profile


class UserSerializer(serializers.ModelSerializer):
    profile = UserProfileSerializer()

    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'profile')


class TokenSerializer(serializers.ModelSerializer):
    user = UserSerializer()

    class Meta:
        model = TokenModel
        fields = ('key', 'user')


class PhenomenonPhotoSerializer(serializers.ModelSerializer):
    owner = serializers.PrimaryKeyRelatedField(read_only=True, default=serializers.CurrentUserDefault())
    image = Base64ImageField(max_length=None, use_url=True)

    class Meta:
        model = PhenomenonPhoto
        fields = ('id', 'parameter', 'owner', 'image', 'observation')

    '''def to_representation(self, instance):
        representation = super(PhenomenonPhotoSerializer, self).to_representation(instance)
        full_path = DOMAIN_NAME + instance.image.url
        representation['image'] = full_path
        return representation'''


class DictionarySerializer(serializers.ModelSerializer):

    class Meta:
        model = Dictionary
        fields = ('id', 'value', 'i18n_tag')


class DictionaryMetadataObservationSerializer(serializers.ModelSerializer):
    name = serializers.SerializerMethodField('get_value_as_name')

    def get_value_as_name(self, obj):
        return obj.value

    class Meta:
        model = Dictionary
        fields = ('name', 'i18n_tag')


class PhenomenonParameterValueSerializerId(serializers.ModelSerializer):
    parameter = serializers.SlugRelatedField(slug_field='id', queryset=Parameter.objects.all())
    phenomenon = serializers.SlugRelatedField(slug_field='id', queryset=Phenomenon.objects.all())

    class Meta:
        model = PhenomenonParameterValue
        fields = ('id', 'value', 'parameter', 'phenomenon')


class ParameterMetadataObservationSerializer(serializers.ModelSerializer):

    class Meta:
        model = Parameter
        fields = ('id', 'name', 'i18n_tag')


class PhenomenonMetadataObservationSerializer(serializers.ModelSerializer):
    """
    Represents serializer for app configuration with all informations important in app initialization
    """

    class Meta:
        model = Phenomenon
        fields = ('id', 'name', 'i18n_tag')


class ParameterSerializer(serializers.ModelSerializer):
    options = DictionarySerializer(many=True)

    class Meta:
        model = Parameter
        fields = ('id', 'name', 'i18n_tag', 'type', 'element', 'mandatory', 'options')


class PhenomenonParameterValueSerializer(serializers.ModelSerializer):
    parameter = ParameterMetadataObservationSerializer()
    phenomenon = PhenomenonMetadataObservationSerializer()
    value = serializers.SerializerMethodField('get_value_i18n_tag')

    def get_value_i18n_tag(self, obj):
        try:
            dictionary = Dictionary.objects.get(value=obj.value)
            obj_serializer = DictionaryMetadataObservationSerializer(dictionary)
            return obj_serializer.data
        except Dictionary.DoesNotExist:
            return obj.value

    class Meta:
        model = PhenomenonParameterValue
        fields = ('id', 'phenomenon', 'parameter', 'value')


class MetadataObservationSerializerId(GeoFeatureModelSerializer):
    values = PhenomenonParameterValueSerializerId(many=True, required=False)
    observation_date = serializers.DateTimeField()
    user = serializers.PrimaryKeyRelatedField(read_only=True, default=serializers.CurrentUserDefault())

    class Meta:
        model = MetadataObservation
        geo_field = 'geometry'
        fields = ('id', 'observation_date', 'user', 'send_date', 'geometry', 'note', 'values')

    def create(self, validated_data):
        """
        Create and return a new `MetadataObservation` instance, given the validated data.
        """
        parameters = validated_data.pop('values')
        observation = MetadataObservation.objects.create(**validated_data)
        print(parameters)
        for parameter in parameters:
            print(parameter['phenomenon'])
            parameter = PhenomenonParameterValue.objects.create(phenomenon=parameter['phenomenon'],
                                                                parameter=parameter['parameter'],
                                                                value=parameter['value'])
            print(parameter)
            observation.values.add(parameter)
        print('Observation: {}'.format(observation))
        return observation


class MetadataObservationSerializer(GeoFeatureModelSerializer):
    values = PhenomenonParameterValueSerializer(many=True, required=False)
    observation_date = serializers.DateTimeField()
    user_fullname = serializers.SerializerMethodField('get_user_profile')
    photos = PhenomenonPhotoSerializer(many=True, required=False)

    def get_user_profile(self, obj):
        try:
            profile = UserProfile.objects.get(user=obj.user)
            return profile.__str__()
        except:
            return None

    class Meta:
        model = MetadataObservation
        geo_field = 'geometry'
        fields = ('id', 'user_fullname', 'observation_date', 'send_date', 'geometry', 'note', 'photos', 'values')

    def create(self, validated_data):
        """
        Create and return a new `MetadataObservation` instance, given the validated data.
        """
        parameters = validated_data.pop('values')
        observation = MetadataObservation.objects.create(**validated_data)
        print(parameters)
        for parameter in parameters:
            print(parameter['phenomenon'])
            parameter = PhenomenonParameterValue.objects.create(phenomenon=parameter['phenomenon'],
                                                                parameter=parameter['parameter'],
                                                                value=parameter['value'])
            print(parameter)
            observation.values.add(parameter)
        return observation


class HelpSerializer(serializers.ModelSerializer):

    class Meta:
        model = Help
        fields = ('text', 'i18n_tag')


class PhenomenonSerializer(serializers.ModelSerializer):
    """
    Represents serializer for app configuration with all informations important in app initialization
    """
    parameters = ParameterSerializer(many=True)
    help = HelpSerializer(many=True)
    version = serializers.SerializerMethodField('get_config_version')

    def get_config_version(self, obj):
        try:
            version = Version.objects.get(name='config')
            return version.version
        except:
            return None

    class Meta:
        model = Phenomenon
        fields = ('id', 'version', 'name', 'i18n_tag', 'parameters', 'help')


class LocalizationSerializer(serializers.Serializer):
    phenomenon = PhenomenonSerializer()
    parameters = ParameterSerializer()


class VersionSerializer(serializers.ModelSerializer):

    class Meta:
        model = Version
        fields = ('version',)