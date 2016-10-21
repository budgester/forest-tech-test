#!/bin/sh

# This script takes 2 parametes
# 1: Location of the cnf file with credentials to login to the sql server
# 2: The folder with the database upgrade scripts
#
# e.g. create ~/my.cnf upgrades


DEFAULTSFILE=$1
UPGRADEFOLDER=$2

cd $2

for upgrade in *.sql; do
	CURRENT_DB_VERSION=`mysql --defaults-file=$DEFAULTSFILE -sNe "use forest; select version from version"`
	UPGRADE_VERSION=`echo $upgrade | grep -o '[0-9]\+'`

	if [ "$UPGRADE_VERSION" -le "$CURRENT_DB_VERSION" ]
	then
		echo "Upgrade Version: $UPGRADE_VERSION, Database Version:  $CURRENT_DB_VERSION - Not running"
	else
		echo "Upgrading to $UPGRADE_VERSION"
		mysql --defaults-file=$DEFAULTSFILE forest < $upgrade
		mysql --defaults-file=$DEFUALTSFILE -e "use forest; update version set version=$UPGRADE_VERSION"
	fi
done
