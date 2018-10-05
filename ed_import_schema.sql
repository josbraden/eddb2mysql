-- MySQL dump 10.16  Distrib 10.1.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ed
-- ------------------------------------------------------
-- Server version	10.1.34-MariaDB-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `commodities_import`
--

DROP TABLE IF EXISTS `commodities_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodities_import` (
  `eddb_id` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `category_id` int(11) NOT NULL,
  `average_price` int(11) NOT NULL,
  `is_rare` tinyint(1) NOT NULL,
  `max_buy_price` int(11) NOT NULL,
  `max_sell_price` int(11) NOT NULL,
  `min_buy_price` int(11) NOT NULL,
  `min_sell_price` int(11) NOT NULL,
  `buy_price_lower_average` int(11) NOT NULL,
  `sell_price_upper_average` int(11) NOT NULL,
  `is_non_marketable` int(11) NOT NULL,
  `ed_id` int(11) NOT NULL,
  UNIQUE KEY `eddb_id` (`eddb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodities_import`
--

LOCK TABLES `commodities_import` WRITE;
/*!40000 ALTER TABLE `commodities_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `commodities_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factions_import`
--

DROP TABLE IF EXISTS `factions_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factions_import` (
  `eddb_id` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `updated_at` int(11) NOT NULL,
  `government_id` int(11) NOT NULL,
  `government` mediumtext NOT NULL,
  `allegiance_id` int(11) NOT NULL,
  `allegiance` mediumtext NOT NULL,
  `state_id` int(11) NOT NULL,
  `state` mediumtext NOT NULL,
  `home_system_id` int(11) NOT NULL,
  `is_player_faction` tinyint(1) NOT NULL,
  UNIQUE KEY `eddb_id` (`eddb_id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factions_import`
--

LOCK TABLES `factions_import` WRITE;
/*!40000 ALTER TABLE `factions_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `factions_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listings_import`
--

DROP TABLE IF EXISTS `listings_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listings_import` (
  `eddb_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `commodity_id` int(11) NOT NULL,
  `supply` int(11) NOT NULL,
  `supply_bracket` int(11) NOT NULL,
  `buy_price` int(11) NOT NULL,
  `sell_price` int(11) NOT NULL,
  `demand` int(11) NOT NULL,
  `demand_bracket` int(11) NOT NULL,
  `collected_at` int(11) NOT NULL,
  UNIQUE KEY `eddb_id` (`eddb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listings_import`
--

LOCK TABLES `listings_import` WRITE;
/*!40000 ALTER TABLE `listings_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `listings_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules_import`
--

DROP TABLE IF EXISTS `modules_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules_import` (
  `eddb_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `rating` tinytext NOT NULL,
  `price` int(11) NOT NULL,
  `weapon_mode` mediumtext NOT NULL,
  `missile_type` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `belongs_to` mediumtext NOT NULL,
  `ed_id` int(11) NOT NULL,
  `ed_symbol` mediumtext NOT NULL,
  `ship` mediumtext NOT NULL,
  UNIQUE KEY `eddb_id` (`eddb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules_import`
--

LOCK TABLES `modules_import` WRITE;
/*!40000 ALTER TABLE `modules_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations_import`
--

DROP TABLE IF EXISTS `stations_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stations_import` (
  `eddb_id` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `system_id` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `max_landing_pad_size` tinytext NOT NULL,
  `distance_to_star` int(11) NOT NULL,
  `government_id` int(11) NOT NULL,
  `allegiance_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `has_blackmarket` tinytext NOT NULL,
  `has_market` tinytext NOT NULL,
  `has_refuel` tinytext NOT NULL,
  `has_repair` tinytext NOT NULL,
  `has_rearm` tinytext NOT NULL,
  `has_outfitting` tinytext NOT NULL,
  `has_shipyard` tinytext NOT NULL,
  `has_docking` tinytext NOT NULL,
  `has_commodities` tinytext NOT NULL,
  `shipyard_updated_at` int(11) NOT NULL,
  `outfitting_updated_at` int(11) NOT NULL,
  `market_updated_at` int(11) NOT NULL,
  `is_planetary` tinytext NOT NULL,
  `settlement_size_id` int(11) NOT NULL,
  `settlement_size` int(11) NOT NULL,
  `settlement_security_id` int(11) NOT NULL,
  `body_id` int(11) NOT NULL,
  `controlling_minor_faction_id` int(11) NOT NULL,
  UNIQUE KEY `eddb_id` (`eddb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations_import`
--

LOCK TABLES `stations_import` WRITE;
/*!40000 ALTER TABLE `stations_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `stations_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systems_import`
--

DROP TABLE IF EXISTS `systems_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systems_import` (
  `eddb_id` int(11) NOT NULL,
  `edsm_id` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `population` bigint(20) NOT NULL,
  `is_populated` tinyint(1) NOT NULL,
  `government_id` int(11) NOT NULL,
  `government` mediumtext NOT NULL,
  `allegiance_id` int(11) NOT NULL,
  `allegiance` mediumtext NOT NULL,
  `state_id` int(11) NOT NULL,
  `state` mediumtext NOT NULL,
  `security_id` int(11) NOT NULL,
  `security` mediumtext NOT NULL,
  `primary_economy_id` int(11) NOT NULL,
  `primary_economy` mediumtext NOT NULL,
  `power` mediumtext NOT NULL,
  `power_state` mediumtext NOT NULL,
  `power_state_id` int(11) NOT NULL,
  `needs_permit` tinyint(1) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `simbad_ref` mediumtext NOT NULL,
  `controlling_minor_faction_id` int(11) NOT NULL,
  `controlling_minor_faction` mediumtext NOT NULL,
  `reserve_type_id` int(11) NOT NULL,
  `reserve_type` mediumtext NOT NULL,
  UNIQUE KEY `eddb_id` (`eddb_id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systems_import`
--

LOCK TABLES `systems_import` WRITE;
/*!40000 ALTER TABLE `systems_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `systems_import` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-05 10:40:55
