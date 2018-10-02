#!/bin/bash
# Script to just download systems_recently from eddb.io
rm -f systems_recently.csv
wget -O - -S --header="accept-encoding: gzip" https://eddb.io/archive/v5/systems_recently.csv | gzip -dc > systems_recently.csv
echo "File download complete, run update.sql to update the database."
