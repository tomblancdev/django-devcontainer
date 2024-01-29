"""Settings for django.contrib.staticfiles."""

import os

STATIC_URL = os.environ.get("STATIC_URL", "static/")

STATIC_ROOT = os.environ.get("STATIC_ROOT", "/static")
