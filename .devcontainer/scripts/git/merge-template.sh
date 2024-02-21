# get git template remote name from url pass as argument
# create function to get unique remote name that will take in argument a GIT_TEMPLATE_REPO_URL
function get_unique_remote_name() {
    bash ${APP_HOME}/.devcontainer/scripts/git/get-remote-template-name.sh ${1}
}

function get_branch_name() {
    template=$(get_unique_remote_name ${1})
    number=$(git rev-list --count ${template}/main)
    echo "MERGE-${template}-${number}"
}


# get git commit number from url pass as argument


echo $(get_unique_remote_name ${1})

# create branch from template name
git branch $(get_branch_name ${1})

git checkout $(get_branch_name ${1})

# fetch branch
git fetch $(get_unique_remote_name ${1}) main --quiet

# merge branch
git merge $(get_unique_remote_name ${1})/main --allow-unrelated-histories

echo """

Merge done!

You can now merge your branch with the main branch.

If you want to abort the merge, run:

    bash ${APP_HOME}/.devcontainer/scripts/git/abort-merge-template.sh

"""
