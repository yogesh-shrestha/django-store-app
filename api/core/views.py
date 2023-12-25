from rest_framework.generics import CreateAPIView
from rest_framework.response import Response
from django.http import HttpResponseRedirect
from .serializers import ActivationSerializer
from .models import User





