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
