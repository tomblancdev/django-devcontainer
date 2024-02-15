cd ${APP_HOME}

CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}Updating pre-commit...${NC}"
pre-commit install

echo -e "${CYAN}Updating pre-commit hooks...${NC}"
pre-commit autoupdate

echo -e "${CYAN}Installing pre-commit hooks...${NC}"
pre-commit install-hooks

echo -e "${GREEN}pre-commit updated successfully!${NC}"

exit 0
