"""Settings for the project."""

from __future__ import annotations

import os

from config.settings.apps import *  # noqa: F403
from config.settings.base import *  # noqa: F403

if os.environ.get("ENVIRONMENT") == "production":
    from config.settings.production import *  # noqa: F403

elif os.environ.get("ENVIRONMENT") == "development":
    from config.settings.development import *  # noqa: F403
