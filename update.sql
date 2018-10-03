--
-- Script to update the systems table with new values from a systems_recently.csv
-- Also requires the ed_import_schema.sql file
--

-- Add import tables
-- Note: only the systems_import table is needed, but for simplicity sake keeping the three bundled in one file
SOURCE ed_import_schema.sql;
DROP TABLE factions_import,listings_import;

-- Load CSV data
LOAD DATA LOCAL INFILE 'systems_recently.csv' INTO TABLE systems_import FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
FLUSH TABLE systems_import;

-- Merge imported data with systems table via DELETE+INSERT
DELETE FROM systems WHERE eddb_id IN (SELECT eddb_id FROM systems_import);
INSERT IGNORE INTO systems (eddb_id,edsm_id,name,x,y,z,population,is_populated,government_id,allegiance_id,state_id,security_id,primary_economy_id,power,power_state_id,needs_permit,updated_at,controlling_minor_faction_id,reserve_type_id) SELECT eddb_id,edsm_id,name,x,y,z,population,is_populated,government_id,allegiance_id,state_id,security_id,primary_economy_id,power,power_state_id,needs_permit,updated_at,controlling_minor_faction_id,reserve_type_id FROM systems_import;
FLUSH TABLE systems;

-- Cleanup import data
DROP TABLE systems_import;

-- Re-index and optimize system table
-- Probably only needs to happen every other month or so, but keeping on every update for now
SET @newid=0;
UPDATE systems SET id=(@newid:=@newid+1) ORDER BY id;
OPTIMIZE TABLE systems;
