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

