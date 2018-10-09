#!/bin/bash
# Script to download delta data for import
rm -f systems_recently.csv bodies7days.csv listings.csv
echo "Downloading new data for update"
wget -O - -S --header="accept-encoding: gzip" https://eddb.io/archive/v5/systems_recently.csv | gzip -dc > systems_recently.csv
wget -O - -S --header="accept-encoding: gzip" https://eddb.io/archive/v5/listings.csv | gzip -dc > listings.csv
wget -O - -S --header="accept-encoding: gzip" https://www.edsm.net/dump/bodies7days.json | gzip -dc | json2csv/bin/json2csv.js -f "id","id64","bodyId","name","type","subType","offset","distanceToArrival","isMainStar","isScoopable","age","spectralClass","luminosity","absoluteMagnitude","solarMasses","solarRadius","surfaceTemperature","orbitalPeriod","semiMajorAxis","orbitalEccentricity","orbitalInclination","argOfPeriapsis","rotationalPeriod","rotationalPeriodTidallyLocked","axialTilt","updateTime","systemId","systemId64","systemName" > bodies7days.csv
echo "File downloads complete, run update.sql to update the database."
