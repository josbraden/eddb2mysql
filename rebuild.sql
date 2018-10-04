--
-- Script to build the ed database from scratch using data dump files from eddb.io
--
-- Required files:
--   Schemas:
--     ed_schema.sql: Main db schema
--     ed_import_schema.sql: CSV import schemas
--   Data files:
--     factions.csv
--     listings.csv
--     systems.csv

--
-- Import schemas to db
--
SOURCE ed_schema.sql;
SOURCE ed_import_schema.sql;

--
-- Load CSVs into import tables
-- TODO switch to direct field insert instead of using import tables
--
LOAD DATA LOCAL INFILE 'factions.csv' INTO TABLE factions_import FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'listings.csv' INTO TABLE listings_import FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'systems.csv' INTO TABLE systems_import FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
FLUSH TABLE factions_import,listings_import,systems_import;

-- TODO build commodities and modules tables from CSVs here

--
-- Build non-system auxiliary tables (factions and listings)
--
INSERT IGNORE INTO factions(eddb_id,name,updated_at,government_id,allegiance_id,state_id,home_system_id,is_player_faction) SELECT eddb_id,name,updated_at,government_id,allegiance_id,state_id,home_system_id,is_player_faction FROM factions_import;
INSERT IGNORE INTO listings(eddb_id,station_id,commodity_id,supply,supply_bracket,buy_price,sell_price,demand,demand_bracket,collected_at) SELECT * FROM listings_import;
FLUSH TABLE factions,listings;

--
-- Build system auxiliary tables
--
INSERT IGNORE INTO allegiance(allegiance_id,allegiance) SELECT DISTINCT allegiance_id,allegiance FROM systems_import;
INSERT IGNORE INTO controlling_minor_faction(controlling_minor_faction_id,controlling_minor_faction) SELECT DISTINCT controlling_minor_faction_id,controlling_minor_faction FROM systems_import;
INSERT IGNORE INTO government(government_id,government) SELECT DISTINCT government_id,government FROM systems_import;
INSERT IGNORE INTO power_state(power_state_id,power_state) SELECT DISTINCT power_state_id,power_state FROM systems_import;
INSERT IGNORE INTO primary_economy(primary_economy_id,primary_economy) SELECT DISTINCT primary_economy_id,primary_economy FROM systems_import;
INSERT IGNORE INTO reserve_type(reserve_type_id,reserve_type) SELECT DISTINCT reserve_type_id,reserve_type FROM systems_import;
INSERT IGNORE INTO security(security_id,security) SELECT DISTINCT security_id,security FROM systems_import;
INSERT IGNORE INTO state(state_id,state) SELECT DISTINCT state_id,state FROM systems_import;
FLUSH TABLE allegiance,controlling_minor_faction,government,power_state,primary_economy,reserve_type,security,state;

--
-- Build system table, this is the big table
--
INSERT IGNORE INTO systems(eddb_id,edsm_id,name,x,y,z,population,is_populated,government_id,allegiance_id,state_id,security_id,primary_economy_id,power,power_state_id,needs_permit,updated_at,controlling_minor_faction_id,reserve_type_id) SELECT eddb_id,edsm_id,name,x,y,z,population,is_populated,government_id,allegiance_id,state_id,security_id,primary_economy_id,power,power_state_id,needs_permit,updated_at,controlling_minor_faction_id,reserve_type_id FROM systems_import;
FLUSH TABLE systems;

--
-- Drop import tables
--
DROP TABLE factions_import,listings_import,systems_import;

--
-- Optimize new tables post bulk-insert
--
OPTIMIZE TABLE factions,listings,allegiance,controlling_minor_faction,government,power_state,primary_economy,reserve_type,security,state,systems;
