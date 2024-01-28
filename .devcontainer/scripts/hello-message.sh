CYAN='\033[0;36m'
GREEN='\033[0;32m'
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

# check if branch is updated from template
git_uno=$(git status template/main -uno)
template_status="unfetched"

if [[ $git_uno == *"Your branch is up to date"* ]]; then
    echo -e "${GREEN}Your branch is up to date with 'template/main'${NC}"
    template_status="${GREEN}up-to-date${NC}"
else
    echo -e "${RED}Your branch is not up to date with 'template/main'${NC}"
    template_status="${RED}not-up-to-date${NC}"
fi

git_template_sync_message="""

You can sync your branch with the template by running the following command:
    ${BOLD}git merge template/main --allow-unrelated-histories${CLEAR}
"""

if [[ $template_status == "${GREEN}up-to-date${NC}" ]]; then
    git_template_sync_message=""
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
