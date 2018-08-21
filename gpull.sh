#!/bin/bash
# A basic bash script for pulling up the latest changes.

git status

# Get the current branch
CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"

echo -n "Would you like to continue [y/N]: "

read CONTINUE

if [ "$CONTINUE" == "y" ]; then
	git pull origin $CURRENT_BRANCH
else
	echo "No pull made."
fi
