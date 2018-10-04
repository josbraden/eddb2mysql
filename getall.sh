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
# Convert JSONs to CSVs
# TODO get category from commodities.json into seperate table
json2csv/bin/json2csv.js -f "id","name","category_id","average_price","is_rare","max_buy_price","max_sell_price","min_buy_price","min_sell_price","buy_price_lower_average","sell_price_upper_average","is_non_marketable","ed_id" -i commodities.json -o commodities.csv
# TODO get group from modules.json into seperate table
json2csv/bin/json2csv.js -f "id","group_id","class","rating","price","weapon_mode","missile_type","name","belongs_to","ed_id","ed_symbol","ship" -i modules.json -o modules.csv
