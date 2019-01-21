#!/bin/bash
# Daily update script, if the listings table needs to be updated more frequently that once a week
rm -f listings.csv
wget -O - -S --header="accept-encoding: gzip" https://eddb.io/archive/v5/listings.csv | gzip -dc > listings.csv
if [ ! -f ./mysqlinfo.txt ]; then
	echo "MySQL info not found, please run updatedaily.sql manually to update the database"
	echo "e.g.: $ mysql -u root -p -h localhost ed < updatedaily.sql"
else
	source mysqlinfo.txt
	mysql -u $mysqluser -p$mysqlpass -h $mysqhost $mysqldb < updatedaily.sql
fi
