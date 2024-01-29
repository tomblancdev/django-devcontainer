"""Admin module for users app."""

from __future__ import annotations

from typing import Self

from django import forms
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.forms import ReadOnlyPasswordHashField
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _

from .models import User


class UserCreationForm(forms.ModelForm):

    """A form for creating new users.

    Includes all the required fields, plus a repeated password.
    """

    password1 = forms.CharField(label=_("Password"), widget=forms.PasswordInput)
    password2 = forms.CharField(
        label=_("Password confirmation"),
        widget=forms.PasswordInput,
        help_text=_("Enter the same password as above, for verification."),
    )

    class Meta:

        """Meta class."""

        model = User
        fields = ("email",)

    def clean_password2(self: Self) -> str:
        """Check that the two password entries match."""
        password1 = self.cleaned_data.get("password1", "")
        password2 = self.cleaned_data.get("password2", "")

        if password1 and password2 and password1 != password2:
            raise ValidationError(_("Passwords don't match."))

        return password2

    def save(
        self: Self,
        commit: bool = True,  # noqa: FBT001, FBT002
    ) -> User:
        """Save the provided password in hashed format."""
        user = super().save(commit=False)
        user.set_password(self.cleaned_data["password1"])

        if commit:
            user.save()

        return user


class UserChangeForm(forms.ModelForm):

    """A form for updating users.

    Includes all the fields on the user.
    Removes the password field, and adds a password hash field.
    """

    password = ReadOnlyPasswordHashField()

    class Meta:

        """Meta class."""

        model = User
        fields = (
            "email",
            "password",
            "is_superuser",
        )

    def clean_password(self: Self) -> str:
        """Regardless of what the user provides, return the initial value."""
        return self.initial["password"]


class UserAdmin(BaseUserAdmin):

    """User admin."""

    form = UserChangeForm
    add_form = UserCreationForm

    list_display = (
        "email",
        "is_superuser",
    )
    list_filter = ("is_superuser",)

    fieldsets = (
        (
            None,
            {
                "fields": (
                    "email",
                    "password",
                ),
            },
        ),
        (
            _("Permissions"),
            {
                "fields": (
                    "is_superuser",
                    "groups",
                    "user_permissions",
                ),
            },
        ),
        (_("Important dates"), {"fields": ("last_login", "date_joined")}),
    )

    add_fieldsets = (
        (
            None,
            {
                "classes": ("wide",),
                "fields": (
                    "email",
                    "password1",
                    "password2",
                ),
            },
        ),
    )

    search_fields = ("email",)
    ordering = ("email",)
    filter_horizontal = ()
    readonly_fields = ("last_login",)


admin.site.register(User, UserAdmin)
