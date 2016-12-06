#!/bin/bash
# A basic bash script for pushing up commits when a pull does not result in a merge conflict.

git status

echo -n "Would you like to continue [y/N]: "

read CONTINUE

if [ "$CONTINUE" == "y" ]; then
	echo -n "Commit Message: "

	read MESSAGE

	git pull origin master
	git add .
	git commit -m "${MESSAGE}"
	git push origin master
else
	echo "Commit will not be pushed."
fi