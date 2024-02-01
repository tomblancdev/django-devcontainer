# reset head to the original branch
git reset --hard HEAD

template_branch=$(git branch --show-current)

# go back to the previous used branch
git checkout -

# apply stash
git stash apply

# delete branch
git branch -D ${template_branch}
