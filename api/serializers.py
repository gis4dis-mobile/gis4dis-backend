from rest_framework import serializers
from .models import MetadataObservation, Help, Phenomenon, Parameter, Dictionary, PhenomenonParameterValue, \
    PhenomenonPhoto, UserProfile, Localization
from rest_framework_gis.serializers import GeoFeatureModelSerializer
from rest.settings import DOMAIN_NAME
from api.fields import Base64ImageField


class PhenomenonParameterValueSerializer(serializers.ModelSerializer):
    parameter = serializers.SlugRelatedField(slug_field='id', queryset=Parameter.objects.all())
    phenomenon = serializers.SlugRelatedField(slug_field='id', queryset=Phenomenon.objects.all())

    class Meta:
        model = PhenomenonParameterValue
        fields = ('id', 'value', 'parameter', 'phenomenon')


class PhenomenonPhotoSerializer(serializers.ModelSerializer):
    image = Base64ImageField(max_length=None, use_url=True)

    class Meta:
        model = PhenomenonPhoto
        fields = ('id', 'owner', 'parameter', 'image')

    '''def to_representation(self, instance):
        representation = super(PhenomenonPhotoSerializer, self).to_representation(instance)
        full_path = DOMAIN_NAME + instance.image.url
        representation['image'] = full_path
        return representation'''


class UserProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = ('user', 'first_name', 'last_name', 'age', 'education', 'gender', 'qualification')

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


class MetadataObservationSerializer(GeoFeatureModelSerializer):
    values = PhenomenonParameterValueSerializer(many=True, required=False)
    date = serializers.DateField(input_formats=(['%d-%m-%Y', 'iso-8601']))

    class Meta:
        model = MetadataObservation
        geo_field = 'geometry'
        fields = ('id', 'date', 'observation_time', 'send_date', 'geometry', 'note', 'values')

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
        fields = ('name', 'text',)


class DictionarySerializer(serializers.ModelSerializer):
    class Meta:
        model = Dictionary
        fields = ('id', 'value')


class ParameterSerializer(serializers.ModelSerializer):
    options = DictionarySerializer(many=True)

    class Meta:
        model = Parameter
        fields = ('id', 'name', 'type', 'options', 'element')


class LocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Localization
        fields = ('id', 'language', 'dictionary')


class PhenomenonSerializer(serializers.ModelSerializer):
    """
    Represents serializer for app configuration with all informations important in app initialization
    """
    parameters = ParameterSerializer(many=True)
    help = HelpSerializer(many=True)
    category = serializers.SlugRelatedField(read_only=True, slug_field='name')

    class Meta:
        model = Phenomenon
        fields = ('name', 'category', 'parameters', 'category', 'help')
