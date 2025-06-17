DROP DATABASE IF EXISTS `kunden`;
CREATE DATABASE  IF NOT EXISTS `kunden` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `kunden`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: kunden
-- ------------------------------------------------------
-- Server version	5.5.38

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
-- Table structure for table `kunden`
--

DROP TABLE IF EXISTS `kunden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kunden` (
  `kunde_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `ort_postleitzahl` varchar(5) NOT NULL,
  PRIMARY KEY (`kunde_id`),
  KEY `fk_kunde_ort` (`ort_postleitzahl`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunden`
--

LOCK TABLES `kunden` WRITE;
/*!40000 ALTER TABLE `kunden` DISABLE KEYS */;
INSERT INTO `kunden` VALUES (1,'John','79111'),(2,'Herbert','79312'),(3,'Sabina','79312'),(4,'Mary','79111'),(5,'Heinrich','79111'),(6,'Usal','80995'),(7,'Johannes','80995'),(8,'Carla','79312'),(9,'Ludowika','79111'),(10,'Niemand','99999');
/*!40000 ALTER TABLE `kunden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orte`
--

DROP TABLE IF EXISTS `orte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orte` (
  `postleitzahl` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `einwohnerzahl` int(11) DEFAULT NULL,
  PRIMARY KEY (`postleitzahl`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orte`
--

LOCK TABLES `orte` WRITE;
/*!40000 ALTER TABLE `orte` DISABLE KEYS */;
INSERT INTO `orte` VALUES ('80995','München',1000000),('79312','Emmendingen',40000),('79111','Freiburg',280000),('20095','Hamburg',2000000);
/*!40000 ALTER TABLE `orte` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-02 20:26:13

SELECT kunde_id, name, ort_postleitzahl 
FROM kunden AS kundenliste 
WHERE kundenliste.ort_postleitzahl > '80000';


SELECT o.name, k.name 
FROM orte AS o, kunden AS k 
WHERE o.name LIKE '%n' 
  AND o.postleitzahl = k.ort_postleitzahl;


SELECT hrgs.kunde_id, hrgs.name, prfz.name 
FROM kunden AS hrgs 
INNER JOIN orte AS prfz 
ON prfz.postleitzahl = hrgs.ort_postleitzahl 
ORDER BY hrgs.kunde_id;


SELECT k.name, o.postleitzahl, o.name 
FROM kunden AS k, orte AS o 
WHERE k.name LIKE '%a%' 
  AND o.name LIKE '%u%' 
  AND k.ort_postleitzahl = o.postleitzahl;
