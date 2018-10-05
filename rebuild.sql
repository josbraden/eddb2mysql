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
--     commodities.csv: generated from commodities.json
--     modules.csv: generated from modules.json
--     stations.csv: generated from stations.json

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
LOAD DATA LOCAL INFILE 'commodities.csv' INTO TABLE commodities_import FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'modules.csv' INTO TABLE modules_import FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'stations.csv' INTO TABLE stations_import FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
FLUSH TABLE factions_import,listings_import,systems_import,commodities_import,modules_import,stations_import;

--
-- Build non-system auxiliary tables (factions and listings)
--
INSERT IGNORE INTO factions(eddb_id,name,updated_at,government_id,allegiance_id,state_id,home_system_id,is_player_faction) SELECT eddb_id,name,updated_at,government_id,allegiance_id,state_id,home_system_id,is_player_faction FROM factions_import;
INSERT IGNORE INTO listings(eddb_id,station_id,commodity_id,supply,supply_bracket,buy_price,sell_price,demand,demand_bracket,collected_at) SELECT * FROM listings_import;
INSERT IGNORE INTO commodities(eddb_id,name,category_id,average_price,is_rare,max_buy_price,max_sell_price,min_buy_price,min_sell_price,buy_price_lower_average,sell_price_upper_average,is_non_marketable,ed_id) SELECT * FROM commodities_import;
INSERT IGNORE INTO modules(eddb_id,group_id,class,rating,price,weapon_mode,missile_type,name,belongs_to,ed_id,ed_symbol,ship) SELECT * FROM modules_import;
FLUSH TABLE factions,listings,commodities,modules;

--
-- Build stations and stations auxiliary table(s)
--
INSERT IGNORE INTO stations(eddb_id,name,system_id,updated_at,max_landing_pad_size,distance_to_star,government_id,allegiance_id,state_id,type_id,has_blackmarket,has_market,has_refuel,has_repair,has_rearm,has_outfitting,has_shipyard,has_docking,has_commodities,shipyard_updated_at,outfitting_updated_at,market_updated_at,is_planetary,settlement_size_id,settlement_size,settlement_security_id,body_id,controlling_minor_faction_id) SELECT eddb_id,name,system_id,updated_at,max_landing_pad_size,distance_to_star,government_id,allegiance_id,state_id,type_id,has_blackmarket,has_market,has_refuel,has_repair,has_rearm,has_outfitting,has_shipyard,has_docking,has_commodities,shipyard_updated_at,outfitting_updated_at,market_updated_at,is_planetary,settlement_size_id,settlement_size,settlement_security_id,body_id,controlling_minor_faction_id FROM stations_import;
INSERT IGNORE INTO type(type_id,type) SELECT DISTINCT type_id,type FROM stations_import;
FLUSH TABLE stations,type;

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
DROP TABLE factions_import,listings_import,systems_import,commodities_import,modules_import,stations_import;

--
-- Optimize new tables post bulk-insert
--
OPTIMIZE TABLE factions,listings,allegiance,controlling_minor_faction,government,power_state,primary_economy,reserve_type,security,state,systems,commodities,modules;
