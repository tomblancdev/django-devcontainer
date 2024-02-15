cd ${APP_HOME}

CYAN='\033[0;36m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'

BOLD="\e[1m"
UNDERLINE="\e[4m"
CLEAR="\e[0m"


echo -e "${CYAN}Installing Django${NC}"

poetry run python manage.py migrate

# if there is an error when calling createsuperuser command catch it and do something with it
poetry run python manage.py createsuperuser --noinput || true

exit 0
