-- Script to do daily updates to the database
-- Currently only the market listings table makes sense to update on such an aggressive frequency
TRUNCATE TABLE listings;
LOAD DATA LOCAL INFILE 'listings.csv' INTO TABLE listings FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES (eddb_id,station_id,commodity_id,supply,supply_bracket,buy_price,sell_price,demand,demand_bracket,collected_at);
FLUSH TABLE listings;
