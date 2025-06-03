-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `tbl_Passagier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tbl_Passagier` ;

CREATE TABLE IF NOT EXISTS `tbl_Passagier` (
  `ID_Passagier` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(30) NOT NULL,
  `Platznummer` VARCHAR(30) NULL,
  PRIMARY KEY (`ID_Passagier`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `ID_Passagier_UNIQUE` ON `tbl_Passagier` (`ID_Passagier` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `tbl_Projekt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tbl_Projekt` ;

CREATE TABLE IF NOT EXISTS `tbl_Projekt` (
  `ID_Projekt` INT NOT NULL AUTO_INCREMENT,
  `Bezeichnung` VARCHAR(30) NOT NULL,
  `Budget` DECIMAL(10) NULL,
  `tbl_Passagier_ID_Passagier` INT NOT NULL,
  PRIMARY KEY (`ID_Projekt`, `tbl_Passagier_ID_Passagier`),
  CONSTRAINT `fk_tbl_Projekt_tbl_Passagier`
    FOREIGN KEY (`tbl_Passagier_ID_Passagier`)
    REFERENCES `tbl_Passagier` (`ID_Passagier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_tbl_Projekt_tbl_Passagier_idx` ON `tbl_Projekt` (`tbl_Passagier_ID_Passagier` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `tbl_Ausweis`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tbl_Ausweis` ;

CREATE TABLE IF NOT EXISTS `tbl_Ausweis` (
  `ID_Ausweis` INT NOT NULL,
  `Nummer` VARCHAR(30) NULL,
  `Art` INT NULL,
  PRIMARY KEY (`ID_Ausweis`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tbl_Bus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tbl_Bus` ;

CREATE TABLE IF NOT EXISTS `tbl_Bus` (
  `ID_Bus` INT NOT NULL AUTO_INCREMENT,
  `Bezeichnung` VARCHAR(30) NOT NULL,
  `Kennzeichen` VARCHAR(30) NOT NULL,
  `Anzahl_Plätze` VARCHAR(30) NOT NULL,
  `tbl_Passagier_ID_Passagier` INT NOT NULL,
  PRIMARY KEY (`ID_Bus`, `tbl_Passagier_ID_Passagier`),
  CONSTRAINT `fk_tbl_Bus_tbl_Passagier1`
    FOREIGN KEY (`tbl_Passagier_ID_Passagier`)
    REFERENCES `tbl_Passagier` (`ID_Passagier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_tbl_Bus_tbl_Passagier1_idx` ON `tbl_Bus` (`tbl_Passagier_ID_Passagier` ASC) VISIBLE;

CREATE UNIQUE INDEX `ID_Bus_UNIQUE` ON `tbl_Bus` (`ID_Bus` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `tbl_Fahrer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tbl_Fahrer` ;

CREATE TABLE IF NOT EXISTS `tbl_Fahrer` (
  `ID_Fahrer` INT NOT NULL,
  `Vorname` VARCHAR(30) NOT NULL,
  `Nachname` VARCHAR(30) NOT NULL,
  `Geb.datum` DATE NOT NULL,
  `tbl_Ausweis_ID_Ausweis` INT NOT NULL,
  `tbl_Bus_ID_Bus` INT NOT NULL,
  PRIMARY KEY (`ID_Fahrer`, `tbl_Ausweis_ID_Ausweis`, `tbl_Bus_ID_Bus`),
  CONSTRAINT `fk_tbl_Fahrer_tbl_Ausweis1`
    FOREIGN KEY (`tbl_Ausweis_ID_Ausweis`)
    REFERENCES `tbl_Ausweis` (`ID_Ausweis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_Fahrer_tbl_Bus1`
    FOREIGN KEY (`tbl_Bus_ID_Bus`)
    REFERENCES `tbl_Bus` (`ID_Bus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_tbl_Fahrer_tbl_Ausweis1_idx` ON `tbl_Fahrer` (`tbl_Ausweis_ID_Ausweis` ASC) VISIBLE;

CREATE INDEX `fk_tbl_Fahrer_tbl_Bus1_idx` ON `tbl_Fahrer` (`tbl_Bus_ID_Bus` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
