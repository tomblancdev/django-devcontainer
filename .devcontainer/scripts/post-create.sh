CYAN='\033[0;36m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${CYAN}Runing post-create.sh${NC}"

cd /workspace

bash /workspace/.devcontainer/scripts/git/add-remote-templates.sh

exit 0
