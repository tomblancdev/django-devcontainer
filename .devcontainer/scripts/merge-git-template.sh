cd /workspace


# if GIT_TEMPLATE_REPO_URL and GIT_TEMPLATE_REMOTE_NAME an MERGE_GIT_TEMPLATE_ON_START is set
if [[ ! -z "${GIT_TEMPLATE_REPO_URL}" ]] && [[ ! -z "${GIT_TEMPLATE_REMOTE_NAME}" ]]; then
    # fetch branch
    git fetch ${GIT_TEMPLATE_REMOTE_NAME} main --quiet

    merge_message=$(git merge ${GIT_TEMPLATE_REMOTE_NAME}/main --allow-unrelated-histories)

    # merge branch
    if [[ $merge_message == "Already up to date." ]]; then
        echo -e "up-to-date"
    else
        # abort merge
        git merge --abort
        echo -e "not-up-to-date"
    fi
else
    echo -e "not-set"
fi

exit 0
