# Datenbanken und SQL Cheatsheet

1. [Grundlagen](#grundlagen)
    - [ACID](#acid)
    - [Transaktionen](#transaktionen)
    - [CAP-Theorem](#cap-theorem)
    - [Index](#index)
2. [Arten von Datenbanken](#arten-von-datenbanken)
3. [Structured Query Language (SQL)](#structured-query-language-sql)


## Grundlagen

### ACID
*[ACID](https://de.wikipedia.org/wiki/ACID)* ist eine Abkürzung für die folgenden erwünschten Eigenschaften von Datenbankmanagementsytemen (DBMSs) und verteilten Systemen sowie Charakterisierung von [Transaktionen](#transaktionen):

* Atomarität (**a**tomicity)
    * 
* Konsistenzerhaltung (**c**onsistency)
    * 
* Abgrenzung (**i**solation)
    * 
* Dauerhaftigkeit (**d**urability)
    * 

In verteilten Datenbanken können nicht alle Eigenschaften erreicht werden, wenn gleichzeitig eine hohe Verfügbarkeit erreicht werden soll (siehe [CAP-Theorem](#cap-theorem)).

### Transaktionen
...

### CAP-Theorem
Das *[CAP-Theorem](https://de.wikipedia.org/wiki/CAP-Theorem)* besagt, dass ein [verteiltes System](https://de.wikipedia.org/wiki/Verteiltes_System) nur zwei der drei folgenden Eigenschaften erfüllen kann:

* Konsistenz (**c**onsistency)
    * 
* Verfügbarkeit (**a**vailability)
    * 
* Partitionstoleranz (**p**artition tolerance)
    * 

### Index
...


## Arten von Datenbanken

<details close>
<summary>Relationale Datenbanken</summary>

* Beschreibung:
    * 
    * [Relationale Algebra](https://www.youtube.com/playlist?list=PLb0zKSynM2PDwliJhH-GCECkk5F_rztTT)
    * CAP: i.d.R. Konsitenz (C) und Verfügbarkeit (A)
    * Normalformen:
        * 
* Anwendungsszenarien:
    * 
* Beispiele:
    * [PostgreSQL](https://www.postgresql.org/)
    * [MySQL](https://www.mysql.com/)
    * [SQLite](https://www.sqlite.org/index.html)
        * [SQLite Tutorial](https://www.sqlitetutorial.net/)
    * [Microsoft SQL Server](https://www.microsoft.com/de-de/sql-server/)
    * [Oracle AI Database](https://www.oracle.com/database/)
</details>

<details close>
<summary>Dokument-Datenbanken</summary>

* Beschreibung:
    * Eine *Dokument-Datenbank* gehört zu den NoSQL-Datenbanken und verwaltet JSON-ähnliche *Dokumente*. Dabei ist eine *Collection* eine Sammlung von Dokumenten (vergleichbar mit Tabelle in RDBMS). Die Dokumente selber können unterschiedlich strukturiert sein. Die Collections, Dokumente und sogar die Felder der Dokumente sind eineln abfragbar.
* Anwendungsszenarien:
    * 
* Beispiele:
    * [MongoDB](https://www.mongodb.com/) (CAP: Konsitenz (C) vor Verfügbarkeit (A))
    * [Apache CouchDB](https://couchdb.apache.org/) (CAP: Verfügbarkeit (A) vor Konsitenz (C))
</details>

<details close>
<summary>Key-Value-Datenbanken</summary>

* Beschreibung:
    * 
* Anwendungsszenarien:
    * 
* Beispiel(e):
    * [Redis]()
</details>

<details close>
<summary>Spalten-Datenbanken</summary>

* Beschreibung:
    * 
* Anwendungsszenarien:
    * 
* Beispiele:
    * [Apache Cassandra](https://cassandra.apache.org/) (CAP: Partitionstoleranz)
</details>

<details close>
<summary>Graph-Datenbanken</summary>

* Beschreibung:
    * 
* Anwendungsszenarien:
    * 
* Beispiele:
    * [Neo4j Graph DB](https://neo4j.com/product/neo4j-graph-database/)
</details>


## Structured Query Language (SQL)
Die *Structured Query Language (SQL)* ist die Abfragesprache für RDBMS.
Gegeben sei folgende Tabellenstruktur:
...
```sql
-- Projektion
SELECT id, firstname, lastname FROM persons;

SELECT * FROM persons;

-- Selektion
SELECT * FROM persons WHERE age >= 18;
```


## Weitere Quellen
...
