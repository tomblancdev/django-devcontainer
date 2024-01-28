cd /workspace/.devcontainer/scripts

CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}Starting post-start script...${NC}"

# Update pre-commit
bash ./pre-commit_update.sh

# Display hello message
bash ./hello-message.sh

exit 0
