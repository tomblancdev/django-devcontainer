CYAN='\033[0;36m'
NC='\033[0m' # No Color

related_git_template="https://github.com/tomblancdev/python-devcontainer.git"

cd /workspace
# add git template to remote only for pull
git remote add template $related_git_template
git remote set-url --push template DISABLE


echo -e "${CYAN}Runing post-create.sh${NC}"

exit 0
