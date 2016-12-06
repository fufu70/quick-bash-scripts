#!/bin/bash

PROFILE_FILE="$HOME/.bash_profile"
CURRENT_PATH="$(pwd)"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

cat $PROFILE_FILE | grep $CURRENT_PATH

if grep -q $CURRENT_PATH $PROFILE_FILE; then
	printf "${RED}Path is already added to your profile${NC}\n"
else 
	echo "export PATH=\"\$PATH:$CURRENT_PATH\"" >> $PROFILE_FILE
	source $PROFILE_FILE
	printf "${GREEN}Path is installed to your profile. You can now access scripts as such: gpush.sh${NC}\n"
fi