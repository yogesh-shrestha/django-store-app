import pytest
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser
from rest_framework import status
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode
from model_bakery import baker

from core.models import User


@pytest.mark.django_db
class TestSignUpView:
    user_data = {'username': 'u',
                     'first_name': 'f',
                     'last_name': 'l',
                     'email': 'a@b.com',
                     'password': 'pdsfsad12345$',
                     'password2': 'pdsfsad12345$'}

    def test_sign_up_POST_201(self, api_client):       
        response = api_client.post('/accounts/sign-up/', self.user_data)
        assert response.data['msg'] == 'Registration successful!'
        assert response.status_code == status.HTTP_201_CREATED

    def test_sign_up_POST_400(self, api_client):
        self.user_data['email'] = 'invalid_email'
        response = api_client.post('/accounts/sign-up/', self.user_data)
        assert response.status_code == status.HTTP_400_BAD_REQUEST


@pytest.mark.django_db
class TestSignInView:
    def test_sign_in_POST_200(self, api_client):  
        user = baker.make(User)
        user.set_password('password123$')
        user.save()
        response = api_client.post('/accounts/sign-in/', 
                                   data={'username': user.username, 
                                        'password': 'password123$' })
        assert response.status_code == status.HTTP_200_OK
    
    def test_sign_in_POST_400(self, api_client):
        user = baker.make(User)  
        user.set_password('password123$')
        user.save() 
        response = api_client.post('/accounts/sign-in/', 
                                    data={'username': user.username, 
                                        'password': 'password12345$'})
        assert response.status_code == status.HTTP_401_UNAUTHORIZED




@pytest.mark.django_db
class TestChangePasswordView:
    def test_change_password_POST_200(self, api_client):
        user = baker.make(User)
        api_client.force_authenticate(user=user)
        response = api_client.post('/accounts/change-password/', 
                                   {'password': 'abc123$',
                                    'password2': 'abc123$',
                                    'user': user}
                                    )
        assert response.status_code == status.HTTP_200_OK

    def test_change_password_mismatch(self, api_client):
        user = baker.make(User)
        api_client.force_authenticate(user=user)
        response = api_client.post('/accounts/change-password/', 
                                   {'password': 'abc123$',
                                    'password2': 'abc12345$',
                                    'user': user}
                                    )
        assert response.status_code == status.HTTP_400_BAD_REQUEST


@pytest.mark.django_db
class TestSendResetPasswordEmail:
    def test_reset_email_200(self, api_client):
        user = baker.make(User)
        response = api_client.post('/accounts/send-reset-email/', 
                                   {'email': user.email})
        assert response.status_code == status.HTTP_200_OK

    def test_reset_email_400(self, api_client):
        response = api_client.post('/accounts/send-reset-email/', 
                                   {'email': 'a@b.com'})
        assert response.status_code == status.HTTP_400_BAD_REQUEST


@pytest.mark.django_db
class TestResetPassword:
    def test_reset_password_205(self, api_client):
        user = baker.make(User)
        uid = urlsafe_base64_encode(force_bytes(user.id))
        token = PasswordResetTokenGenerator().make_token(user)
        password_reset_link  = f'/accounts/reset-password/{uid}/{token}/'
        response = api_client.post(password_reset_link, 
                                   {'password': 'abc123$',
                                    'password2': 'abc123$',
                                    'uid': uid,
                                    'toekn': token})
        assert response.status_code == status.HTTP_205_RESET_CONTENT

    def test_reset_password_different_pwd_400(self, api_client):
        user = baker.make(User)
        uid = urlsafe_base64_encode(force_bytes(user.id))
        token = PasswordResetTokenGenerator().make_token(user)
        password_reset_link  = f'/accounts/reset-password/{uid}/{token}/'
        response = api_client.post(password_reset_link, 
                                   {'password': 'abc123$',
                                    'password2': 'abc12345$',
                                    'uid': uid,
                                    'toekn': token})
        assert response.status_code == status.HTTP_400_BAD_REQUEST

    def test_reset_password_invalid_token_400(self, api_client):
        user = baker.make(User)
        uid = urlsafe_base64_encode(force_bytes(user.id))
        token = PasswordResetTokenGenerator().make_token(user) + 'abc'
        password_reset_link  = f'/accounts/reset-password/{uid}/{token}/'
        response = api_client.post(password_reset_link, 
                                   {'password': 'abc123$',
                                    'password2': 'abc123$',
                                    'uid': uid,
                                    'toekn': token})
        assert response.status_code == status.HTTP_400_BAD_REQUEST


