remote_url=${1}

echo "${GIT_TEMPLATE_REMOTE_NAME}-$(echo ${remote_url} | sed -e 's/[^A-Za-z0-9._-]/-/g')"
