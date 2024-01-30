CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'
BOLD="\e[1m"
UNDERLINE="\e[4m"
CLEAR="\e[0m"

django_version=$(poetry run python -m django --version)
debug=$(poetry run python /workspace/manage.py shell -c "from django.conf import settings; print(settings.DEBUG)")
media_root=$(poetry run python /workspace/manage.py shell -c "from django.conf import settings; print(settings.MEDIA_ROOT)")
static_root=$(poetry run python /workspace/manage.py shell -c "from django.conf import settings; print(settings.STATIC_ROOT)")


if [[ $debug == "True" ]]; then
    debug="${GREEN}${debug}${NC}"
else
    debug="${RED}${debug}${NC}"
fi

DJANGO_MESSAGE="""
Your Django project:
    - ${UNDERLINE}Version${CLEAR}: ${CYAN}${django_version}${NC}
    - ${UNDERLINE}Used Environment${CLEAR}: ${CYAN}${ENVIRONMENT}${NC}
    - ${UNDERLINE}Debug${CLEAR}: ${debug}
    - ${UNDERLINE}Django superuser email${CLEAR}: ${CYAN}${DJANGO_SUPERUSER_EMAIL}${NC}
    - ${UNDERLINE}Django superuser password${CLEAR}: ${CYAN}${DJANGO_SUPERUSER_PASSWORD}${NC}
    - ${UNDERLINE}Media root${CLEAR}: ${CYAN}${media_root}${NC}
    - ${UNDERLINE}Static root${CLEAR}: ${CYAN}${static_root}${NC}
"""

echo -e "${DJANGO_MESSAGE}"
exit 0
