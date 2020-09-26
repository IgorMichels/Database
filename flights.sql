-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: flights
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Aircraft_Models`
--

DROP TABLE IF EXISTS `Aircraft_Models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Aircraft_Models` (
  `model` varchar(10) NOT NULL,
  `Manufacturer_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`model`),
  KEY `Aircraft_Models_Manufacturer` (`Manufacturer_id`),
  CONSTRAINT `Aircraft_Models_Manufacturer` FOREIGN KEY (`Manufacturer_id`) REFERENCES `Manufacturer` (`id_manufacturer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aircraft_Models`
--

LOCK TABLES `Aircraft_Models` WRITE;
/*!40000 ALTER TABLE `Aircraft_Models` DISABLE KEYS */;
/*!40000 ALTER TABLE `Aircraft_Models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aircraft_Types`
--

DROP TABLE IF EXISTS `Aircraft_Types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Aircraft_Types` (
  `id_type` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id_type`),
  UNIQUE KEY `id_type` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aircraft_Types`
--

LOCK TABLES `Aircraft_Types` WRITE;
/*!40000 ALTER TABLE `Aircraft_Types` DISABLE KEYS */;
/*!40000 ALTER TABLE `Aircraft_Types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aircrafts`
--

DROP TABLE IF EXISTS `Aircrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Aircrafts` (
  `N_Number` char(6) NOT NULL,
  `Companys_id` bigint(20) unsigned NOT NULL,
  `Aircraft_Model` varchar(10) NOT NULL,
  `Aircraft_Types_id` bigint(20) unsigned NOT NULL,
  `Engine_Types_id` bigint(20) unsigned NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`N_Number`),
  KEY `Aircrafts_Aircraft_Models` (`Aircraft_Model`),
  KEY `Aircrafts_Aircraft_Types` (`Aircraft_Types_id`),
  KEY `Aircrafts_Companys` (`Companys_id`),
  KEY `Aircrafts_Engine_Types` (`Engine_Types_id`),
  CONSTRAINT `Aircrafts_Aircraft_Models` FOREIGN KEY (`Aircraft_Model`) REFERENCES `Aircraft_Models` (`model`),
  CONSTRAINT `Aircrafts_Aircraft_Types` FOREIGN KEY (`Aircraft_Types_id`) REFERENCES `Aircraft_Types` (`id_type`),
  CONSTRAINT `Aircrafts_Companys` FOREIGN KEY (`Companys_id`) REFERENCES `Companies` (`id_company`),
  CONSTRAINT `Aircrafts_Engine_Types` FOREIGN KEY (`Engine_Types_id`) REFERENCES `Engine_Types` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aircrafts`
--

LOCK TABLES `Aircrafts` WRITE;
/*!40000 ALTER TABLE `Aircrafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Aircrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airports`
--

DROP TABLE IF EXISTS `Airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Airports` (
  `cod` char(3) NOT NULL,
  `Cities_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `Airports_Citys` (`Cities_id`),
  CONSTRAINT `Airports_Citys` FOREIGN KEY (`Cities_id`) REFERENCES `Cities` (`id_city`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airports`
--

LOCK TABLES `Airports` WRITE;
/*!40000 ALTER TABLE `Airports` DISABLE KEYS */;
/*!40000 ALTER TABLE `Airports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cities`
--

DROP TABLE IF EXISTS `Cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cities` (
  `id_city` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `States_abrev` char(2) NOT NULL,
  PRIMARY KEY (`id_city`),
  UNIQUE KEY `id_city` (`id_city`),
  KEY `Cities_States` (`States_abrev`),
  CONSTRAINT `Cities_States` FOREIGN KEY (`States_abrev`) REFERENCES `States` (`abreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cities`
--

LOCK TABLES `Cities` WRITE;
/*!40000 ALTER TABLE `Cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Companies`
--

DROP TABLE IF EXISTS `Companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Companies` (
  `id_company` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `Cities_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_company`),
  UNIQUE KEY `id_company` (`id_company`),
  KEY `Companies_Cities` (`Cities_id`),
  CONSTRAINT `Companies_Cities` FOREIGN KEY (`Cities_id`) REFERENCES `Cities` (`id_city`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Companies`
--

LOCK TABLES `Companies` WRITE;
/*!40000 ALTER TABLE `Companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Delay_Causes`
--

DROP TABLE IF EXISTS `Delay_Causes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Delay_Causes` (
  `id_delay` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cause` varchar(50) NOT NULL,
  PRIMARY KEY (`id_delay`),
  UNIQUE KEY `id_delay` (`id_delay`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delay_Causes`
--

LOCK TABLES `Delay_Causes` WRITE;
/*!40000 ALTER TABLE `Delay_Causes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Delay_Causes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Engine_Types`
--

DROP TABLE IF EXISTS `Engine_Types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Engine_Types` (
  `id_type` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_type`),
  UNIQUE KEY `id_type` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Engine_Types`
--

LOCK TABLES `Engine_Types` WRITE;
/*!40000 ALTER TABLE `Engine_Types` DISABLE KEYS */;
/*!40000 ALTER TABLE `Engine_Types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flights`
--

DROP TABLE IF EXISTS `Flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flights` (
  `id_flight` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Aircrafts_id` char(6) NOT NULL,
  `Route_id` bigint(20) unsigned NOT NULL,
  `Date` date NOT NULL,
  `Arrival_time` time NOT NULL,
  `Departure_time` time NOT NULL,
  `Delay_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Delay_Causes_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_flight`),
  UNIQUE KEY `id_flight` (`id_flight`),
  KEY `Flights_Aircrafts` (`Aircrafts_id`),
  KEY `Flights_Delay_Causes` (`Delay_Causes_id`),
  KEY `Flights_Routes` (`Route_id`),
  CONSTRAINT `Flights_Aircrafts` FOREIGN KEY (`Aircrafts_id`) REFERENCES `Aircrafts` (`N_Number`),
  CONSTRAINT `Flights_Delay_Causes` FOREIGN KEY (`Delay_Causes_id`) REFERENCES `Delay_Causes` (`id_delay`),
  CONSTRAINT `Flights_Routes` FOREIGN KEY (`Route_id`) REFERENCES `Routes` (`id_route`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flights`
--

LOCK TABLES `Flights` WRITE;
/*!40000 ALTER TABLE `Flights` DISABLE KEYS */;
/*!40000 ALTER TABLE `Flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manufacturer`
--

DROP TABLE IF EXISTS `Manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Manufacturer` (
  `id_manufacturer` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_manufacturer`),
  UNIQUE KEY `id_manufacturer` (`id_manufacturer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manufacturer`
--

LOCK TABLES `Manufacturer` WRITE;
/*!40000 ALTER TABLE `Manufacturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Routes`
--

DROP TABLE IF EXISTS `Routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Routes` (
  `id_route` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Departure_Airport_id` char(3) NOT NULL,
  `Arrival_Airport_id` char(3) NOT NULL,
  PRIMARY KEY (`id_route`),
  UNIQUE KEY `id_route` (`id_route`),
  KEY `Arrival_Airport` (`Arrival_Airport_id`),
  KEY `Departure_Airport` (`Departure_Airport_id`),
  CONSTRAINT `Arrival_Airport` FOREIGN KEY (`Arrival_Airport_id`) REFERENCES `Airports` (`cod`),
  CONSTRAINT `Departure_Airport` FOREIGN KEY (`Departure_Airport_id`) REFERENCES `Airports` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Routes`
--

LOCK TABLES `Routes` WRITE;
/*!40000 ALTER TABLE `Routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `States`
--

DROP TABLE IF EXISTS `States`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `States` (
  `abreviation` char(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`abreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `States`
--

LOCK TABLES `States` WRITE;
/*!40000 ALTER TABLE `States` DISABLE KEYS */;
/*!40000 ALTER TABLE `States` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-26 14:34:34
