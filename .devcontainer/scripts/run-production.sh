cd ${APP_HOME}

CYAN='\033[0;36m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


echo -e "${CYAN}Copying nginx.conf${NC}"
bash ${APP_HOME}/.devcontainer/scripts/copy-nginx-conf.sh
echo -e "${GREEN}Copying nginx.conf done${NC}"

# Start Nginx
echo -e "${CYAN}Starting Nginx...${NC}"
service nginx restart
echo $(service nginx status)
echo -e "${GREEN}Nginx started${NC}"

# migrate database
echo -e "${CYAN}Migrating database...${NC}"
poetry run python manage.py migrate
echo -e "${GREEN}Database migrated${NC}"

# collect static files
echo -e "${CYAN}Collecting static files...${NC}"
poetry run python manage.py collectstatic --noinput
echo -e "${GREEN}Static files collected${NC}"

# Create superuser
echo -e "${CYAN}Creating superuser...${NC}"
poetry run python manage.py createsuperuser --noinput
echo -e "${GREEN}Superuser created${NC}"

# Start Server
echo -e "${CYAN}Starting Server...${NC}"
poetry run python manage.py runserver
