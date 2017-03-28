#!/bin/bash
# The structure of a php - repository usually has some basic virtual machine setup, 
# storage instance, and general code source.
#  
# The initialization process for creating a php repo currently procedes as follows:
# 1.) Get some general information about the repo
# 2.) Clones the given repo and the deadbody repository
# 3.) Fills in deadbody repository
# 4.) Merge the deadbody repo into the current repo
# 5.) Start up vagrant.

# Define some constants
DEADBODY_DIR='deadbody-php'
DEADBODY_REPO_URL='https://github.com/fufu70/deadbody-php' # The PHP Skeleton
MYSQL_PASSWORD='this_is_my_generic_password...needs_to_be_longer' # Password for init. mysql

# NUmba 1
echo -n "URL of the current Repo: "

read REPO_URL

echo -n "Using a DB [y/N]: "

read USE_DB

if [ "$USE_DB" == "y" ]; then
	echo -n "DB password: "
	# actually use this
	read MYSQL_PASSWORD
fi

# Nu M B E R T W O
# Clone the Repo
git clone $REPO_URL .

# Clone the deadbody-repo
git clone $DEADBODY_REPO_URL
rm -rf $DEADBODY_DIR/.git

# nUm83r PH0uR
rsync -avhu --progress "$DEADBODY_DIR/" .
# remove deadbody
rm -rf $DEADBODY_DIR