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


hello_message="""
Welcome to the ${RED}Django${NC} development container!

You are connected as ${RED}${USER}${NC}.

Informations about the container:
    - ${UNDERLINE}Python version${CLEAR}: ${CYAN}$(python --version)${NC}
    - ${UNDERLINE}Container id${CLEAR}: ${CYAN}$(hostname)${NC}
    - ${UNDERLINE}Current branch${CLEAR}: ${CYAN}${branch}${NC}
    - ${UNDERLINE}Current directory${CLEAR}: ${CYAN}$(pwd)${NC}

$(bash /workspace/.devcontainer/scripts/django-message.sh)

You can now start to code!

"""

art=${arts[$RANDOM % ${#arts[@]} ]}

echo -e "${CYAN}${art}${NC}"

echo -e "${GREEN}${hello_message}${NC}"



exit 0
