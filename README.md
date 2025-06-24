## Theorie: Generalisierung und Spezialisierung in der Datenbankmodellierung
 Ausgangspunkt
In der Attribut-basierten Datenbankmodellierung werden Informationen über reale Objekte in Entitätstypen mit Attributen organisiert. Dabei entstehen manchmal Redundanzen:

• mehrere Entitätstypen viele gemeinsame Attribute besitzen,

• und ein reales Objekt durch mehrere Entitätstypen dargestellt wird (z. B. Mitarbeiter ist auch Kunde).

Problem
• Gemeinsame Attribute mehrfach gespeichert → Redundanz
 
• Unterschiedliche Attribute verteilt → Inkonsistenzgefahr
 
• Widerspruch zur Regel von [Zehnder, 1989]: „Lokale Attribute dürfen nur einmal in einer Datenbank vorkommen.“

Lösung: Generalisierung & Spezialisierung
Generalisierung:

• Gemeinsame Attribute werden in einem übergeordneten Entitätstyp zusammengefasst (z. B. Person).

Spezialisierung:

• Spezifische Entitätstypen (z. B. Mitarbeiter, Kunde, Fahrer) erben diese gemeinsamen Attribute, haben aber zusätzlich eigene Attribute.
Beziehungstyp:
→ is_a-Beziehung (z. B. Ein Fahrer ist eine Person)
![image](https://github.com/user-attachments/assets/b3e65d2a-dbf1-4610-930f-23ed769cddfb)


 Technische Umsetzung in relationalen Datenbanken

• Tabelle Person enthält gemeinsame Attribute wie Vorname, Nachname, Geburtsdatum

• Tabellen Mitarbeiter, Kunde, Fahrer enthalten nur die spezifischen Attribute

• Mitarbeiter.person_id ist ein Fremdschlüssel auf Person.id

Beispiel Generalisierung: Fahrzeug
	
 • Fahrzeug (gemeinsame Attribute: Marke, Baujahr)
	
  ○ PKW (eigene Attribute: Sitzplätze, Kombi/Schrägheck)
	
  ○ LKW (eigene Attribute: Ladegewicht, Anhängerkupplung)


![image](https://github.com/user-attachments/assets/17f80d3b-4951-4c77-bfc0-edea37c5d0e5)

Praktische Umsetzung:

CREATE TABLE Person (
  
  id INT PRIMARY KEY,
  
  name VARCHAR(100),
  
  birthdate DATE
);

CREATE TABLE Employee (
  
  person_id INT PRIMARY KEY,
  
  department VARCHAR(50),
  
  FOREIGN KEY (person_id) REFERENCES Person(id)
);

CREATE TABLE Client (
  
  person_id INT PRIMARY KEY,
  
  clientNumber VARCHAR(20),
  
  FOREIGN KEY (person_id) REFERENCES Person(id)
);

## Beziehungsarten: Indentifying / Non-Identifying Relationship
- Identifying Relationship (identifizierende Beziehung)
- 
Definition: Die Child-Tabelle wird eindeutig durch die Parent-Tabelle identifiziert.

Technisch: Der Fremdschlüssel der Parent-Tabelle ist Teil von dem Primärschlüssel der Child-Tabelle.

Primärschlüssel der Kind-Tabelle ist zusammengesetzt aus mindestens zwei Attributen.

Bedeutung: Der Datensatz der Child-Tabelle existiert nur im Kontext der Parent-Tabelle.

Beispiel:

Gebäude → Raum: Ein Raum existiert nur innerhalb eines bestimmten Gebäudes.

Raum(Gebäude_ID, Raumnummer) → Gebäude_ID ist FK + Teil des PK

Non-Identifying Relationship (nicht-identifizierende Beziehung)

Definition: Die Child-Tabelle kann unabhängig von der Parent-Tabelle identifiziert werden.

Technisch: Der Fremdschlüssel ist nicht Teil des Primärschlüssels, sondern ein zusätzliches Attribut.

Bedeutung: Der Datensatz der Child-Tabelle kann auch ohne die Parent-Tabelle eindeutig existieren.

Beispiel:

Person → Ausweis: Ein Ausweis gehört zu einer Person, aber der Ausweis hat eine eigene eindeutige ID.

Ausweis(ID, person_id) → person_id ist FK, aber nicht Teil des PK

Identifying: 

Beispiel: Bestellung → Bestellposition

Eine Bestellposition existiert nur im Kontext einer bestimmten Bestellung

Bestellposition(bestellung_id, positionsnr) → bestellung_id ist FK + Teil des PK

Warum Identifying sinnvoll?

Eine Bestellposition ohne zugehörige Bestellung macht keinen Sinn.

Die Kombination aus bestellung_id und positionsnr identifiziert jede Position eindeutig.


Identifying Beispiel
![image](https://github.com/user-attachments/assets/2ea71f36-2651-42ac-8461-bf7cdb4a1e3e)

Non Identifying Beispiel
![image](https://github.com/user-attachments/assets/351f171a-13fa-4135-9436-36594a0fc499)

Anwendungsfälle für Identifying Relationships (laut ChatGPT)
Buch → Kapitel
Kapitel existieren nicht ohne Buch, Kapitelnummer + Buch-ID = Primärschlüssel

Kunde → Lieferadresse
Wenn Lieferadressen nicht global eindeutig sind, sondern nur pro Kunde eindeutig sein müssen

Produkt → Produktbild
Bilder sind nur im Kontext des Produkts sinnvoll


## Datenbankmanagementsysteme (DBMS)

Ein Datenbankmanagementsystem (DBMS) ist eine Software zur Verwaltung von Datenbanken. Es ermöglicht die strukturierte Speicherung, Organisation und den Zugriff auf Daten.

Hauptfunktionen eines DBMS

Integrierte Datenhaltung: Zentrale Verwaltung aller Daten, um Redundanzen zu vermeiden.

Datenbanksprache: Bereitstellung von Sprachen wie DDL (Data Definition Language), DML (Data Manipulation Language), DQL (Data Query Language), DCL (Data Control Language) und TCL (Transaction Control Language) zur Definition, Manipulation und Abfrage von Daten.

Benutzersichten (Views): Ermöglichen unterschiedliche Sichten auf die Daten für verschiedene Benutzergruppen.

Konsistenzkontrolle: Sicherstellung der Datenintegrität durch Integritätsbedingungen.

Transaktionen: Unterstützung von Transaktionen, um Datenänderungen atomar und konsistent durchzuführen.

Mehrbenutzerfähigkeit: Gleichzeitiger Zugriff mehrerer Benutzer auf die Datenbank mit Synchronisation zur Vermeidung von Konflikten.

Datensicherung und Wiederherstellung: Mechanismen zur Sicherung der Daten und Wiederherstellung im Fehlerfall.

Vorteile eines DBMS

Standardisierung: Einheitliche Datenformate und -strukturen.

Effizienter Datenzugriff: Optimierte Abfragen und Datenmanipulation.

Kürzere Entwicklungszeiten: Wiederverwendbare Komponenten und Funktionen.

Hohe Flexibilität: Einfache Anpassung an sich ändernde Anforderungen.

Hohe Verfügbarkeit: immer zuverlässiger Zugriff auf Daten 

Wirtschaftlichkeit: Zentrale Verwaltung reduziert Gesamtkosten.

Nachteile eines DBMS

Hohe Anfangsinvestitionen: Kosten für Hardware und Software.

Komplexität: Erfordert spezialisiertes Personal.

![image](https://github.com/user-attachments/assets/825162c7-8727-4d03-9f92-d7f641cd2a36)

Top 10 Datenbanken im Mai 2025 (laut DB-Engines Ranking)
Die folgenden Datenbanken führen das DB-Engines Ranking im Mai 2025 an:

Oracle – Führend in Unternehmenslösungen mit umfangreichen Funktionen.

MySQL – Weit verbreitetes Open-Source-RDBMS, besonders für Webanwendungen.

Microsoft SQL Server – Integriert in das Microsoft-Ökosystem, beliebt bei Unternehmen.

PostgreSQL – Fortschrittliches Open-Source-RDBMS mit starker Community.

MongoDB – Führende dokumentenorientierte NoSQL-Datenbank.

Snowflake – Cloud-basierte Data-Warehouse-Lösung mit starkem Wachstum.

Redis – In-Memory-Datenbank, ideal für schnelle Datenzugriffe.

Elasticsearch – Such- und Analyse-Engine, häufig für Log- und Textanalysen verwendet.

IBM Db2 – Bewährte Lösung für große Unternehmen mit komplexen Anforderungen.

SQLite – Leichtgewichtiges, eingebettetes RDBMS für mobile und Desktop-Anwendungen

MindMap
![image](https://github.com/user-attachments/assets/dd330aef-2ba0-4e3d-9de8-5bd0f084e463)




Tag 3

![image](https://github.com/user-attachments/assets/b5fbf64e-1388-48fd-82ba-fba6075fe614)


Mehrfachbeziehungen (Mehrfachrollen)

Zwei Tabellen (z. B. tbl_Fahrten und tbl_Orte) können mehrere unabhängige Beziehungen zueinander haben.

Diese Beziehungen müssen aussagekräftig benannt werden (z. B. "Startort", "Zielort", "wird angefahren in").

Bei mc:mc-Beziehungen (viele-zu-viele) wird eine Transformationstabelle benötigt, z. B. tbl_Fahrtorte, die alle Orte auflistet, die bei einer Fahrt angefahren werden.

(2) Rekursion (strenge Hierarchie)

Eine Tabelle kann auch Beziehungen zu sich selbst haben.

Beispiel: In tbl_Mitarbeiter ist jeder Mitarbeiter einem Vorgesetzten unterstellt.

Dafür braucht es einen Fremdschlüssel in derselben Tabelle, der auf die eigene ID verweist.

Da der oberste Mitarbeiter keinen Vorgesetzten hat, muss das Feld NULL-fähig sein.

Es handelt sich um eine 1:mc-Beziehung (ein Vorgesetzter – mehrere Untergebene).

(3) Einfache Hierarchie (Netzwerkstruktur)
Wenn mehrere Vorgesetzte möglich sind, reicht eine Rekursion nicht.

Man braucht eine Zwischentabelle, z. B. tbl_Hierarchie, mit zwei Fremdschlüsseln:

Einer für den Vorgesetzten

Einer für den Mitarbeiter

So entsteht eine mc:mc-Beziehung innerhalb derselben Tabelle, aber mit unterschiedlichen Rollen ("ist Vorgesetzter von", "ist Mitarbeiter von").

(4) Stücklistenproblem (mehrstufige Produktstruktur)
Beispiel: Ein Produkt besteht aus mehreren Teilen, diese wiederum aus weiteren Teilen.

Alle Artikel (Einzelteile + Baugruppen) stehen in einer Tabelle (tbl_Artikel).

Eine zusätzliche Zusammensetzungstabelle wird benötigt:

Gibt an, welches Teil in welchem Produkt vorkommt, mit Menge.

Lässt sich mit rekursiven SQL-Abfragen lösen.

Aufgabe Insert


![image](https://github.com/user-attachments/assets/0a9cb626-dd75-4aea-9b0a-c65c791c7a3e)

2. Die folgenden Anweisungen enthalten Fehler. Finden und korrigieren Sie die Fehler. Probieren Sie die Funktionsfähigkeit der Befehle an der obigen Tabelle aus.
a.

INSERT INTO (nachname, wohnort, land_id) VALUES ('Fesenkampp', 'Duis-burg', 3);

Fehler: Tabellennamen fehlt.

Korrekt:

INSERT INTO kunden (nachname, wohnort, land_id) VALUES ('Fesenkampp', 'Duis-burg', 3);

b.

INSERT INTO kunden ('vorname') VALUES ('Herbert');

Fehler: Spaltennamen darf nicht in einfachen Hochkommas stehen.

Korrekt:

INSERT INTO kunden (vorname) VALUES ('Herbert');

c.

INSERT INTO kunden (nachname, vorname, wohnort, land_id) VALUES ('Schulter', 'Albert', 'Duisburg', 'Deutschland');

Fehler: 'Deutschland' ist kein gültiger INT für land_id.

Korrekt:

INSERT INTO kunden (nachname, vorname, wohnort, land_id) VALUES ('Schulter', 'Albert', 'Duisburg', 3);

d.

INSERT INTO kunden ('', 'Brunhild', 'Sulcher', 1, 'Süderstade');

Fehler: Ungültige Syntax – Spaltenliste fehlt, 'Brunhild' ist kein gültiger Tabelleneintrag.
Korrekt (Langform):

INSERT INTO kunden (vorname, nachname, land_id, wohnort) VALUES ('Brunhild', 'Sulcher', 1, 'Süderstade');

e.

INSERT INTO kunden VALUES ('Jochen', 'Schmied', 2, 'Solingen');

Fehler: kunde_id fehlt → muss durch NULL ersetzt werden. 
Korrekt:

INSERT INTO kunden VALUES (NULL, 'Jochen', 'Schmied', 2, 'Solingen');

f.

INSERT INTO kunden VALUES ('', 'Doppelbrecher', 2, '');

Fehler: Zu wenige Werte (nur 4 statt 5), außerdem '' als kunde_id ist ungültig.
Korrekt:

INSERT INTO kunden (nachname, land_id) VALUES ('Doppelbrecher', 2);

g.

INSERT INTO kunden (nachname, wohnort, land_id) VALUES ('Christoph', 'Fesenkampp', 'Duisburg', 3);

Fehler: Zu viele Werte für 3 Spalten.
Korrekt (3 Werte, 3 Spalten):

INSERT INTO kunden (nachname, wohnort, land_id) VALUES ('Fesenkampp', 'Duisburg', 3);

h.

INSERT INTO kunden (vorname) VALUES ('Herbert');

Dieser ist korrekt! Kein Fehler.
i.

INSERT INTO kunden (nachname, vorname, wohnort, land_id) VALUES (Schulter, Albert, Duisburg, 1);

Fehler: Strings müssen in Anführungszeichen stehen.
Korrekt:

INSERT INTO kunden (nachname, vorname, wohnort, land_id) VALUES ('Schulter', 'Albert', 'Duisburg', 1);

j.

INSERT INTO kunden VALUE ('', "Brunhild", "Sulcher", 1, "Süderstade");

Fehler:

VALUE → muss VALUES heißen

'' für kunde_id ungültig → verwende NULL

 besser keine doppelten Anführungszeichen

Korrekt:

INSERT INTO kunden VALUES (NULL, 'Brunhild', 'Sulcher', 1, 'Süderstade');

k.

INSERT INTO kunden VALUE ('', 'Jochen', 'Schmied', 2, Solingen);

Fehler:

VALUE → muss VALUES heißen

'' für kunde_id → besser NULL

Solingen ohne Quotes → Fehler

Korrekt:

INSERT INTO kunden VALUES (NULL, 'Jochen', 'Schmied', 2, 'Solingen');


## Constraint

1. Wie wird beim Fremdschlüssel der Constraint NOT NULL erstellt?
Der NOT NULL Constraint wird direkt bei der Definition der Fremdschlüsselspalte in der Tabelle angegeben, z.B.:


ALTER TABLE DetailTab
  MODIFY COLUMN fk_id INT NOT NULL;
Oder bei der Spaltendefinition:


CREATE TABLE DetailTab (
  fk_id INT NOT NULL,
  ...
);
Das NOT NULL erzwingt, dass die Spalte keinen NULL-Wert annimmt.

Damit ist sichergestellt, dass jede Zeile immer einen gültigen Wert für den Fremdschlüssel hat.

Dies ist eine Spalten-Einschränkung, kein eigenständiger CONSTRAINT-Name.

2. Weshalb wird für jeden Fremdschlüssel ein Index erstellt?
Fremdschlüsselspalten müssen indexiert sein, damit die referenzielle Integrität effizient geprüft werden kann.

Der Index ermöglicht schnelle Suchen und Verknüpfungen bei JOINs oder bei der Überprüfung, ob ein Wert im referenzierten Primärschlüssel existiert.

Ohne Index würde jede Fremdschlüsselüberprüfung eine Volltabelle-Scan verursachen, was die Performance stark verschlechtert.

Deshalb erzeugt MySQL (und auch andere RDBMS) automatisch einen Index auf der FK-Spalte, falls noch keiner existiert.

3. Wie wird der Constraint UNIQUE für einen Fremdschlüssel im Workbench mit Forward Engineering erstellt?
Wenn im Modell die FK-Spalte mit UNIQUE markiert ist, generiert Workbench einen UNIQUE-Index oder -Constraint.

Die Definition sieht z.B. so aus:

ALTER TABLE DetailTab
  ADD CONSTRAINT uq_detailtab_fk_id UNIQUE (fk_id);
Oder in der Spaltendefinition:

fk_id INT NOT NULL UNIQUE
Das UNIQUE stellt sicher, dass jeder Wert in der FK-Spalte nur einmal vorkommen darf.

Dadurch wird die Beziehung auf 1:1 oder c:c eingeschränkt.

4. Allgemeine Syntax für die CONSTRAINT-Anweisung (Fremdschlüssel)
Die Fremdschlüssel-Constraint wird meistens so definiert:

CONSTRAINT <constraint_name> FOREIGN KEY (<fk_column>)
REFERENCES <referenced_table> (<referenced_column>)
[ON DELETE <action>]
[ON UPDATE <action>]
Beispiel:


CONSTRAINT fk_detail_master FOREIGN KEY (master_id)
REFERENCES MasterTab(id)
ON DELETE CASCADE
ON UPDATE CASCADE
<constraint_name>: eindeutiger Name des Constraints

<fk_column>: die Fremdschlüsselspalte in der Tabelle

<referenced_table> und <referenced_column>: referenzierte Tabelle und Spalte

ON DELETE und ON UPDATE: Aktionen bei Löschung/Aktualisierung der referenzierten Zeile (CASCADE, SET NULL, NO ACTION, etc.)

## Löschen in professionellen Datenbanken und Datenintegrität

In professionellen Datenbanksystemen wird das Löschen von Daten mit dem SQL-Befehl DELETE in der Regel vermieden. Der Grund ist der mögliche Informationsverlust, der nicht nur ungewollt ist, sondern auch rechtliche oder betriebliche Probleme verursachen kann. Statt Daten zu löschen, werden folgende Strategien verwendet:

Inaktiv setzen statt löschen: Zum Beispiel wird bei einem austretenden Mitarbeiter der Datensatz beibehalten, aber als „inaktiv“ markiert.

Historisierung und Protokollierung: Daten wie Zugriffe oder Aktionen bleiben nachvollziehbar. Das ist z. B. in Banken oder bei Systemen wie Wikipedia wichtig.

Stornierungen statt Löschungen: In Kassensystemen werden getätigte Käufe nicht gelöscht, sondern durch eine Stornierung neutralisiert – oft mit Zusatzinformationen wie Zeit und Grund.

Zeitliche Abbildung durch Zusatztabellen: Statt Updates werden Zeitverläufe (z. B. Ausleihen) durch neue, separate Datensätze dokumentiert.

## Datenintegrität:

Datenintegrität in einer Datenbank bezieht sich auf die Genauigkeit, Konsistenz und Vollständigkeit der in der Datenbank gespeicherten Daten. Sie stellt sicher, dass die Daten korrekt sind und nicht versehentlich oder absichtlich verändert werden.

Eindeutigkeit & Konsistenz: Verhindert doppelte oder widersprüchliche Daten.

Referenzielle Integrität: Beziehungen zwischen Tabellen bleiben korrekt.

Datentypen & Einschränkungen: Sorgen für korrekte und gültige Eingaben.

Validierung: Prüft Eingaben vor der Speicherung.


## Fremdschlüssel-Optionen beim Löschen 
Beim Löschen eines Datensatzes in der Primärtabelle greifen definierte Regeln für abhängige Datensätze (Fremdschlüssel) in Detailtabellen:

NO ACTION / RESTRICT:	Löschen nur möglich, wenn keine abhängigen Datensätze existieren. (Standard)
CASCADE:	Abhängige Datensätze werden automatisch mitgelöscht. Vorsicht vor Datenverlust!
SET NULL / DEFAULT:	Fremdschlüssel wird auf NULL bzw. Default-Wert gesetzt, wenn zulässig.

## Weshalb können in professionellen Datenbanken nicht einfach so Daten gelöscht werden?

In professionellen Datenbanken darf nicht einfach gelöscht werden, weil dadurch wichtige Informationen verloren gehen. Besonders wenn Beziehungen zu anderen Tabellen bestehen, führt das Löschen eines Eintrags oft zu Inkonsistenzen oder dem Verlust von Historie (z. B. bei Logins, Bestellungen, Buchungen). Statt zu löschen, wird meist:

Inaktiv gesetzt (z. B. „Status: inaktiv“),

historisiert (alte Daten bleiben mit Zeitstempel erhalten),

oder storniert (z. B. durch Gegentransaktionen).

## Wer stellt die referentielle Integrität sicher?

Die referentielle Integrität wird vom Datenbankmanagementsystem (DBMS) sichergestellt, sobald Fremdschlüssel-Constraints (FOREIGN KEY) zwischen Tabellen definiert wurden. Diese Constraints kontrollieren automatisch, dass:

keine ungültigen Verweise entstehen,

bei Lösch- oder Änderungsoperationen entsprechende Regeln (ON DELETE / ON UPDATE) eingehalten werden.

## Referentielle Intergrität
Referentielle Integrität bedeutet, dass ein Fremdschlüssel (Foreign Key) in einer Tabelle nur auf existierende Werte im Primärschlüssel (Primary Key) einer anderen Tabelle verweisen darf.


## Aufgabe Renferentielle Datenintergriät
Als Datenbank-Entwickler stellen Sie fest, dass bei der Dateneingabe ein Fehler passiert ist. Anstatt «4000 Basel» wollten Sie «3000 Bern» eintragen. Sie versuchen Ihren Fehler zu korrigieren, indem Sie in der Tabelle «tbl_ort» die Ortschaft «Basel» löschen.
Was stellen sie fest? Erklären Sie!

Man erhält folgenden Fehler:
Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails

Erklärung: Weil tbl_stationen einen Fremdschlüssel-Constraint auf tbl_orte hat, kann Basel nicht gelöscht werden, solange es in tbl_stationen referenziert wird.
Das ist referentielle Integrität: Die Datenbank schützt sich selbst vor „hängenden“ Verweisen.

Was müssten Sie tun, damit nun die richtige Ortschaft in der Datenbank eingetragen sowie die falsch eingegebene Ortschaft gelöscht werden kann?
Setzen Sie Ihren Plan um.

INSERT INTO tbl_orte (PLZ, Ortsbezeichnung) VALUES ('3000', 'Bern');
UPDATE tbl_stationen
SET FS_ID_Ort = 6
WHERE FS_ID_Ort = 5;
DELETE FROM tbl_orte
WHERE ID_Ort = 5;

## Alias

Ein Alias in SQL wird verwendet, um einer Spalte in einer Tabelle oder einer Tabelle einen temporären Namen zu geben.

Aliase zu den Attributen werden verwendet, um Spaltennamen lesbarer zu machen. Ein Alias existiert nur für die Dauer dieser Abfrage.

Tabellenaliase müssen im gesamten Statement benutzt werden. 

## Aggregatfunktionen

In MySQL dienen Aggregatsfunktionen dazu, Werte in einer Spalte zusammenzufassen oder zu berechnen.

COUNT()
Zählt die Anzahl der Zeilen:
SELECT COUNT(*) FROM customers; – zählt alle Zeilen
SELECT COUNT(salary) FROM customers; – zählt nur Zeilen ohne NULL in salary

SUM()
Bildet die Summe aller Werte einer Spalte:
SELECT SUM(salary) FROM employees;

AVG()
Berechnet den Durchschnitt:
SELECT AVG(salary) FROM employees;

MIN()
Gibt den kleinsten Wert zurück:
SELECT MIN(salary) FROM employees;

MAX()
Gibt den größten Wert zurück:
SELECT MAX(salary) FROM employees;


## Group by

In MySQL wird das GROUP BY-Statement verwendet, um Datensätze anhand einer oder mehrerer Spalten zu gruppieren. Es wird meist zusammen mit Aggregatsfunktionen wie COUNT, SUM, AVG, MIN oder MAX eingesetzt, um gruppierte Daten zusammenzufassen.


## Having

In MySQL wird HAVING verwendet, um aggregierte Gruppenergebnisse nach einem GROUP BY-Statement zu filtern. Im Gegensatz zu WHERE, das vor der Gruppierung wirkt, filtert HAVING nach der Gruppierung, basierend auf Aggregatsfunktionen wie SUM, AVG, COUNT usw.


## Subquery
Eine Subquery ist eine SQL-Abfrage, die innerhalb einer anderen Abfrage steht, typischerweise in WHERE, FROM, HAVING oder SELECT. Auch in UPDATE, INSERT oder DELETE kann sie verwendet werden. Sie wird in Klammern geschrieben und zuerst ausgeführt.

## Arten von Subqueries

### Skalare Subquery
Gibt genau einen Wert (eine Zeile, eine Spalte) zurück.

Nur sinnvoll mit Vergleichsoperatoren wie =, <, >, <=, >=.

### Nicht-skalare Subquery
Gibt mehrere Zeilen oder Spalten zurück.

Wird z. B. mit IN, NOT IN, EXISTS, ANY, ALL kombiniert.



## Backup-Arten
Online-Backup: Datenbank bleibt aktiv, Änderungen werden zwischengespeichert.

Offline-Backup: Datenbank wird für die Sicherung heruntergefahren  

## Sicherungsverfahren
Voll-Backup: Sichert alle Daten komplett, hoher Speicherbedarf, aber einfach wiederherstellbar.

Differentielles Backup: Sichert nur Änderungen seit dem letzten Voll-Backup, platzsparender.

Inkrementelles Backup: Sichert nur Änderungen seit dem letzten Backup (inkrementell oder voll), sehr effizient, aber komplexere Wiederherstellung.

## Tools zur Backup-Erstellung
mysqldump: Shell-basiertes Voll-Backup für MySQL.

phpMyAdmin: GUI-Export, aber beschränkt bei großen Datenmengen.

BigDump: Ermöglicht Import großer Backups.

HeidiSQL: Windows-Tool ohne Automatisierung, robust bei großen Backups.

Mariabackup: Open-Source für physische Online-Backups in MariaDB.

## Weitere Empfehlungen
Backups auf externen, geschützten Medien speichern.

Daten verschlüsseln (z. B. bei Diebstahl).

Backup-User mit eingeschränkten Rechten anlegen

## Welche Nachteile hat logisches Backup?
Nachteile des logischen Backups (wie mit mysqldump):

Langsamkeit: Es ist langsamer als ein physisches Backup, da der Server die Daten lesen und in SQL-Befehle umwandeln muss.

Grösse: Das Backup-File ist meist grösser, weil es in Textform vorliegt.

Wiederherstellung: Das Einspielen des Backups dauert länger, da alle SQL-Befehle ausgeführt werden müssen.

Integrität: Da der Server während des Backups laufen muss, können Datenänderungen passieren, wenn keine Sperren gesetzt werden.

Kein Backup von Log- oder Konfigurationsdateien (nur Daten und Struktur).

## Was ist der Unterschied zwischen online- und offline-Backups?
Online-Backup (Hot Backup):

Backup wird gemacht, während der MySQL-Server läuft und Daten verarbeitet.

Clients können (meistens) weiterhin auf die Daten zugreifen.

Backup-Tools müssen sicherstellen, dass keine Daten während des Backups verändert werden, um Inkonsistenzen zu vermeiden (Locking).

Offline-Backup (Cold Backup):

Backup wird gemacht, während der MySQL-Server gestoppt ist.

Einfacher, da keine gleichzeitigen Zugriffe stattfinden.

Clients können in dieser Zeit nicht auf die Daten zugreifen (Downtime).

## Was ist ein «snapshot Backup»?
Ein Snapshot Backup ist eine Momentaufnahme des Dateisystems zu einem bestimmten Zeitpunkt.

Es ist eine logische Kopie des Dateisystems, die sehr schnell erstellt wird, da nur die geänderten Daten seit dem Snapshot separat gespeichert werden (Copy-on-Write).

Der MySQL-Server selbst bietet diese Funktion nicht, sie wird durch das Betriebssystem oder Drittanbieter-Tools bereitgestellt (z.B. LVM, ZFS, Veritas).

Vorteil: Sehr schnelle Backups mit minimaler Auswirkung auf die laufenden Systeme.

