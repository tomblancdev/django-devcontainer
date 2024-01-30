"""Settings for globalization."""

import os

LANGUAGE_CODE = os.environ.get("LANGUAGE_CODE", "en-us")

TIME_ZONE = os.environ.get("TIME_ZONE", "UTC")

USE_I18N = True

USE_TZ = True
