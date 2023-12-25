from djoser.serializers import (UserCreatePasswordRetypeSerializer as BaseUserCreateSerializer,
                                UserSerializer as BaseUserSerializer,
                                ActivationSerializer as BaseActivationSerializer,
                                ActivationSerializer)
from rest_framework import serializers

class UserCreateSerializer(BaseUserCreateSerializer):
    # re_password = serializers.CharField(style={'input_type': 'password'})

    class Meta(BaseUserCreateSerializer.Meta):
        fields = ['id', 'username', 'first_name', 'last_name', 'email', 'password']



class UserSerializer(BaseUserSerializer):
    class Meta(BaseUserSerializer.Meta):
        fields = ['id', 'username', 'email', 'first_name', 'last_name']


class ActivationSerializer(BaseActivationSerializer):
    pass



