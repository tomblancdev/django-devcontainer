"""Settings for rest_framework app."""


REST_FRAMEWORK = {
    "DEFAULT_AUTHENTICATION_CLASSES": [
        "users.authentication.AuthTokenAuthentication",
    ],
}
