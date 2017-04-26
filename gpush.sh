#!/bin/bash
# A basic bash script for pushing up commits when a pull does not result in a merge conflict.

git status

# Get the current branch
CURRENT_BRANCH = "$(git rev-parse --abbrev-ref HEAD)"

echo -n "Would you like to continue [y/N]: "

read CONTINUE

if [ "$CONTINUE" == "y" ]; then
	echo -n "Commit Message: "

	read MESSAGE

	git pull origin $CURRENT_BRANCH
	git add .
	git commit -m "${MESSAGE}"
	git push origin $CURRENT_BRANCH
else
	echo "Commit will not be pushed."
fi
