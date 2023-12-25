from django.db import models
from django.contrib.auth.models import AbstractUser, UserManager 

class UserManagerCustom(UserManager):
    def create_user(self, username, email=None, password=None, **extra_fields):
        extra_fields.setdefault("is_staff", False)
        extra_fields.setdefault("is_superuser", False)
        return self._create_user(username, email, password, **extra_fields)



class User(AbstractUser):
    first_name = models.CharField(max_length=255, 
                                  null=False,
                                  blank=False)
    last_name = models.CharField(max_length=255,
                                 null=False,
                                 blank=False)
    email = models.EmailField(max_length=255,
                              null=False,
                              blank=False,
                              unique=True)
    objects = UserManagerCustom()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name', 'password']

    def __str__(self):
        return f'{self.first_name} {self.last_name}'