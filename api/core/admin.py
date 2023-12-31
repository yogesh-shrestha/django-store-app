from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import User



@admin.register(User)
class UserModelAdmin(BaseUserAdmin):

    add_fieldsets = (
        (
            None,
            {
                "classes": ("wide",),
                "fields": ("username", "first_name", "last_name", "email", "password1", "password2"),
            },
        ),
    )
    search_fields = ["username"]
