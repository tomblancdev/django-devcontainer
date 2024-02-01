CYAN='\033[0;36m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${CYAN}Runing post-create.sh${NC}"

cd /workspace

bash /workspace/.devcontainer/scripts/git/add-remote-templates.sh

echo -e "${CYAN}Copying nginx.conf${NC}"
bash /workspace/.devcontainer/scripts/copy-nginx-conf.sh
echo -e "${GREEN}Copying nginx.conf done${NC}"

# Start Nginx
echo -e "${CYAN}Starting Nginx...${NC}"
service nginx restart
echo -e "${GREEN}Nginx started${NC}"

exit 0
