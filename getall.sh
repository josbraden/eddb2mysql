#!/bin/bash
#
# Script needs to:
# 1. Download required files from web
# 2. Convert JSON files to CSV for MySQL load using json2csv
#
# Downloads data files from web
echo "Downloading data files"
if [ ! -f ./factions.csv ]; then
	wget -O - -S --header="accept-encoding: gzip" https://eddb.io/archive/v5/factions.csv | gzip -dc > factions.csv
fi
if [ ! -f ./listings.csv ]; then
	wget -O - -S --header="accept-encoding: gzip" https://eddb.io/archive/v5/listings.csv | gzip -dc > listings.csv
fi
if [ ! -f ./systems.csv ]; then
	wget -O - -S --header="accept-encoding: gzip" https://eddb.io/archive/v5/systems.csv | gzip -dc > systems.csv
fi
if [ ! -f ./commodities.json ]; then
	wget -O - -S --header="accept-encoding: gzip" https://eddb.io/archive/v5/commodities.json | gzip -dc > commodities.json
fi
if [ ! -f ./modules.json ]; then
	wget -O - -S --header="accept-encoding: gzip" https://eddb.io/archive/v5/modules.json | gzip -dc > modules.json
fi
if [ ! -f ./stations.json ]; then
	wget -O - -S --header="accept-encoding: gzip" https://eddb.io/archive/v5/stations.json | gzip -dc > stations.json
fi
if [ ! -f ./bodies.json ]; then
	wget -O - -S --header="accept-encoding: gzip" https://www.edsm.net/dump/bodies.json | gzip -dc > bodies.json
fi
# Convert JSONs to CSVs
# TODO get category from commodities.json into seperate table
json2csv/bin/json2csv.js -f "id","name","category_id","average_price","is_rare","max_buy_price","max_sell_price","min_buy_price","min_sell_price","buy_price_lower_average","sell_price_upper_average","is_non_marketable","ed_id" -i commodities.json -o commodities.csv
# TODO get group from modules.json into seperate table
json2csv/bin/json2csv.js -f "id","group_id","class","rating","price","weapon_mode","missile_type","name","belongs_to","ed_id","ed_symbol","ship" -i modules.json -o modules.csv
# TODO build 'type' table from stations.json
# TODO missing fields on stations:
# "import_commodities","export_commodities","prohibited_commodities","economies","selling_ships","selling_modules"
json2csv/bin/json2csv.js -f "id","name","system_id","updated_at","max_landing_pad_size","distance_to_star","government_id","allegiance_id","state_id","type_id","type","has_blackmarket","has_market","has_refuel","has_repair","has_rearm","has_outfitting","has_shipyard","has_docking","has_commodities","shipyard_updated_at","outfitting_updated_at","market_updated_at","is_planetary","settlement_size_id","settlement_size","settlement_security_id","settlement_security","body_id","controlling_minor_faction_id" -i stations.json -o stations.csv
# Missing fields in bodies:
# "discovery","parents","belts"
json2csv/bin/json2csv.js -f "id","id64","bodyId","name","type","subType","offset","distanceToArrival","isMainStar","isScoopable","age","spectralClass","luminosity","absoluteMagnitude","solarMasses","solarRadius","surfaceTemperature","orbitalPeriod","semiMajorAxis","orbitalEccentricity","orbitalInclination","argOfPeriapsis","rotationalPeriod","rotationalPeriodTidallyLocked","axialTilt","updateTime","systemId","systemId64","systemName" -i bodies.json -o bodies.csv
# Cleaning bodies.json to save disk space
rm -f bodies.json
