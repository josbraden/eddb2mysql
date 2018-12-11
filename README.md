# eddb2mysql

Quick scripts to import data dumps from eddb.io into mysql

EDSM is used for the bodies table, all other data including systems and stations comes from EDDB.io

## Requirements

- A running, connectable SQL server (tested on MySQL and MariaDB)
- A database and user with the following permissions
  - SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, and LOCK
  - Ability to execute LOAD DATA INFILE LOCAL, which might require secure mode being off, or executing from a diretory that's allowed to load files. Depending on your setup this might also require FILE permissions
  - RELOAD privileges for the FLUSH command
- wget and gzip to download files
- Node.js is required for json2csv

## New Database Setup

1. Download the data dump files: run getall.sh to automatically download and convert the data files from JSON to CSV
2. Run the rebuild.sql script against the database to use, e.g:

`mysql -u root -p ed < rebuild.sql`

## Update Existing Database

1. Run getupdate.sh to fetch recently changed systems, bodies, and market listings
2. Run update.sql against the existing database

Recently changed systems and bodies are update once a week on EDDB and EDSM. The listings table saw ~10% change the first week of October 2018.

Currently the update script doesn't check to see if, for example, a new allegiance has been formed. In the case of something in the auxiliary tables get added/removed/modified, the easiest recourse is to rebuild the database. Since the DB is pretty small it hopefully isn't that big a deal.

## Contrib
### json2csv (zemirco/json2csv)

https://github.com/zemirco/json2csv

http://zemirco.github.io/json2csv

Included under MIT license, used to process JSON files into CSV for easier import to MySQL
