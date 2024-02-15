cd ${APP_HOME}

CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


function get_unique_remote_name() {
    bash ${APP_HOME}/.devcontainer/scripts/git/get-remote-template-name.sh ${1}
}

create_remote() {
    # add remote
    echo -e "${CYAN}Adding remote ${1}...${NC}"
    git remote add $(get_unique_remote_name ${1}) ${1}
    # set push url to disabled
    git remote set-url --push $(get_unique_remote_name ${1}) DISABLED
    echo -e "${GREEN}Remote ${1} created successfully as ${CYAN}$(get_unique_remote_name ${1})${NC}"
}

function delete_template_remotes() {
    # get list of remotes
    remotes=$(git remote)

    # split string into array for each line break
    IFS=$'\n'
    read -rd '' -a remotes <<<"$remotes"

    # loop through remotes
    for remote in ${remotes[@]}; do
        # if remote start with template
        if [[ $remote == ${GIT_TEMPLATE_REMOTE_NAME}* ]]; then
            # delete remote
            git remote remove ${remote}
        fi
    done
}

# create list of git template repo urls from string
str=${GIT_TEMPLATE_REPO_URLS}
IFS=','
read -ra git_template_repo_urls <<< "$str"
# trim whitespace
for i in "${!git_template_repo_urls[@]}"; do
    git_template_repo_urls[$i]=$(echo -e "${git_template_repo_urls[$i]}" | tr -d ' ')
done


echo -e "${YELLOW}Deleting previous template remotes...${NC}"
delete_template_remotes
echo -e "${GREEN}Previous template remotes deleted successfully${NC}"

for git_template_repo_url in ${git_template_repo_urls[@]}; do
    create_remote ${git_template_repo_url}
done

exit 0
