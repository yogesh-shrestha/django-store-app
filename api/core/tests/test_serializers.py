import pytest
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils.encoding import smart_str, force_bytes, DjangoUnicodeDecodeError
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from model_bakery import baker
from core import serializers
from core.models import User


@pytest.fixture
def user_data():
    return  {'username': 'u',
                'first_name': 'f',
                'last_name': 'l',
                'email': 'a@b.com',
                'password': 'pdsfsad12345$',
                'password2': 'pdsfsad12345$'}


@pytest.mark.django_db
class TestUserRegistrationSerializer:
    
    def test_valid_sign_up_serializer(self, user_data):
        serializer = serializers.UserRegistrationSerializer(data=user_data)
        assert serializer.is_valid() == True
        assert set(serializer.data.keys()) == set(['username',
                                                   'first_name',
                                                   'last_name',
                                                   'email', 
                                                   'password'])

    def test_invalid_sign_up_serializer(self, user_data):
        user_data['email'] = 'invalid_email'
        serializer = serializers.UserRegistrationSerializer(data=user_data)
        assert serializer.is_valid() == False

    def test_passwords_mismatch(self,user_data):
        user_data['password2'] = 'pdsfsad123'
        serializer = serializers.UserRegistrationSerializer(data=user_data)
        assert serializer.is_valid() == False

    def test_create_user_serializer(self, user_data):
        serializer = serializers.UserRegistrationSerializer(data=user_data)
        if serializer.is_valid():
            serializer.save()
        assert User.objects.filter(username='u').exists()



@pytest.mark.django_db
class TestUserLoginSerializer:
    def test_login_valid_data(self):
        user = baker.make(User)
        serializer = serializers.UserLoginSeriallizer(data={'username': user.username,
                                                            'password': user.password})
        assert serializer.is_valid()
        assert set(serializer.data.keys()) == set(['username', 
                                                   'password'])
    def test_login_invalid_data(self):
        user = baker.make(User)
        serializer = serializers.UserLoginSeriallizer(data={'username': user.username,
                                                            'password': ''})
        
@pytest.mark.django_db
class TestChangePasswordSerializer:
    def test_change_password_valid_data(self):
        user = baker.make(User)
        serializer = serializers.UserChangePasswordSerializer(data={'password': 'abc123$',
                                                                    'password2': 'abc123$'},
                                                            context={'user': user})
        assert serializer.is_valid()

    def test_change_password_invalid_data(self):
        user = baker.make(User)
        serializer = serializers.UserChangePasswordSerializer(data={'password': 'abc123$',
                                                                    'password2': 'abc12345$'},
                                                            context={'user': user})
        assert not serializer.is_valid()

@pytest.mark.django_db
class TestSendResetLinkSerializer:
    def test_send_reset_link_valid_email(self):
        user = baker.make(User)
        serializer = serializers.UserSendResetEmailSerializer(data={'email': user.email})
        assert serializer.is_valid()

    def test_send_reset_link_invalid_email(self):
        user = baker.make(User)
        serializer = serializers.UserSendResetEmailSerializer(data={'email': 'a@b.com'})
        assert not serializer.is_valid()


@pytest.mark.django_db
class TestResetPasswordSerializer:
        
    def test_reset_password_valid_user(self):
        user = baker.make(User)
        uid = urlsafe_base64_encode(force_bytes(user.id))
        token = PasswordResetTokenGenerator().make_token(user)
        serializer = serializers.UserPasswordResetSerializer(data={'password': 'abc123$',
                                                                   'password2': 'abc123$'},
                                                            context={'uid': uid,
                                                                    'token': token})
        assert serializer.is_valid()

    def test_reset_password_invalid_user(self):
        user1 = baker.make(User)
        user2 = baker.make(User)
        uid2 = urlsafe_base64_encode(force_bytes(user2.id))
        token = PasswordResetTokenGenerator().make_token(user1)
        serializer = serializers.UserPasswordResetSerializer(data={'password': 'abc123$',
                                                                   'password2': 'abc123$'},
                                                            context={'uid': uid2,
                                                                    'token': token})
        assert not serializer.is_valid()

    def test_reset_password_mismatch(self):
        user = baker.make(User)
        uid = urlsafe_base64_encode(force_bytes(user.id))
        token = PasswordResetTokenGenerator().make_token(user)
        serializer = serializers.UserPasswordResetSerializer(data={'password': 'abc123$',
                                                                   'password2': 'abc12345$'},
                                                            context={'uid': uid,
                                                                    'token': token})
        assert not serializer.is_valid()