#!/usr/bin/env sh
set -eu

/setup-ssh.sh

export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"

message=$(git log --format=%B -n 1)
rm -fr .git/
git init
git add .
git commit -m '$message'
git remote add mirror "$INPUT_TARGET_REPO_URL"
git push --force --prune mirror

# NOTE: Since `post` execution is not supported for local action from './' for now, we need to
# run the command by hand.
/cleanup.sh mirror
