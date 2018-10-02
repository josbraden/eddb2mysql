# eddb2mysql
Quick scripts to import data dumps from eddb.io into mysql

## Usage

### New Database

1. Download systems.csv, factions.csv, and listings.csv from: https://eddb.io/api

2. Run the rebuild.sql script against the database to use, e.g:

`mysql -u root -p ed < rebuild.sql`

### Update Existing Database

1. Download systems_recently.csv from: https://eddb.io/api

2. Run update.sql against the existing database

systems_recently.csv gets generated once a week on eddb.io
