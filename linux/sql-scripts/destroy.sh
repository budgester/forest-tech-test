#!/bin/sh

echo "Destroying Database"
mysql --defaults-file=forest.cnf -e "drop database forest;"


