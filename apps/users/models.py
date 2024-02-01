"""Users models."""
from __future__ import annotations

from typing import Self

from django.contrib.auth.models import (
    AbstractBaseUser,
    BaseUserManager,
    PermissionsMixin,
)
from django.core.exceptions import ValidationError
from django.db import models
from django.utils.translation import gettext_lazy as _

# Create your models here.


class UserManager(BaseUserManager["User"]):

    """User manager."""

    def create_user(
        self: Self,
        email: str,
        password: str | None = None,
        **extra_fields: dict[str, object],
    ) -> User:
        """Create user."""
        if not email:
            raise ValidationError(_("Users must have an email address"))
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.full_clean()
        user.save()
        return user

    def create_superuser(
        self: Self,
        email: str,
        password: str | None = None,
        **extra_fields: dict[str, object],
    ) -> User:
        """Create superuser."""
        user = self.create_user(email, password, **extra_fields)
        user.is_superuser = True
        user.is_staff = True
        user.save()
        return user


class User(AbstractBaseUser, PermissionsMixin):

    """Custom user model."""

    email = models.EmailField(unique=True)

    is_staff = models.BooleanField(
        default=False,
        help_text=_("Designates whether the user can log into this admin site."),
    )

    USERNAME_FIELD = "email"

    objects: UserManager = UserManager()

    def __str__(self: Self) -> str:
        """Return email."""
        return self.email
