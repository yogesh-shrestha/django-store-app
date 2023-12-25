from django.core.exceptions import ValidationError
from rest_framework import permissions


def validate_image_size(file):
    """ validates the size of image"""
    max_file_size_kb = 2
    if file.size > max_file_size_kb * 1024 * 1024:
        return ValidationError(f'fize size can not be larger than {max_file_size_kb} KB !')
    


class IsAdminOrReadOnly(permissions.BasePermission):
    def has_permission(self, request, view):
        if request.method in permissions.SAFE_METHODS:
            return True
        return request.user and request.user.is_staff
    
