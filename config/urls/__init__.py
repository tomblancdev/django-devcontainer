"""Config of urls."""

import os

from config.urls.api import urlpatterns as api_urlpatterns
from config.urls.base import urlpatterns as base_urlpatterns

urlpatterns = base_urlpatterns + api_urlpatterns

if os.environ.get("ENVIRONMENT") == "development":
    from config.urls.development import urlpatterns as dev_urlpatterns

    urlpatterns += dev_urlpatterns
