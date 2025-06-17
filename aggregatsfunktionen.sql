CREATE DATABASE  IF NOT EXISTS `uebungSchule` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `uebungSchule`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: localhost    Database: uebungSchule
-- ------------------------------------------------------
-- Server version	5.6.33

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
-- Table structure for table `faecher`
--

DROP TABLE IF EXISTS `faecher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faecher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fachbezeichnung` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faecher`
--

LOCK TABLES `faecher` WRITE;
/*!40000 ALTER TABLE `faecher` DISABLE KEYS */;
INSERT INTO `faecher` VALUES (1,'Deutsch'),(2,'Mathe'),(3,'Englisch'),(4,'Musik'),(5,'Russisch'),(6,'Informatik'),(7,'Religion'),(8,'Ethik'),(9,'Biologie'),(10,'Chemie'),(11,'Physik');
/*!40000 ALTER TABLE `faecher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lehrer`
--

DROP TABLE IF EXISTS `lehrer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lehrer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `idOrte` int(11) NOT NULL,
  `gehalt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lehrer`
--

LOCK TABLES `lehrer` WRITE;
/*!40000 ALTER TABLE `lehrer` DISABLE KEYS */;
INSERT INTO `lehrer` VALUES (1,'Schmitt','Beamter',1,3123),(2,'Müller','Beamter',2,6581),(3,'Maier','Angestellter',3,5224),(4,'Bohnert','Beamter',1,3012),(5,'Hunger','Beamter',6,4005),(6,'Tschuck','Beamter',6,3612),(7,'Betzold','Beamter',3,3902),(8,'Metz','Angestellter',4,3385),(9,'Hartz','Beamter',4,2451),(10,'Schneider','Angestellter',2,1943),(11,'Huber','Beamter',5,4054),(12,'Lürcher','Angestellter',6,4504),(13,'Bühler','Angestellter',2,3120),(14,'Bohner','Angestellter',4,3904),(15,'Ruck','Angestellter',5,3652),(16,'Bock','Angestellter',1,1740),(17,'Maler','Beamter',1,2403),(18,'Mahler','Angestellter',1,2800),(19,'Pfeffersack','Angestellter',5,2134),(20,'Petersen','Beamter',3,3831),(21,'Oettle','Beamter',1,3267),(22,'Bercher','Angestellter',6,3091),(23,'Bauer','Beamter',5,4188),(24,'Pfeiffer','Angestellter',3,3241),(25,'Bruns','Angestellter',2,3388),(26,'Sauter','Beamter',2,2490),(27,'Rauert','Beamter',3,2221),(28,'Zelawat','Beamter',4,2991);
/*!40000 ALTER TABLE `lehrer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lehrer_hat_faecher`
--

DROP TABLE IF EXISTS `lehrer_hat_faecher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lehrer_hat_faecher` (
  `idLehrer` int(11) NOT NULL,
  `idFaecher` int(11) NOT NULL,
  PRIMARY KEY (`idLehrer`,`idFaecher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lehrer_hat_faecher`
--

LOCK TABLES `lehrer_hat_faecher` WRITE;
/*!40000 ALTER TABLE `lehrer_hat_faecher` DISABLE KEYS */;
INSERT INTO `lehrer_hat_faecher` VALUES (0,0),(1,1),(1,3),(2,7),(2,9),(3,1),(3,10),(3,11),(4,2),(4,6),(5,8),(6,5),(6,7),(6,9),(7,3),(7,10),(8,2),(8,11),(9,3),(9,4),(9,5),(9,6),(10,7),(11,8),(11,9),(12,9),(12,10),(12,11),(13,1),(13,3),(14,1),(14,2),(15,2),(15,4),(15,8),(16,4),(16,6),(17,4),(17,7),(17,9),(18,1),(18,10),(19,3),(20,2),(20,6),(21,7),(21,9),(22,8),(22,11),(23,3),(23,5),(23,10),(23,11),(24,5),(24,6),(25,4),(25,9),(26,1),(26,2),(26,7),(26,8),(27,3),(28,4),(28,10);
/*!40000 ALTER TABLE `lehrer_hat_faecher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lehrer_hat_schueler`
--

DROP TABLE IF EXISTS `lehrer_hat_schueler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lehrer_hat_schueler` (
  `idLehrer` int(11) NOT NULL,
  `idSchueler` int(11) NOT NULL,
  PRIMARY KEY (`idSchueler`,`idLehrer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lehrer_hat_schueler`
--

LOCK TABLES `lehrer_hat_schueler` WRITE;
/*!40000 ALTER TABLE `lehrer_hat_schueler` DISABLE KEYS */;
INSERT INTO `lehrer_hat_schueler` VALUES (2,1),(6,1),(7,1),(9,1),(10,1),(11,1),(14,1),(16,1),(23,1),(32,1),(34,1),(35,1),(43,1),(48,1),(64,1),(67,1),(73,1),(77,1),(81,1),(87,1),(98,1),(1,2),(3,2),(6,2),(10,2),(15,2),(18,2),(19,2),(21,2),(25,2),(31,2),(36,2),(37,2),(40,2),(48,2),(49,2),(50,2),(66,2),(67,2),(70,2),(82,2),(85,2),(93,2),(1,3),(4,3),(6,3),(9,3),(10,3),(12,3),(13,3),(17,3),(18,3),(19,3),(21,3),(22,3),(23,3),(24,3),(25,3),(27,3),(28,3),(30,3),(32,3),(33,3),(36,3),(56,3),(61,3),(85,3),(93,3),(94,3),(100,3),(3,4),(6,4),(8,4),(19,4),(21,4),(22,4),(23,4),(25,4),(26,4),(27,4),(35,4),(40,4),(43,4),(46,4),(56,4),(67,4),(71,4),(75,4),(77,4),(78,4),(80,4),(90,4),(97,4),(1,5),(6,5),(7,5),(9,5),(10,5),(12,5),(13,5),(15,5),(19,5),(20,5),(21,5),(25,5),(27,5),(28,5),(33,5),(39,5),(44,5),(45,5),(63,5),(65,5),(72,5),(74,5),(83,5),(91,5),(100,5),(2,6),(3,6),(8,6),(10,6),(11,6),(14,6),(17,6),(19,6),(21,6),(23,6),(25,6),(27,6),(37,6),(42,6),(43,6),(45,6),(48,6),(53,6),(57,6),(58,6),(63,6),(64,6),(73,6),(80,6),(88,6),(89,6),(1,7),(6,7),(11,7),(12,7),(16,7),(18,7),(19,7),(21,7),(23,7),(25,7),(27,7),(31,7),(39,7),(56,7),(62,7),(66,7),(69,7),(71,7),(79,7),(84,7),(98,7),(100,7),(7,8),(14,8),(17,8),(18,8),(19,8),(24,8),(25,8),(26,8),(27,8),(33,8),(36,8),(44,8),(59,8),(60,8),(61,8),(62,8),(70,8),(78,8),(85,8),(94,8),(102,8),(4,9),(8,9),(9,9),(11,9),(16,9),(20,9),(22,9),(23,9),(39,9),(41,9),(43,9),(51,9),(59,9),(79,9),(80,9),(86,9),(87,9),(95,9),(97,9),(1,10),(4,10),(5,10),(6,10),(7,10),(8,10),(11,10),(13,10),(14,10),(15,10),(17,10),(18,10),(20,10),(21,10),(26,10),(30,10),(53,10),(54,10),(60,10),(63,10),(69,10),(77,10),(80,10),(82,10),(91,10),(92,10),(102,10),(3,11),(4,11),(5,11),(6,11),(7,11),(10,11),(16,11),(17,11),(18,11),(23,11),(28,11),(29,11),(33,11),(37,11),(51,11),(53,11),(59,11),(60,11),(61,11),(68,11),(86,11),(88,11),(90,11),(92,11),(102,11),(6,12),(8,12),(9,12),(16,12),(17,12),(18,12),(20,12),(21,12),(24,12),(26,12),(27,12),(28,12),(29,12),(31,12),(34,12),(42,12),(47,12),(48,12),(55,12),(73,12),(74,12),(75,12),(76,12),(1,13),(3,13),(5,13),(7,13),(8,13),(10,13),(12,13),(13,13),(16,13),(20,13),(32,13),(35,13),(40,13),(42,13),(47,13),(49,13),(54,13),(67,13),(83,13),(86,13),(88,13),(89,13),(91,13),(100,13),(1,14),(3,14),(5,14),(6,14),(7,14),(12,14),(14,14),(15,14),(16,14),(17,14),(26,14),(27,14),(28,14),(33,14),(34,14),(56,14),(62,14),(66,14),(75,14),(84,14),(95,14),(4,15),(7,15),(10,15),(11,15),(13,15),(14,15),(24,15),(38,15),(40,15),(42,15),(46,15),(52,15),(58,15),(60,15),(64,15),(66,15),(70,15),(71,15),(83,15),(97,15),(99,15),(101,15),(2,16),(3,16),(4,16),(6,16),(7,16),(9,16),(12,16),(14,16),(17,16),(23,16),(25,16),(27,16),(29,16),(35,16),(38,16),(44,16),(63,16),(65,16),(69,16),(75,16),(92,16),(94,16),(99,16),(103,16),(1,17),(2,17),(3,17),(6,17),(7,17),(12,17),(16,17),(18,17),(22,17),(25,17),(26,17),(28,17),(35,17),(45,17),(48,17),(58,17),(65,17),(67,17),(81,17),(82,17),(93,17),(103,17),(2,18),(5,18),(6,18),(12,18),(17,18),(21,18),(22,18),(23,18),(24,18),(25,18),(27,18),(40,18),(45,18),(50,18),(54,18),(61,18),(66,18),(75,18),(83,18),(89,18),(99,18),(101,18),(103,18),(8,19),(10,19),(11,19),(13,19),(16,19),(17,19),(18,19),(19,19),(20,19),(21,19),(24,19),(25,19),(41,19),(43,19),(44,19),(55,19),(65,19),(69,19),(78,19),(81,19),(83,19),(87,19),(92,19),(93,19),(96,19),(1,20),(10,20),(11,20),(13,20),(15,20),(17,20),(19,20),(21,20),(22,20),(24,20),(25,20),(28,20),(38,20),(41,20),(44,20),(45,20),(49,20),(54,20),(62,20),(68,20),(69,20),(77,20),(79,20),(86,20),(90,20),(4,21),(6,21),(10,21),(13,21),(14,21),(22,21),(25,21),(26,21),(28,21),(31,21),(47,21),(50,21),(51,21),(55,21),(70,21),(72,21),(74,21),(77,21),(78,21),(87,21),(89,21),(96,21),(2,22),(5,22),(10,22),(11,22),(19,22),(22,22),(23,22),(26,22),(27,22),(28,22),(30,22),(31,22),(49,22),(51,22),(52,22),(53,22),(57,22),(60,22),(68,22),(76,22),(94,22),(97,22),(98,22),(2,23),(5,23),(13,23),(16,23),(17,23),(19,23),(22,23),(26,23),(28,23),(38,23),(39,23),(41,23),(46,23),(50,23),(70,23),(76,23),(79,23),(80,23),(84,23),(85,23),(88,23),(90,23),(5,24),(8,24),(9,24),(10,24),(12,24),(14,24),(15,24),(22,24),(24,24),(25,24),(29,24),(49,24),(50,24),(55,24),(57,24),(73,24),(76,24),(82,24),(92,24),(98,24),(99,24),(4,25),(8,25),(12,25),(14,25),(15,25),(18,25),(20,25),(24,25),(26,25),(29,25),(37,25),(47,25),(52,25),(53,25),(55,25),(57,25),(68,25),(71,25),(72,25),(79,25),(85,25),(96,25),(101,25),(1,26),(2,26),(7,26),(11,26),(13,26),(15,26),(16,26),(22,26),(23,26),(26,26),(30,26),(36,26),(37,26),(42,26),(46,26),(54,26),(56,26),(57,26),(72,26),(81,26),(91,26),(96,26),(2,27),(5,27),(7,27),(9,27),(10,27),(12,27),(13,27),(15,27),(22,27),(23,27),(28,27),(34,27),(41,27),(51,27),(52,27),(61,27),(64,27),(65,27),(72,27),(73,27),(84,27),(87,27),(88,27),(90,27),(95,27),(102,27),(2,28),(3,28),(4,28),(5,28),(7,28),(10,28),(14,28),(15,28),(16,28),(18,28),(20,28),(21,28),(23,28),(24,28),(27,28),(32,28),(34,28),(59,28),(64,28),(68,28),(71,28),(89,28),(101,28),(2,29),(3,29),(7,29),(17,29),(22,29),(23,29),(28,29),(1,30),(2,30),(6,30),(13,30),(14,30),(15,30),(16,30),(18,30),(19,30),(20,30),(27,30),(8,31),(9,31),(11,31),(13,31),(15,31),(16,31),(18,31),(19,31),(24,31),(25,31),(27,31),(28,31),(2,32),(14,32),(15,32),(21,32),(4,33),(5,33),(8,33),(11,33),(14,33),(7,34),(11,34),(23,34),(24,34),(27,34),(3,35),(9,35),(11,35),(18,35),(24,35),(27,35),(10,36),(14,36),(16,36),(20,36),(9,37),(10,37),(15,37),(16,37),(22,37),(25,37),(2,38),(9,38),(10,38),(12,38),(18,38),(26,38),(8,39),(12,39),(19,39),(21,39),(27,39),(3,40),(4,40),(10,40),(12,40),(17,40),(20,40),(22,40),(23,40),(25,40),(28,40),(4,41),(5,41),(7,41),(8,41),(13,41),(17,41),(21,41),(28,41),(10,42),(13,42),(21,42),(26,42),(2,43),(4,43),(5,43),(8,43),(10,43),(13,43),(14,43),(16,43),(25,43),(27,43),(2,44),(11,44),(22,44),(25,44),(28,44),(3,45),(13,45),(14,45),(20,45),(21,45),(28,45),(6,46),(11,46),(18,46),(24,46),(2,47),(5,47),(8,47),(18,47),(19,47),(20,47),(24,47),(25,47),(8,48),(10,48),(15,48),(2,49),(3,49),(8,49),(17,49),(21,49),(24,49),(25,49),(26,49),(27,49),(2,50),(5,50),(9,50),(16,50),(17,50),(26,50),(3,51),(11,51),(14,51),(15,51),(17,51),(24,51),(9,52),(10,52),(12,52),(13,52),(17,52),(23,52),(26,52),(28,52),(1,53),(6,53),(8,53),(17,53),(18,53),(21,53),(23,53),(25,53),(28,53),(6,54),(7,54),(9,54),(10,54),(12,54),(13,54),(16,54),(24,54),(26,54),(28,54),(2,55),(3,55),(8,55),(10,55),(11,55),(13,55),(15,55),(26,55),(28,55),(8,56),(10,56),(19,56),(20,56),(24,56),(26,56),(28,56),(2,57),(3,57),(4,57),(9,57),(15,57),(16,57),(21,57),(22,57),(1,58),(8,58),(9,58),(10,58),(11,58),(12,58),(15,58),(23,58),(24,58),(14,59),(16,59),(22,59),(2,60),(3,60),(6,60),(9,60),(14,60),(15,60),(16,60),(18,60),(21,60),(25,60),(28,60),(20,61),(28,61),(4,62),(8,62),(11,62),(12,62),(13,62),(18,62),(3,63),(4,63),(5,63),(6,63),(9,63),(11,63),(17,63),(21,63),(5,64),(12,64),(14,64),(18,64),(1,65),(4,65),(6,65),(10,65),(18,65),(19,65),(21,65),(25,65),(27,65),(2,66),(4,66),(7,66),(12,66),(15,66),(2,67),(9,67),(12,67),(16,67),(20,67),(23,67),(25,67),(26,67),(2,68),(3,68),(5,68),(10,68),(16,68),(24,68),(14,69),(16,69),(18,69),(27,69),(2,70),(6,70),(8,70),(27,70),(4,71),(5,71),(8,71),(9,71),(11,71),(16,71),(18,71),(19,71),(25,71),(12,72),(16,72),(18,72),(3,73),(7,73),(11,73),(12,73),(13,73),(14,73),(17,73),(19,73),(23,73),(26,73),(28,73),(2,74),(5,74),(9,74),(10,74),(11,74),(17,74),(21,74),(26,74),(28,74),(10,75),(13,75),(15,75),(16,75),(18,75),(2,76),(7,76),(10,76),(14,76),(15,76),(20,76),(27,76),(2,77),(3,77),(9,77),(10,77),(16,77),(21,77),(22,77),(24,77),(26,77),(28,77),(8,78),(20,78),(21,78),(24,78),(3,79),(6,79),(12,79),(14,79),(20,79),(27,79),(1,80),(3,80),(11,80),(13,80),(18,80),(21,80),(26,80),(4,81),(11,81),(13,81),(14,81),(21,81),(22,81),(25,81),(7,82),(8,82),(9,82),(11,82),(13,82),(16,82),(22,82),(24,82),(27,82),(2,83),(6,83),(10,83),(11,83),(13,83),(14,83),(17,83),(20,83),(25,83),(27,83),(3,84),(12,84),(15,84),(19,84),(26,84),(3,85),(5,85),(7,85),(11,85),(13,85),(18,85),(20,85),(21,85),(23,85),(24,85),(3,86),(15,86),(16,86),(17,86),(24,86),(28,86),(1,87),(9,87),(12,87),(19,87),(20,87),(21,87),(23,87),(26,87),(1,88),(10,88),(14,88),(19,88),(20,88),(21,88),(28,88),(1,89),(5,89),(9,89),(10,89),(16,89),(18,89),(20,89),(26,89),(3,90),(5,90),(16,90),(21,90),(24,90),(2,91),(3,91),(6,91),(16,91),(22,91),(23,91),(24,91),(26,91),(6,92),(10,92),(11,92),(5,93),(11,93),(13,93),(15,93),(21,93),(27,93),(28,93),(3,94),(6,94),(7,94),(19,94),(20,94),(26,94),(28,94),(8,95),(15,95),(24,95),(28,95),(2,96),(7,96),(8,96),(16,96),(17,96),(19,96),(20,96),(22,96),(24,96),(25,96),(27,96),(28,96),(11,97),(12,97),(13,97),(17,97),(21,97),(23,97),(1,98),(4,98),(5,98),(11,98),(15,98),(22,98),(25,98),(28,98),(11,99),(12,99),(14,99),(15,99),(19,99),(24,99),(25,99),(2,100),(7,100),(16,100),(26,100),(4,101),(7,101),(12,101),(16,101),(23,101),(27,101),(5,102),(9,102),(12,102),(15,102),(16,102),(18,102),(20,102),(26,102),(27,102),(5,103),(7,103),(8,103),(12,103),(26,103),(28,103);
/*!40000 ALTER TABLE `lehrer_hat_schueler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orte`
--

DROP TABLE IF EXISTS `orte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postleitzahl` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `vorwahl` varchar(45) DEFAULT NULL,
  `einwohnerzahl` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orte`
--

LOCK TABLES `orte` WRITE;
/*!40000 ALTER TABLE `orte` DISABLE KEYS */;
INSERT INTO `orte` VALUES (1,'79312','Emmendingen','07641','29612'),(2,'79311','Reute','07641','8501'),(3,'79312','Wasser','07641','2977'),(4,'79098','Freiburg','0761','262811'),(5,'79206','Breisach','07667','22719'),(6,'79313','Waldkirch','07681','25020');
/*!40000 ALTER TABLE `orte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schueler`
--

DROP TABLE IF EXISTS `schueler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schueler` (
  `id` int(3) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `noteMathe` int(1) DEFAULT NULL,
  `noteDeutsch` int(1) DEFAULT NULL,
  `klassenzimmer` int(3) DEFAULT NULL,
  `nationalitaet` varchar(3) DEFAULT NULL,
  `idOrte` int(2) NOT NULL,
  `idSmartphones` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schueler`
--

LOCK TABLES `schueler` WRITE;
/*!40000 ALTER TABLE `schueler` DISABLE KEYS */;
INSERT INTO `schueler` VALUES (1,'Anderson',5,3,116,'USA',3,2),(2,'Archer',1,6,118,'USA',6,4),(3,'Armstrong',4,3,118,'GB',5,NULL),(4,'Baker',6,1,116,'GB',4,5),(5,'Barber',2,3,120,'USA',5,3),(6,'Bennett',4,2,250,'GB',5,1),(7,'Bishop',5,2,250,'USA',4,2),(8,'Black',1,5,250,'USA',2,1),(9,'Blair',1,2,250,'GB',4,1),(10,'Brown',4,5,118,'GB',4,4),(11,'Carter',3,5,252,'USA',3,1),(12,'Chaplin',5,4,117,'GB',3,5),(13,'Connor',3,5,117,'USA',5,1),(14,'Edison',4,4,250,'USA',5,2),(15,'Edwards',2,5,120,'GB',4,4),(16,'Eliot',2,2,116,'GB',6,2),(17,'Franklin',5,4,118,'USA',4,NULL),(18,'Garcia',2,3,118,'GB',3,3),(19,'Hanson',5,5,252,'USA',3,5),(20,'Harper',4,4,118,'USA',5,1),(21,'Hernandez',5,5,117,'GB',1,4),(22,'Hilton',4,2,120,'GB',2,4),(23,'Hobbs',3,4,117,'USA',4,2),(24,'Jackson',4,6,116,'GB',2,3),(25,'Jameson',2,2,117,'USA',3,2),(26,'Johnson',1,4,250,'USA',4,3),(27,'Jones',2,3,116,'GB',6,5),(28,'King',3,6,120,'GB',3,3),(29,'Lopez',6,1,251,'USA',6,5),(30,'Martinez',5,3,118,'GB',3,2),(31,'Mason',5,2,116,'USA',5,2),(32,'Mathewson',2,3,251,'USA',3,5),(33,'Michaels',5,3,250,'GB',4,5),(34,'Miller',5,5,117,'GB',2,1),(35,'Moore',4,6,117,'USA',2,4),(36,'Muller',4,5,250,'GB',1,1),(37,'Nolan',4,4,252,'USA',1,4),(38,'Parker',5,2,116,'USA',2,2),(39,'Ramirez',3,5,120,'GB',2,3),(40,'Rodriguez',3,5,116,'GB',4,3),(41,'Sawyer',1,4,117,'USA',5,2),(42,'Shoemaker',3,5,116,'GB',6,1),(43,'Smith',2,2,117,'USA',2,3),(44,'Stark',1,4,252,'USA',4,4),(45,'Stone',4,6,116,'GB',3,3),(46,'Thomas',3,5,117,'GB',4,NULL),(47,'Thompson',1,2,116,'USA',5,2),(48,'Warren',2,4,252,'GB',1,2),(49,'Ward',5,6,250,'USA',5,1),(50,'Wayne',3,4,116,'USA',2,5),(51,'West',3,5,252,'GB',6,4),(52,'White',3,3,120,'GB',3,3),(53,'Young',3,6,118,'USA',5,4),(54,'Popow',5,4,116,'RU',3,2),(55,'Sokolow',3,2,116,'RU',5,3),(56,'Lebedew',6,4,251,'RU',4,5),(57,'Koslow',5,6,117,'RU',5,2),(58,'Nowikow',3,4,252,'RU',4,4),(59,'Morosow',4,5,251,'RU',3,5),(60,'Petrow',2,6,117,'RU',5,4),(61,'Wolkow',6,1,251,'RU',5,1),(62,'Solowjow',4,3,250,'RU',2,NULL),(63,'Wassiljew',2,2,120,'RU',3,5),(64,'Saizew',1,5,120,'RU',5,2),(65,'Pawlow',2,4,117,'RU',2,3),(66,'Semjonow',3,5,120,'RU',6,2),(67,'Golubew',4,5,250,'RU',1,2),(68,'Winogradow',5,5,252,'RU',3,2),(69,'Bogdanow',5,4,252,'RU',3,2),(70,'Worobjow',1,2,118,'RU',4,4),(71,'Fjodorow',4,2,118,'RU',5,2),(72,'Michailow',5,4,250,'RU',5,3),(73,'Beljajew',4,6,116,'RU',5,2),(74,'Tarassow',3,1,120,'RU',4,4),(75,'Below',6,3,252,'RU',6,2),(76,'Komarow',5,3,117,'RU',5,1),(77,'Orlow',2,3,120,'RU',3,1),(78,'Kisseljow',5,6,116,'RU',5,2),(79,'Makarow',6,2,117,'RU',4,2),(80,'Andrejew',6,2,252,'RU',3,3),(81,'Kowaljow',6,1,251,'RU',5,3),(82,'Iljin',4,2,250,'RU',3,2),(83,'Gussew',2,6,117,'RU',2,3),(84,'Titow',3,4,252,'RU',3,5),(85,'Kusmin',2,3,117,'RU',6,4),(86,'Kudrjawzew',3,1,250,'RU',2,3),(87,'Baranow',2,2,118,'RU',4,2),(88,'Kulikow',6,2,252,'RU',3,1),(89,'Alexejew',1,3,116,'RU',2,3),(90,'Stepanow',2,2,250,'RU',6,3),(91,'Jakowlew',4,5,252,'RU',5,1),(92,'Sorokin',4,2,116,'RU',2,3),(93,'Sergejew',6,4,120,'RU',6,3),(94,'Romanow',2,5,117,'RU',4,1),(95,'Sacharow',4,3,117,'RU',4,5),(96,'Borissow',2,3,251,'RU',5,NULL),(97,'Koroljow',4,4,252,'RU',6,2),(98,'Gerassimow',5,5,250,'RU',4,4),(99,'Ponomarjow',3,5,252,'RU',5,3),(100,'Grigorjew',6,3,116,'RU',5,4),(101,'Smirnow',2,5,116,'RU',5,1),(102,'Iwanow',3,1,250,'RU',2,2),(103,'Kusnezow',5,3,251,'RU',5,2);
/*!40000 ALTER TABLE `schueler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smartphones`
--

DROP TABLE IF EXISTS `smartphones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smartphones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marke` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartphones`
--

LOCK TABLES `smartphones` WRITE;
/*!40000 ALTER TABLE `smartphones` DISABLE KEYS */;
INSERT INTO `smartphones` VALUES (1,'Samsung'),(2,'Apple'),(3,'HTC'),(4,'Google'),(5,'Sony');
/*!40000 ALTER TABLE `smartphones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-04 18:37:54
-- 1. Niedrigstes/Höchstes Gehalt eines Lehrers
SELECT MIN(Gehalt) AS 'Niedrigstes Gehalt', MAX(Gehalt) AS 'Höchstes Gehalt' FROM Lehrer;

-- 2. Niedrigstes Gehalt eines Mathelehrers
SELECT MIN(Gehalt) AS 'Niedrigstes Mathe-Gehalt'
FROM Lehrer
WHERE Fach = 'Mathe';

-- 3. Bester Notendurchschnitt aus Deutsch und Mathe
SELECT MIN((Note_Deutsch + Note_Mathe) / 2.0) AS 'Bester Durchschnitt'
FROM (
    SELECT s.ID, 
           MAX(CASE WHEN n.Fach = 'Deutsch' THEN n.Note END) AS Note_Deutsch,
           MAX(CASE WHEN n.Fach = 'Mathe' THEN n.Note END) AS Note_Mathe
    FROM Schueler s
    JOIN Note n ON s.ID = n.Schueler_ID
    GROUP BY s.ID
) AS Noten;

-- 4. Höchste und niedrigste Einwohnerzahl eines Ortes
SELECT MAX(Einwohnerzahl) AS 'Höchste Einwohnerzahl', MIN(Einwohnerzahl) AS 'Niedrigste Einwohnerzahl'
FROM Ort;

-- 5. Differenz zwischen größtem und kleinstem Ort
SELECT MAX(Einwohnerzahl) - MIN(Einwohnerzahl) AS 'Differenz'
FROM Ort;

-- 6. Anzahl aller Schüler
SELECT COUNT(*) AS 'Anzahl Schüler' FROM Schueler;

-- 7. Anzahl Schüler mit Smartphone
SELECT COUNT(*) AS 'Schüler mit Smartphone'
FROM Schueler
WHERE Smartphone IS NOT NULL;

-- 8. Schüler mit Smartphone von Samsung oder HTC
SELECT COUNT(*) AS 'Samsung oder HTC Smartphones'
FROM Schueler
WHERE SmartphoneMarke IN ('Samsung', 'HTC');

-- 9. Schüler, die in Waldkirch wohnen
SELECT COUNT(*) AS 'Schüler aus Waldkirch'
FROM Schueler s
JOIN Ort o ON s.Ort_ID = o.ID
WHERE o.Name = 'Waldkirch';

-- 10. Schüler von Herrn Bohnert, die in Emmendingen wohnen
SELECT COUNT(DISTINCT s.ID) AS 'Schüler von Bohnert aus Emmendingen'
FROM Schueler s
JOIN Unterricht u ON s.ID = u.Schueler_ID
JOIN Lehrer l ON u.Lehrer_ID = l.ID
JOIN Ort o ON s.Ort_ID = o.ID
WHERE l.Name = 'Bohnert' AND o.Name = 'Emmendingen';

-- 11. Wie viele Schüler unterrichtet Frau Zelawat?
SELECT COUNT(DISTINCT u.Schueler_ID) AS 'Schüler von Zelawat'
FROM Unterricht u
JOIN Lehrer l ON u.Lehrer_ID = l.ID
WHERE l.Name = 'Zelawat';

-- 12. Schüler russischer Nationalität bei Frau Zelawat
SELECT COUNT(DISTINCT s.ID) AS 'Russische Schüler bei Zelawat'
FROM Schueler s
JOIN Unterricht u ON s.ID = u.Schueler_ID
JOIN Lehrer l ON u.Lehrer_ID = l.ID
WHERE l.Name = 'Zelawat' AND s.Nationalitaet = 'Russisch';

-- 13. Lehrer mit dem höchsten Gehalt (Achtung: mehrere Lehrer möglich)
SELECT *
FROM Lehrer
WHERE Gehalt = (SELECT MAX(Gehalt) FROM Lehrer);
