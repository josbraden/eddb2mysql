#!/bin/bash
# Downloads data files needed for rebuild.sql
if [ ! -f ./factions.csv ]; then
	wget -O - -S --header="accept-encoding: gzip" https://eddb.io/archive/v5/factions.csv | gzip -dc > factions.csv
fi
if [ ! -f ./listings.csv ]; then
	wget -O - -S --header="accept-encoding: gzip" https://eddb.io/archive/v5/listings.csv | gzip -dc > listings.csv
fi
if [ ! -f ./systems.csv ]; then
	wget -O - -S --header="accept-encoding: gzip" https://eddb.io/archive/v5/systems.csv | gzip -dc > systems.csv
fi
echo "File downloads complete, run rebuild.sql to build the database."
