#!/bin/bash
# Script to download delta data for import
rm -f systems_recently.csv bodies7days.csv listings.csv
echo "Downloading new data for update"
wget -O - -S --header="accept-encoding: gzip" https://eddb.io/archive/v5/systems_recently.csv | gzip -dc > systems_recently.csv
wget -O - -S --header="accept-encoding: gzip" https://eddb.io/archive/v5/listings.csv | gzip -dc > listings.csv
wget -O - -S --header="accept-encoding: gzip" https://www.edsm.net/dump/bodies7days.json | gzip -dc | json2csv/bin/json2csv.js -f "id","id64","bodyId","name","type","subType","offset","distanceToArrival","isMainStar","isScoopable","age","spectralClass","luminosity","absoluteMagnitude","solarMasses","solarRadius","surfaceTemperature","orbitalPeriod","semiMajorAxis","orbitalEccentricity","orbitalInclination","argOfPeriapsis","rotationalPeriod","rotationalPeriodTidallyLocked","axialTilt","updateTime","systemId","systemId64","systemName" > bodies7days.csv
echo "File downloads complete."
if [ ! -f ./mysqlinfo.txt ]; then
	echo "MySQL info not found, please run updateweekly.sql manually to update the database"
	echo "e.g.: $ mysql -u root -p -h localhost ed < updateweekly.sql"
else
	source mysqlinfo.txt
	mysql -u $mysqluser -p$mysqlpass -h $mysqhost $mysqldb < updateweekly.sql
fi
