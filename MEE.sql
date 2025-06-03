-- Aufgabe 1
CREATE DATABASE IF NOT EXISTS db_m164_MEE;
USE db_m164_MEE;

DROP TABLE IF EXISTS MEE_T_disponent;
-- Aufgabe 2 und 3
CREATE TABLE MEE_T_disponent (
    ID_Disponent INT NOT NULL AUTO_INCREMENT,
    Nachname VARCHAR(30) NOT NULL,
    Vorname VARCHAR(20) NOT NULL,
    Telefonnummer VARCHAR(45),
    FS_Disp_Mentor INT,
    MEE_monatsgehalt DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (ID_Disponent),
    FOREIGN KEY (FS_Disp_Mentor) REFERENCES MEE_T_disponent(ID_Disponent)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
-- Aufgabe 4
INSERT INTO MEE_T_disponent 
    (Nachname, Vorname, Telefonnummer, FS_Disp_Mentor, MEE_monatsgehalt)
VALUES
    ('Meergans', 'Lisa', '+41 79 123 45 67', NULL, 5000.00),
    ('Rüdisühli', 'René', '+41 78 234 56 78', NULL, 5050.50),
    ('Ägerter', 'Zoë', '+41 77 345 67 89', NULL, 4950.75);
    
-- Aufgabe 5
INSERT INTO MEE_T_disponent (Nachname, Vorname, Telefonnummer, FS_Disp_Mentor, MEE_monatsgehalt) VALUES
('Amberg', 'Anna', '+41 76 123 45 10', NULL, 4800.00),
('Bär', 'Markus', '+49 170 123 45 67', NULL, 4700.00),
('Christ', 'Sabine', '+41 78 234 56 11', NULL, 4900.00),
('Dürr', 'Thomas', '+41 79 345 67 22', NULL, 4850.00),
('Meergans', 'Barbara', '+41 77 456 78 33', NULL, 4750.00),
('Meergans', 'Claus', '+41 76 567 89 44', NULL, 4600.00);

-- Aufgabe 6
UPDATE MEE_T_disponent
SET MEE_monatsgehalt = MEE_monatsgehalt + 123.24
WHERE Vorname = 'Lisa' AND Nachname = 'Meergans';

-- Aufgabe 7
UPDATE MEE_T_disponent mentee
SET FS_Disp_Mentor = (
    SELECT mentor.ID_Disponent 
    FROM MEE_T_disponent mentor 
    WHERE mentor.Vorname = 'Lisa' AND mentor.Nachname = 'Meergans'
)
WHERE mentee.Nachname IN ('Amberg', 'Bär');

UPDATE MEE_T_disponent mentee
SET FS_Disp_Mentor = (
    SELECT mentor.ID_Disponent
    FROM MEE_T_disponent mentor
    WHERE mentor.Vorname = 'Markus' AND mentor.Nachname = 'Bär'
)
WHERE mentee.Nachname IN ('Christ', 'Dürr');

-- Aufgabe 8
SHOW DATABASES;

SHOW TABLES;

DESCRIBE MEE_T_disponent;

SELECT Nachname, MEE_monatsgehalt FROM MEE_T_disponent;

SELECT SUM(MEE_monatsgehalt) AS Gesamtgehalt FROM MEE_T_disponent;

-- Aufgabe 9
SELECT 
    d.Vorname AS Disponent_Vorname,
    d.Nachname AS Disponent_Nachname,
    m.Vorname AS Mentor_Vorname,
    m.Nachname AS Mentor_Nachname
FROM 
    MEE_T_disponent d
LEFT JOIN 
    MEE_T_disponent m ON d.FS_Disp_Mentor = m.ID_Disponent;

-- Aufgabe 10
SELECT 
    ID_Disponent, 
    Nachname, 
    Telefonnummer, 
    MEE_monatsgehalt
FROM 
    MEE_T_disponent
WHERE 
    FS_Disp_Mentor IS NOT NULL
    AND Telefonnummer LIKE '+41%'
ORDER BY 
    MEE_monatsgehalt ASC;
