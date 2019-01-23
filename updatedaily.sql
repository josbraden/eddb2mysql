--
-- Script to do daily updates to the database
-- Currently only the market listings table makes sense to update on such an aggressive frequency
--
SOURCE ed_import_schema.sql;
DROP TABLE commodities_import,factions_import,modules_import,stations_import,systems_import,bodies_import;
LOAD DATA LOCAL INFILE 'listings.csv' INTO TABLE listings_import FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
TRUNCATE TABLE listings;
INSERT IGNORE INTO listings(eddb_id,station_id,commodity_id,supply,supply_bracket,buy_price,sell_price,demand,demand_bracket,collected_at) SELECT * FROM listings_import;
FLUSH TABLE listings;
DROP TABLE listings_import;
