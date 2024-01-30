"""Email settings for the project."""

import os

EMAIL_BACKEND = "django.core.mail.backends.smtp.EmailBackend"
EMAIL_HOST = os.environ.get("EMAIL_HOST")
EMAIL_PORT = os.environ.get("EMAIL_PORT")
EMAIL_HOST_USER = os.environ.get("EMAIL_HOST_USER")
EMAIL_HOST_PASSWORD = os.environ.get("EMAIL_HOST_PASSWORD")
EMAIL_USE_TLS = os.environ.get("EMAIL_USE_TLS") == "True"
EMAIL_USE_SSL = os.environ.get("EMAIL_USE_SSL") == "True"
EMAIL_TIMEOUT = os.environ.get("EMAIL_TIMEOUT") or None
EMAIL_SSL_KEYFILE = os.environ.get("EMAIL_SSL_KEYFILE") or None
EMAIL_SSL_CERTFILE = os.environ.get("EMAIL_SSL_CERTFILE") or None
