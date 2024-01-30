"""Development URL Configuration."""

from __future__ import annotations

from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from django.urls import URLResolver


urlpatterns: list[URLResolver] = []
