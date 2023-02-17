#!/usr/bin/env sh
set -eu
ls -alh

/setup-ssh.sh

export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"

branch_name=$(git symbolic-ref --short -q HEAD)
message=$(git log --format=%B -n 1)
git checkout --orphan e3a3bcbf11db4c5e9199e81e21e3d7cf
git add -A
git commit -m '$message'
git remote add mirror "$INPUT_TARGET_REPO_URL"
git push --force mirror "$branch_name"

# NOTE: Since `post` execution is not supported for local action from './' for now, we need to
# run the command by hand.
/cleanup.sh mirror
