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
-- Table structure for table `allegiance`
--

DROP TABLE IF EXISTS `allegiance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allegiance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `allegiance_id` int(11) NOT NULL,
  `allegiance` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `allegiance_id` (`allegiance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allegiance`
--

LOCK TABLES `allegiance` WRITE;
/*!40000 ALTER TABLE `allegiance` DISABLE KEYS */;
/*!40000 ALTER TABLE `allegiance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bodies`
--

DROP TABLE IF EXISTS `bodies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eddb_id` int(11) NOT NULL,
  `id64` int(11) NOT NULL,
  `bodyId` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `type` mediumtext NOT NULL,
  `subType` mediumtext NOT NULL,
  `offset` int(11) NOT NULL,
  `distanceToArrival` int(11) NOT NULL,
  `isMainStar` tinytext NOT NULL,
  `isScoopable` tinytext NOT NULL,
  `age` int(11) NOT NULL,
  `spectralClass` tinytext NOT NULL,
  `luminosity` tinytext NOT NULL,
  `absoluteMagnitude` float NOT NULL,
  `solarMasses` float NOT NULL,
  `solarRadius` float NOT NULL,
  `surfaceTemperature` float NOT NULL,
  `orbitalPeriod` float NOT NULL,
  `semiMajorAxis` float NOT NULL,
  `orbitalEccentricity` float NOT NULL,
  `orbitalInclination` float NOT NULL,
  `argOfPeriapsis` float NOT NULL,
  `rotationalPeriod` float NOT NULL,
  `rotationalPeriodTidallyLocked` tinytext NOT NULL,
  `axialTilt` float NOT NULL,
  `updateTime` int(11) NOT NULL,
  `systemId` int(11) NOT NULL,
  `systemId64` int(11) NOT NULL,
  `systemName` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eddb_id` (`eddb_id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodies`
--

LOCK TABLES `bodies` WRITE;
/*!40000 ALTER TABLE `bodies` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodities`
--

DROP TABLE IF EXISTS `commodities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `eddb_id` (`eddb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodities`
--

LOCK TABLES `commodities` WRITE;
/*!40000 ALTER TABLE `commodities` DISABLE KEYS */;
/*!40000 ALTER TABLE `commodities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlling_minor_faction`
--

DROP TABLE IF EXISTS `controlling_minor_faction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlling_minor_faction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controlling_minor_faction_id` int(11) NOT NULL,
  `controlling_minor_faction` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `controlling_minor_faction_id` (`controlling_minor_faction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlling_minor_faction`
--

LOCK TABLES `controlling_minor_faction` WRITE;
/*!40000 ALTER TABLE `controlling_minor_faction` DISABLE KEYS */;
/*!40000 ALTER TABLE `controlling_minor_faction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factions`
--

DROP TABLE IF EXISTS `factions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eddb_id` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `updated_at` int(11) NOT NULL,
  `government_id` int(11) NOT NULL,
  `allegiance_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `home_system_id` int(11) NOT NULL,
  `is_player_faction` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eddb_id` (`eddb_id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factions`
--

LOCK TABLES `factions` WRITE;
/*!40000 ALTER TABLE `factions` DISABLE KEYS */;
/*!40000 ALTER TABLE `factions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `government`
--

DROP TABLE IF EXISTS `government`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `government` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `government_id` int(11) NOT NULL,
  `government` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `government_id` (`government_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `government`
--

LOCK TABLES `government` WRITE;
/*!40000 ALTER TABLE `government` DISABLE KEYS */;
/*!40000 ALTER TABLE `government` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listings`
--

DROP TABLE IF EXISTS `listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `eddb_id` (`eddb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listings`
--

LOCK TABLES `listings` WRITE;
/*!40000 ALTER TABLE `listings` DISABLE KEYS */;
/*!40000 ALTER TABLE `listings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `eddb_id` (`eddb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power_state`
--

DROP TABLE IF EXISTS `power_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `power_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `power_state_id` int(11) NOT NULL,
  `power_state` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `power_state_id` (`power_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_state`
--

LOCK TABLES `power_state` WRITE;
/*!40000 ALTER TABLE `power_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `power_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `primary_economy`
--

DROP TABLE IF EXISTS `primary_economy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `primary_economy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `primary_economy_id` int(11) NOT NULL,
  `primary_economy` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `primary_economy_id` (`primary_economy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `primary_economy`
--

LOCK TABLES `primary_economy` WRITE;
/*!40000 ALTER TABLE `primary_economy` DISABLE KEYS */;
/*!40000 ALTER TABLE `primary_economy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve_type`
--

DROP TABLE IF EXISTS `reserve_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserve_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reserve_type_id` int(11) NOT NULL,
  `reserve_type` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reserve_type_id` (`reserve_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve_type`
--

LOCK TABLES `reserve_type` WRITE;
/*!40000 ALTER TABLE `reserve_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserve_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security`
--

DROP TABLE IF EXISTS `security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `security_id` int(11) NOT NULL,
  `security` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `security_id` (`security_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security`
--

LOCK TABLES `security` WRITE;
/*!40000 ALTER TABLE `security` DISABLE KEYS */;
/*!40000 ALTER TABLE `security` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) NOT NULL,
  `state` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `state_id` (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `eddb_id` (`eddb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systems`
--

DROP TABLE IF EXISTS `systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eddb_id` int(11) NOT NULL,
  `edsm_id` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `population` bigint(20) NOT NULL,
  `is_populated` tinyint(1) NOT NULL,
  `government_id` int(11) NOT NULL,
  `allegiance_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `security_id` int(11) NOT NULL,
  `primary_economy_id` int(11) NOT NULL,
  `power` mediumtext NOT NULL,
  `power_state_id` int(11) NOT NULL,
  `needs_permit` tinyint(1) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `controlling_minor_faction_id` int(11) NOT NULL,
  `reserve_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eddb_id` (`eddb_id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systems`
--

LOCK TABLES `systems` WRITE;
/*!40000 ALTER TABLE `systems` DISABLE KEYS */;
/*!40000 ALTER TABLE `systems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `type` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-09 12:07:35
