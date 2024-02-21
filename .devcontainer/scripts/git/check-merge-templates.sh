CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

UNDERLINE='\033[4m'
BOLD='\033[1m'
CLEAR='\033[0m'

function get_unique_remote_name() {
    bash ${APP_HOME}/.devcontainer/scripts/git/get-remote-template-name.sh ${1}
}

function get_check_update_branch_name() {
    template=$(get_unique_remote_name ${1})
    number=$(git rev-list --count ${template}/main)
    echo "MERGE-${template}-${number}"
}

function check_merge_template() {
    current_branch=$(git branch --show-current)

    # create branch to merge
    git branch $(get_check_update_branch_name ${1}) --quiet
    git checkout $(get_check_update_branch_name ${1}) --quiet

    # fetch branch
    git fetch $(get_unique_remote_name ${1}) main --quiet


    merge_message=$(git merge $(get_unique_remote_name ${1})/main --allow-unrelated-histories)

    # reset head to the original branch
    git reset --hard HEAD --quiet

    # go back to the previous used branch
    git checkout ${current_branch} --quiet

    # delete branch
    git branch -D $(get_check_update_branch_name ${1}) --quiet

    # merge branch
    if [[ $merge_message == "Already up to date." ]]; then
        echo -e "up-to-date"
    else
        echo -e "not-up-to-date"
    fi
}

# create list of git template repo urls from string
str=${GIT_TEMPLATE_REPO_URLS}
IFS=','
read -ra git_template_repo_urls <<< "$str"
# trim whitespace
git_template_repo_urls=("${git_template_repo_urls[@]/#/}")

# stash changes to avoid merge conflicts
echo -e "${YELLOW}Stashing changes...${NC}"
git stash
echo -e "${GREEN}Changes stashed successfully${NC}"

echo ""

for git_template_repo_url in ${git_template_repo_urls[@]}; do
    status=$(check_merge_template ${git_template_repo_url})
    if [[ $status == "up-to-date" ]]; then
        status_color="${GREEN}${status}${NC}"
    else
        status_color="${RED}${status}${NC}"
    fi
    echo -e "${CYAN}${git_template_repo_url}${NC} : ${status_color}"
    if [[ $status == "not-up-to-date" ]]; then
        echo -e "${YELLOW}Run ${UNDERLINE}${BOLD}bash ${APP_HOME}/.devcontainer/scripts/git/merge-template.sh ${git_template_repo_url}${CLEAR}${NC} to merge changes into your project"
    fi
    echo ""
done

echo -e "${YELLOW}Restoring stashed changes...${NC}"
git stash apply --quiet
echo -e "${GREEN}Stashed changes restored successfully${NC}"
