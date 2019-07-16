-- Build stations and stations auxiliary table(s)
INSERT IGNORE INTO stations(eddb_id,name,system_id,updated_at,max_landing_pad_size,distance_to_star,government_id,allegiance_id,state_id,type_id,has_blackmarket,has_market,has_refuel,has_repair,has_rearm,has_outfitting,has_shipyard,has_docking,has_commodities,shipyard_updated_at,outfitting_updated_at,market_updated_at,is_planetary,settlement_size_id,settlement_size,settlement_security_id,body_id,controlling_minor_faction_id) SELECT eddb_id,name,system_id,updated_at,max_landing_pad_size,distance_to_star,government_id,allegiance_id,state_id,type_id,has_blackmarket,has_market,has_refuel,has_repair,has_rearm,has_outfitting,has_shipyard,has_docking,has_commodities,shipyard_updated_at,outfitting_updated_at,market_updated_at,is_planetary,settlement_size_id,settlement_size,settlement_security_id,body_id,controlling_minor_faction_id FROM stations_import;
INSERT IGNORE INTO type(type_id,type) SELECT DISTINCT type_id,type FROM stations_import;

-- Build systems and auxiliary tables
INSERT IGNORE INTO systems(eddb_id,edsm_id,name,x,y,z,population,is_populated,government_id,allegiance_id,state_id,security_id,primary_economy_id,power,power_state_id,needs_permit,updated_at,controlling_minor_faction_id,reserve_type_id) SELECT eddb_id,edsm_id,name,x,y,z,population,is_populated,government_id,allegiance_id,state_id,security_id,primary_economy_id,power,power_state_id,needs_permit,updated_at,controlling_minor_faction_id,reserve_type_id FROM systems_import;
INSERT IGNORE INTO allegiance(allegiance_id,allegiance) SELECT DISTINCT allegiance_id,allegiance FROM systems_import;
INSERT IGNORE INTO controlling_minor_faction(controlling_minor_faction_id,controlling_minor_faction) SELECT DISTINCT controlling_minor_faction_id,controlling_minor_faction FROM systems_import;
INSERT IGNORE INTO government(government_id,government) SELECT DISTINCT government_id,government FROM systems_import;
INSERT IGNORE INTO power_state(power_state_id,power_state) SELECT DISTINCT power_state_id,power_state FROM systems_import;
INSERT IGNORE INTO primary_economy(primary_economy_id,primary_economy) SELECT DISTINCT primary_economy_id,primary_economy FROM systems_import;
INSERT IGNORE INTO reserve_type(reserve_type_id,reserve_type) SELECT DISTINCT reserve_type_id,reserve_type FROM systems_import;
INSERT IGNORE INTO security(security_id,security) SELECT DISTINCT security_id,security FROM systems_import;
INSERT IGNORE INTO state(state_id,state) SELECT DISTINCT state_id,state FROM systems_import;

-- Cleanup and optimize new tables post bulk-insert
DROP TABLE systems_import,stations_import;
FLUSH stations,type,systems,allegiance,controlling_minor_faction,government,power_state,primary_economy,reserve_type,security,state;
OPTIMIZE TABLE factions,listings,allegiance,controlling_minor_faction,government,power_state,primary_economy,reserve_type,security,state,systems,commodities,modules,stations,bodies;
