CREATE DATABASE  IF NOT EXISTS `tourenplaner`;
USE `tourenplaner`;

--
-- Table structure for table `tbl_disponent`
--

DROP TABLE IF EXISTS `tbl_disponent`;
CREATE TABLE `tbl_disponent` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Vorname` varchar(45) NOT NULL,
  `Telefonnummer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) AUTO_INCREMENT=3;


--
-- Dumping data for table `tbl_disponent`
--

LOCK TABLES `tbl_disponent` WRITE;
/*!40000 ALTER TABLE `tbl_disponent` DISABLE KEYS */;
INSERT INTO `tbl_disponent` VALUES (1,'Disponento','Andreas','044111111'),(2,'Disponenta','Sandra','044111112');
/*!40000 ALTER TABLE `tbl_disponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fahrer`
--

DROP TABLE IF EXISTS `tbl_fahrer`;
CREATE TABLE `tbl_fahrer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Vorname` varchar(45) NOT NULL,
  `Telefonnummer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) AUTO_INCREMENT=4;

--
-- Dumping data for table `tbl_fahrer`
--

LOCK TABLES `tbl_fahrer` WRITE;
/*!40000 ALTER TABLE `tbl_fahrer` DISABLE KEYS */;
INSERT INTO `tbl_fahrer` VALUES (1,'Drivero','Tomaso','079111115'),(2,'Drivera','Vanessa','079111117'),(3,'Driver','John','079111116');
/*!40000 ALTER TABLE `tbl_fahrer` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `tbl_fahrzeug`
--
DROP TABLE IF EXISTS `tbl_fahrzeug`;
CREATE TABLE `tbl_fahrzeug` (
  `Kennzeichen` varchar(10) NOT NULL,
  `SitzPlaetze` int NOT NULL,
  PRIMARY KEY (`Kennzeichen`)
);

--
-- Dumping data for table `tbl_fahrzeug`
--

LOCK TABLES `tbl_fahrzeug` WRITE;
/*!40000 ALTER TABLE `tbl_fahrzeug` DISABLE KEYS */;
INSERT INTO `tbl_fahrzeug` VALUES ('GE 12043',10),('ZG 2012',30),('ZH 203434',34);
/*!40000 ALTER TABLE `tbl_fahrzeug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fahrten`
--

DROP TABLE IF EXISTS `tbl_fahrten`;
CREATE TABLE `tbl_fahrten` (
  `ID_Fahrt` int NOT NULL AUTO_INCREMENT,
  `FS_Kennzeichen_Fahrzeug` varchar(10) NOT NULL,
  `FS_ID_Disponent` int NOT NULL,
  PRIMARY KEY (`ID_Fahrt`),  
  CONSTRAINT `fk_tbl_Fahrten_tbl_Disponent1` 
   FOREIGN KEY (`FS_ID_Disponent`) 
   REFERENCES `tbl_disponent` (`ID`),
  CONSTRAINT `fk_tbl_Fahrten_tbl_Fahrzeug1` 
   FOREIGN KEY (`FS_Kennzeichen_Fahrzeug`) 
   REFERENCES `tbl_fahrzeug` (`Kennzeichen`) 
   ON UPDATE CASCADE
) AUTO_INCREMENT=5;


--
-- Dumping data for table `tbl_fahrten`
--

LOCK TABLES `tbl_fahrten` WRITE;
/*!40000 ALTER TABLE `tbl_fahrten` DISABLE KEYS */;
INSERT INTO `tbl_fahrten` VALUES (1,'ZG 2012',1),(2,'ZH 203434',2),(3,'ZG 2012',1),(4,'GE 12043',2);
/*!40000 ALTER TABLE `tbl_fahrten` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `tbl_orte`
--

DROP TABLE IF EXISTS `tbl_orte`;
CREATE TABLE `tbl_orte` (
  `ID_Ort` int NOT NULL AUTO_INCREMENT,
  `PLZ` varchar(6) DEFAULT NULL,
  `Ortsbezeichnung` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Ort`)
) AUTO_INCREMENT=6;

--
-- Dumping data for table `tbl_orte`
--

LOCK TABLES `tbl_orte` WRITE;
/*!40000 ALTER TABLE `tbl_orte` DISABLE KEYS */;
INSERT INTO `tbl_orte` VALUES (1,'6340','Baar'),(2,'8001','Zürich'),(3,'6000','Luzern'),(4,'1000','Geneva'),(5,'4000','Basel');
/*!40000 ALTER TABLE `tbl_orte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_stationen`
--

DROP TABLE IF EXISTS `tbl_stationen`;
CREATE TABLE `tbl_stationen` (
  `FS_ID_Fahrt` int NOT NULL,
  `FS_ID_Ort` int NOT NULL,
  `Abfahrtszeit` datetime DEFAULT NULL,
  `Ankunftszeit` datetime DEFAULT NULL,
  `FS_ID_Fahrer` int NOT NULL,
  PRIMARY KEY (`FS_ID_Fahrt`,`FS_ID_Ort`),  
  CONSTRAINT `fk_tbl_Fahrten_has_tbl_Orte_tbl_Person1` 
    FOREIGN KEY (`FS_ID_Fahrer`) 
    REFERENCES `tbl_fahrer` (`ID`),
  CONSTRAINT `fk_{ACFE9F9D-C013-4C23-9E93-8A7A284EF6AF}` 
    FOREIGN KEY (`FS_ID_Ort`) REFERENCES `tbl_orte` (`ID_Ort`),
  CONSTRAINT `fk_{CBEB6D4D-E005-4950-993C-931E35FBB2D4}` 
    FOREIGN KEY (`FS_ID_Fahrt`) REFERENCES `tbl_fahrten` (`ID_Fahrt`)
);


--
-- Dumping data for table `tbl_stationen`
--

LOCK TABLES `tbl_stationen` WRITE;
/*!40000 ALTER TABLE `tbl_stationen` DISABLE KEYS */;
INSERT INTO `tbl_stationen` VALUES (1,1,'2021-08-01 10:00:00',NULL,1),(1,2,NULL,'2021-08-01 11:30:00',1),(2,1,NULL,'2021-08-02 13:00:00',3),(2,2,'2021-08-02 09:00:00','2021-08-02 08:40:00',3),(2,3,'2021-08-02 07:00:00',NULL,2),(2,5,'2021-08-02 10:00:00','2021-08-02 09:50:00',3),(3,1,'2021-08-03 12:00:00','2021-08-03 11:50:00',1),(3,2,NULL,'2021-08-03 14:00:00',1),(3,4,'2021-08-03 10:00:00',NULL,1),(4,2,'2021-08-04 10:00:00',NULL,2),(4,3,NULL,'2021-08-04 11:00:00',2);
/*!40000 ALTER TABLE `tbl_stationen` ENABLE KEYS */;
UNLOCK TABLES;
INSERT INTO tbl_orte (PLZ, Ortsbezeichnung) VALUES ('3000', 'Bern');
UPDATE tbl_stationen
SET FS_ID_Ort = 6
WHERE FS_ID_Ort = 5;
DELETE FROM tbl_orte
WHERE ID_Ort = 5;
