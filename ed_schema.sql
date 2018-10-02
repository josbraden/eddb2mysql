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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-02 13:55:16
