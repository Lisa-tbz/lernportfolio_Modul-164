-- 1. Datenbank erstellen, falls noch nicht vorhanden
CREATE DATABASE IF NOT EXISTS meine_datenbank;

-- 2. Datenbank auswählen
USE meine_datenbank;

-- 3. Tabelle tbl_fahrer erstellen
CREATE TABLE IF NOT EXISTS tbl_fahrer (
    ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(45) NOT NULL,
    Vorname VARCHAR(45) NOT NULL,
    Telefonnummer VARCHAR(45),
    PRIMARY KEY (ID)
) DEFAULT CHARSET = utf8mb4;

-- 4. Tabelle tbl_disponent erstellen
CREATE TABLE IF NOT EXISTS tbl_disponent (
    ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(45) NOT NULL,
    Vorname VARCHAR(45) NOT NULL,
    Telefonnummer VARCHAR(45),
    PRIMARY KEY (ID)
) DEFAULT CHARSET = utf8mb4;

-- 5. Tabelle tbl_mitarbeiter erstellen
CREATE TABLE IF NOT EXISTS tbl_mitarbeiter (
    MA_ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50),
    Vorname VARCHAR(30),
    Geburtsdatum DATETIME,
    Telefonnummer VARCHAR(12),
    Einkommen FLOAT(10,2),
    PRIMARY KEY (MA_ID)
) DEFAULT CHARSET = utf8mb4;

-- 6. Charset von Name und Vorname in tbl_mitarbeiter ändern auf latin1
ALTER TABLE tbl_mitarbeiter
MODIFY Name VARCHAR(50) CHARACTER SET latin1,
MODIFY Vorname VARCHAR(30) CHARACTER SET latin1;

-- 7. Spalten Name, Vorname, Telefonnummer aus tbl_fahrer löschen
ALTER TABLE tbl_fahrer
DROP COLUMN Name,
DROP COLUMN Vorname,
DROP COLUMN Telefonnummer;

-- 8. Spalten Name, Vorname, Telefonnummer aus tbl_disponent löschen
ALTER TABLE tbl_disponent
DROP COLUMN Name,
DROP COLUMN Vorname,
DROP COLUMN Telefonnummer;

-- 9. Fremdschlüssel MA_ID in tbl_fahrer ergänzen
ALTER TABLE tbl_fahrer
ADD COLUMN MA_ID INT,
ADD CONSTRAINT fk_fahrer_mitarbeiter
FOREIGN KEY (MA_ID) REFERENCES tbl_mitarbeiter(MA_ID);

-- 10. Fremdschlüssel MA_ID in tbl_disponent ergänzen
ALTER TABLE tbl_disponent
ADD COLUMN MA_ID INT,
ADD CONSTRAINT fk_disponent_mitarbeiter
FOREIGN KEY (MA_ID) REFERENCES tbl_mitarbeiter(MA_ID);
