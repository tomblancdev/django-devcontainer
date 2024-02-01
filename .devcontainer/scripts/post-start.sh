cd /workspace/.devcontainer/scripts

CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}Starting post-start script...${NC}"

# Fetch all branches from git
git fetch --all

# Pull current branch from git
git pull

# Update pre-commit
bash ./pre-commit_update.sh

# Install Poetry
bash ./poetry.sh

# check if git template repo are up-to-date
template_repo_status=$(bash ./git/check-merge-templates.sh)

# Display hello message
bash ./hello-message.sh

if [[ $template_repo_status == *"not-up-to-date"* ]]; then
    echo -e "${RED}Your template repo are not up-to-date!${NC}"
    echo -e "${RED}Run ${CYAN}bash /workspace/.devcontainer/scripts/git/check-merge-templates.sh${RED} to check your template status${NC}"
else
    echo -e "${GREEN}Your template repo are up-to-date!${NC}"
fi

exit 0
