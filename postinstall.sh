#!/bin/bash

WORKSPACE=`git rev-parse --show-toplevel`
if [ $? -ne 0 ];
then
  echo -e "\033[41;37mFailed to install. You should execute this script inside a git repository.\033[0m"
  exit 0
fi

echo -e "\033[32mStart to install ESLint...\033[0m"

# Copy config
cp eslintrc.yaml ${WORKSPACE}/.eslintrc.yaml

# Copy git hooks
GIT_HOOK_DIR=${WORKSPACE}/.git/hooks
rm ${GIT_HOOK_DIR}/pre-commit
cp git_hooks/pre-commit ${GIT_HOOK_DIR}/

# Make script executable
chmod +x ${GIT_HOOK_DIR}/pre-commit

# Finished
echo -e "\033[32mESLint installed.\033[0m"
