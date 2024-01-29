CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'
BOLD="\e[1m"
UNDERLINE="\e[4m"
CLEAR="\e[0m"

RANDOM=$$$(date +%s)

arts=(
"""
██╗  ██╗███████╗██╗     ██╗      ██████╗     ██╗    ██╗ ██████╗ ██████╗ ██╗     ██████╗ ██╗
██║  ██║██╔════╝██║     ██║     ██╔═══██╗    ██║    ██║██╔═══██╗██╔══██╗██║     ██╔══██╗██║
███████║█████╗  ██║     ██║     ██║   ██║    ██║ █╗ ██║██║   ██║██████╔╝██║     ██║  ██║██║
██╔══██║██╔══╝  ██║     ██║     ██║   ██║    ██║███╗██║██║   ██║██╔══██╗██║     ██║  ██║╚═╝
██║  ██║███████╗███████╗███████╗╚██████╔╝    ╚███╔███╔╝╚██████╔╝██║  ██║███████╗██████╔╝██╗
╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝      ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝
"""
"""
██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗    ██╗
██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝    ██║
██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗      ██║
██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝      ╚═╝
╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗    ██╗
 ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝    ╚═╝
"""
"""
███████╗████████╗ █████╗ ██████╗ ████████╗        ██╗██╗██╗
██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝        ██║██║██║
███████╗   ██║   ███████║██████╔╝   ██║           ██║██║██║
╚════██║   ██║   ██╔══██║██╔══██╗   ██║           ╚═╝╚═╝╚═╝
███████║   ██║   ██║  ██║██║  ██║   ██║           ██╗██╗██╗
╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝           ╚═╝╚═╝╚═╝
"""
)

# get current branch
branch=$(git branch | grep \* | cut -d ' ' -f2)

# call merge-git-template.sh
template_status=$(bash /workspace/.devcontainer/scripts/merge-git-template.sh)

if [[ $template_status == "up-to-date" ]]; then
    template_status="${GREEN}${template_status}${NC}"
elif [[ $template_status == "not-up-to-date" ]]; then
    template_status="${RED}${template_status}${NC}"
else
    template_status="${YELLOW}${template_status}${NC}"
fi

git_template_sync_message=""


if [[ $template_status == "${RED}not-up-to-date${NC}" ]]; then
    git_template_sync_message="""

You can sync your branch with the template by running the following command:
    ${BOLD}git merge template/main --allow-unrelated-histories${CLEAR}
"""
fi


hello_message="""
Welcome to the ${RED}Python${NC} development container!

You are connected as ${RED}${USER}${NC}.

Informations about the container:
    - ${UNDERLINE}Python version${CLEAR}: ${CYAN}$(python --version)${NC}
    - ${UNDERLINE}Container id${CLEAR}: ${CYAN}$(hostname)${NC}
    - ${UNDERLINE}Current branch${CLEAR}: ${CYAN}${branch}${NC}
    - ${UNDERLINE}Template status${CLEAR}: ${template_status}${git_template_sync_message}
    - ${UNDERLINE}Current directory${CLEAR}: ${CYAN}$(pwd)${NC}

You can now start to code!

"""

art=${arts[$RANDOM % ${#arts[@]} ]}

echo -e "${CYAN}${art}${NC}"

echo -e "${GREEN}${hello_message}${NC}"



exit 0
