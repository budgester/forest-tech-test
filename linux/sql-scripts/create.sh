#!/bin/sh

# This script takes 2 parametes
# 1: Location of the cnf file with credentials to login to the sql server
# 2: The inital database provisioning script
#
# e.g. create ~/my.cnf db-setup.sql 

echo "Doing initial setup"
mysql --defaults-file=$1 < $2 
