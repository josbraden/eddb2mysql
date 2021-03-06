-- Script to update the database with new data
-- Delta fields, systems_recently.csv and bodies7days.json, are released weekly
-- The listings table is also rebuilt, it sees ~10% change per week
-- Also requires the ed_import_schema.sql file

-- Add import tables
SOURCE ed_import_schema.sql;
CREATE TEMPORARY TABLE bodies_import SELECT * FROM bodies LIMIT 0;
DROP TABLE stations_import;

-- listings table rebuild
SELECT 'Updating listings table' AS '';
TRUNCATE TABLE listings;
LOAD DATA LOCAL INFILE 'listings.csv' INTO TABLE listings FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES (eddb_id,station_id,commodity_id,supply,supply_bracket,buy_price,sell_price,demand,demand_bracket,collected_at);
FLUSH TABLE listings;
SELECT 'Done updating listings table' AS '';

-- Load CSV data
LOAD DATA LOCAL INFILE 'systems_recently.csv' INTO TABLE systems_import FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'bodies7days.csv' INTO TABLE bodies_import FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES (eddb_id,bodyId,name,type,subType,offset,distanceToArrival,isMainStar,isScoopable,age,spectralClass,luminosity,absoluteMagnitude,solarMasses,solarRadius,surfaceTemperature,orbitalPeriod,semiMajorAxis,orbitalEccentricity,orbitalInclination,argOfPeriapsis,rotationalPeriod,rotationalPeriodTidallyLocked,axialTilt,updateTime,systemId);
FLUSH TABLE systems_import,bodies_import;
SELECT COUNT(*) FROM systems_import AS systems_import_knt;
SELECT COUNT(*) FROM bodies_import AS bodies_import_knt;

-- Merge imported data with tables via DELETE+INSERT
-- systems and graph tables
SELECT COUNT(*) FROM systems AS systems_knt_old;
SELECT COUNT(*) FROM systems WHERE eddb_id IN (SELECT eddb_id FROM systems_import) AS systems_todelete;
SELECT COUNT(*) FROM graph WHERE systems_id IN (SELECT id FROM systems WHERE eddb_id IN (SELECT eddb_id FROM systems_import)) AS graph_todelete;
-- Clean graph table when deleting from systems
-- This should probably be a JOIN instead of a nested select
DELETE FROM graph WHERE systems_id IN (SELECT id FROM systems WHERE eddb_id IN (SELECT eddb_id FROM systems_import));
DELETE FROM systems WHERE eddb_id IN (SELECT eddb_id FROM systems_import);
INSERT IGNORE INTO systems(eddb_id,edsm_id,name,x,y,z,population,is_populated,government_id,allegiance_id,state_id,security_id,primary_economy_id,power,power_state_id,needs_permit,updated_at,controlling_minor_faction_id,reserve_type_id) SELECT eddb_id,edsm_id,name,x,y,z,population,is_populated,government_id,allegiance_id,state_id,security_id,primary_economy_id,power,power_state_id,needs_permit,updated_at,controlling_minor_faction_id,reserve_type_id FROM systems_import;
SELECT COUNT(*) FROM systems AS systems_knt_new;
-- bodies
SELECT COUNT(*) FROM bodies AS bodies_knt_old;
SELECT COUNT(*) FROM bodies WHERE eddb_id IN (SELECT eddb_id FROM bodies_import) AS bodies_todelete;
DELETE FROM bodies WHERE eddb_id IN (SELECT eddb_id FROM bodies_import);
INSERT IGNORE INTO bodies(eddb_id,bodyId,name,type,subType,offset,distanceToArrival,isMainStar,isScoopable,age,spectralClass,luminosity,absoluteMagnitude,solarMasses,solarRadius,surfaceTemperature,orbitalPeriod,semiMajorAxis,orbitalEccentricity,orbitalInclination,argOfPeriapsis,rotationalPeriod,rotationalPeriodTidallyLocked,axialTilt,updateTime,systemId) SELECT (eddb_id,bodyId,name,type,subType,offset,distanceToArrival,isMainStar,isScoopable,age,spectralClass,luminosity,absoluteMagnitude,solarMasses,solarRadius,surfaceTemperature,orbitalPeriod,semiMajorAxis,orbitalEccentricity,orbitalInclination,argOfPeriapsis,rotationalPeriod,rotationalPeriodTidallyLocked,axialTilt,updateTime,systemId) FROM bodies_import;
SELECT COUNT(*) FROM bodies AS bodies_knt_new;
FLUSH TABLE systems,bodies;

-- Cleanup import data
DROP TABLE bodies_import,systems_import;
