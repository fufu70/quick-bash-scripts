#!/bin/bash
# A basic bash script for pulling up the latest changes.

git status

# Get the current branch
CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"

echo -n "Would you like to see your differences [y/N]: "

read CONTINUE

if [ "$CONTINUE" == "y" ]; then
	git diff
fi
