CYAN='\033[0;36m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${CYAN}Runing post-create.sh${NC}"

cd /workspace

# if GIT_TEMPLATE_REPO_URL and GIT_TEMPLATE_REMOTE_NAME is set
if [[ ! -z "${GIT_TEMPLATE_REPO_URL}" ]] && [[ ! -z "${GIT_TEMPLATE_REMOTE_NAME}" ]]; then
    echo -e "${CYAN}Adding git template remote${NC}"
    # add git template to remote only for pull
    git remote add ${GIT_TEMPLATE_REMOTE_NAME} ${GIT_TEMPLATE_REPO_URL}
    git remote set-url --push template DISABLED
else
    echo -e "${YELLOW}GIT_TEMPLATE_REPO_URL or GIT_TEMPLATE_REMOTE_NAME are not not set${NC}"
fi


exit 0
