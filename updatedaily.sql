--
-- Script to do daily updates to the database
-- Currently only the market listings table makes sense to update on such an aggressive frequency
--
TRUNCATE TABLE listings;
LOAD DATA LOCAL INFILE 'listings.csv' INTO TABLE listings(eddb_id,station_id,commodity_id,supply,supply_bracket,buy_price,sell_price,demand,demand_bracket,collected_at) FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
FLUSH TABLE listings;
