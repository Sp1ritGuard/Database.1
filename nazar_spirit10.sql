-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: nazar_spirit10
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `ammo`
--

DROP TABLE IF EXISTS `ammo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ammo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ammo_type` varchar(20) NOT NULL,
  `mass` decimal(3,2) NOT NULL,
  `caliber` int(11) NOT NULL,
  `position_id` int(11) DEFAULT NULL,
  `is_destroyed` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `position_id` (`position_id`),
  CONSTRAINT `ammo_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `fire_positions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ammo`
--

LOCK TABLES `ammo` WRITE;
/*!40000 ALTER TABLE `ammo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ammo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ammo_inventory`
--

DROP TABLE IF EXISTS `ammo_inventory`;
/*!50001 DROP VIEW IF EXISTS `ammo_inventory`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ammo_inventory` AS SELECT
 1 AS `position_id`,
  1 AS `x`,
  1 AS `y`,
  1 AS `ammo_type`,
  1 AS `total_mass` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `corrections`
--

DROP TABLE IF EXISTS `corrections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corrections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commander` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `people` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corrections`
--

LOCK TABLES `corrections` WRITE;
/*!40000 ALTER TABLE `corrections` DISABLE KEYS */;
/*!40000 ALTER TABLE `corrections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fire_positions`
--

DROP TABLE IF EXISTS `fire_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fire_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `weapon_id` int(11) DEFAULT NULL,
  `is_destroyed` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `unit_id` (`unit_id`),
  KEY `weapon_id` (`weapon_id`),
  CONSTRAINT `fire_positions_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`),
  CONSTRAINT `fire_positions_ibfk_2` FOREIGN KEY (`weapon_id`) REFERENCES `weapons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fire_positions`
--

LOCK TABLES `fire_positions` WRITE;
/*!40000 ALTER TABLE `fire_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `fire_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fire_tasks`
--

DROP TABLE IF EXISTS `fire_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fire_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `ammo_type` varchar(20) DEFAULT NULL,
  `ammo_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `position_id` (`position_id`),
  KEY `target_id` (`target_id`),
  CONSTRAINT `fire_tasks_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `fire_positions` (`id`),
  CONSTRAINT `fire_tasks_ibfk_2` FOREIGN KEY (`target_id`) REFERENCES `targets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fire_tasks`
--

LOCK TABLES `fire_tasks` WRITE;
/*!40000 ALTER TABLE `fire_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `fire_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shots`
--

DROP TABLE IF EXISTS `shots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ammo_type` varchar(20) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `target_id` (`target_id`),
  KEY `position_id` (`position_id`),
  CONSTRAINT `shots_ibfk_1` FOREIGN KEY (`target_id`) REFERENCES `targets` (`id`),
  CONSTRAINT `shots_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `fire_positions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shots`
--

LOCK TABLES `shots` WRITE;
/*!40000 ALTER TABLE `shots` DISABLE KEYS */;
/*!40000 ALTER TABLE `shots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targets`
--

DROP TABLE IF EXISTS `targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `targets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targets`
--

LOCK TABLES `targets` WRITE;
/*!40000 ALTER TABLE `targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commander` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `people` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons`
--

DROP TABLE IF EXISTS `weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `caliber` int(11) DEFAULT NULL,
  `commander` varchar(50) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `is_destroyed` tinyint(1) DEFAULT 0,
  `distance` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_id` (`unit_id`),
  CONSTRAINT `weapons_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons`
--

LOCK TABLES `weapons` WRITE;
/*!40000 ALTER TABLE `weapons` DISABLE KEYS */;
/*!40000 ALTER TABLE `weapons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ammo_inventory`
--

/*!50001 DROP VIEW IF EXISTS `ammo_inventory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ammo_inventory` AS select `f`.`id` AS `position_id`,`f`.`x` AS `x`,`f`.`y` AS `y`,`a`.`ammo_type` AS `ammo_type`,sum(`a`.`mass`) AS `total_mass` from (`fire_positions` `f` join `ammo` `a` on(`f`.`id` = `a`.`position_id`)) where `f`.`is_destroyed` = 0 group by `f`.`id`,`a`.`ammo_type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-05 13:57:17
