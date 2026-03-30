# Software Engineering Cheatsheet

## Softwareentwicklung
*Softwareentwicklung* ist der Prozess der Konzeption, Implementierung, und heutzutage meist auch des Betriebs (DevOps, SaaS), von Software auf Ingenieur-mäßige Art und Weise (daher *Software Engineering*).

### Agile Softwareentwicklung
Ziel der *Agilen Softwareentwicklung* ist die Fähigkeit besser auf sich ändernde Begebenheiten reagieren zu können.
* [Agiles Manifest](https://agilemanifesto.org/) (Grundlegendes agiles Manifest)
* [Extrem Programming (XP)](http://www.extremeprogramming.org/) (Ein Ansatz agiler Entwicklung)
* [Agile Software Guide (Martin Fowler)](https://martinfowler.com/agile.html) (Verschiedene Artikel zum Thema)
* [The Art of Agile Development (James Shore)](https://www.jamesshore.com/v2/books/aoad1) (Auszüge aus dem Buch)

### Test-driven Development
Beim *[Test-driven Development (TDD)](https://martinfowler.com/bliki/TestDrivenDevelopment.html)* geht es darum, die Entwicklung von Software von Seiten der Tests voranzutreiben. Dies bedeutet, dass iterativ zuerst ein Test geschrieben wird, gefolgt von Code, der (nur) diesen Test erfüllt usw. ("abwechselnd von Rot nach Grün", Test schlägt fehl (Rot) nach Test erfüllt (Grün)).
* [Software Testing Guide (Martin Fowler)](https://martinfowler.com/testing/) (Verschiedene Artikel zum Thema)

### Refactoring
Der Begriff *Refactoring* beschreibt die Änderung (vor allem die Vereinfachung) von Code, ohne seine Funktionsweise zu ändern. Software wird so einfacher verständlich und wartbar. Um die gleiche Funktionsweise zu gewährleisten, sollte [TDD](#test-driven-development) angewendet werden.
* [refactoring.com (Martin Fowler)](https://refactoring.com/) (Verschiedene Artikel zum Thema)
* [Katalog Refactoring Patterns](https://refactoring.com/catalog/)

### Software Delivery
* [Software Delivery Guide (Martin Fowler)](https://martinfowler.com/delivery.html)


## Softwarearchitektur
Mit *Softwarearchitektur* wird die Struktur und Organisation eines Softwaresystems beschrieben. 
* [Schichtenarchitektur](https://www.predic8.de/schichtenarchitektur.htm)
* [Dependency Inversion]() (wichtig für folgende Architekturen, siehe auch [Design Principles](#design-principles))
* Hexagonal-Architektur
    * [Beschreibung](https://www.predic8.de/hexagonale-architektur.htm)
* Onion-Architektur
    * [Beschreibung](https://www.predic8.de/onion-architecture.htm)
* Clean-Architektur
    * [Beschreibung](https://www.predic8.de/clean-architecture.htm)
    * [Artikel von Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
    * [Video von Uncle Bob](https://www.youtube.com/watch?v=o_TH-Y78tt4)
* Vertical Slice Architektur
    * [Beschreibung](https://www.predic8.de/vertical-slice-architecture.htm)
    * [Beispiel mit Spring Boot](https://www.predic8.de/vertical-slice-architecture-java-spring-boot.htm)
* Microservices
    * [Beschreibung](https://martinfowler.com/microservices/) und viele weitere Themen, z. B. Testing
    * [Beispiel mit Spring Boot](https://www.predic8.de/microservices-spring-boot-spring-cloud.htm)
* Modulith
    * [Beispiel mit Spring Modulith](https://www.predic8.de/spring-modulith.htm)
* Serverless Architecture
    * [Beschreibung](https://martinfowler.com/articles/serverless.html) und viele weitere Themen, z. B. Testing
* Weitere Architekturthemen
    * [Software Architecture Guide (Martin Fowler)](https://martinfowler.com/architecture/)
    * [Wikipedia-Liste mit Softwarearchitekturmustern](https://en.wikipedia.org/wiki/List_of_software_architecture_styles_and_patterns)

### Design Principles
* SOLID principles
    * **S**ingle Responsibility Principle
    * **O**pen/Closed Principle
    * **L**iskov Substitution Principle
    * **I**nterface Segregation Principle
    * **D**ependency Inversion Principle
* KISS (Keep It Simple, Stupid)
* DRY (Don't Repeat Yourself)
* YAGNI (You Ain't Gonna Need It)
* Composition over Inheritance
* Weitere Prinzipien
    * [Design Principles Katalog](https://java-design-patterns.com/principles/)

### Design Patterns
* [GoF Pattern Catalog](https://people.csail.mit.edu/addy/pattern/patcafso.htm)
* [GoF Perttern Map](https://people.csail.mit.edu/addy/pattern/patmap.htm)
* [Design Patterns Katalog in Java](https://java-design-patterns.com/patterns/)

### 12-Faktor-App
Heutzutage werden Softwaresysteme oft als *Software-as-a-Service (SaaS)* konzipiert, d.h.  Die sogenannte *[12-Faktor-App](https://12factor.net/)* ist eine Art (abstrakter) Leitfaden zur Konzeption, Entwicklung und Betrieb von modernen SaaS-Anwendungen.


## Softwaredokumentation
Damit ein implementiertes System gut verstanden, gewartet und weiterentwickelt werden kann, muss es auf eine sinnvolle Art und Weise dokumentiert werden. Folgende Seiten und Artikel bieten gute Grundlagen und Tipps für gute Softwaredokumentation:
* [Sparsame Dokumentation](https://www.innoq.com/de/articles/2022/09/sparsame-dokumentation/) (Artikel)
* [Tipps für gute Architekturdiagramme](https://www.innoq.com/de/articles/2022/09/better-architecture-diagrams/) (Artikel)
* [arc42](https://www.arc42.de/) (Architektur-Template)
* [Kurze Einführung in arc42](https://www.innoq.com/en/blog/brief-introduction-to-arc42/) (Artikel)
* [UML](https://www.uml-diagrams.org/) (Standard)
* [PlantUML](https://plantuml.com/de/) (Tool/Sprache zur programmatischen Erstellung von UML-Diagrammen)
* [draw.io](https://app.diagrams.net/) (Online-Editor zur Erstellung von Diagrammen)


## Weitere Quellen
* [List of software development philosophies (Wikipedia)](https://en.wikipedia.org/wiki/List_of_software_development_philosophies)
* [Software Design and Architecture Roadmap](https://roadmap.sh/software-design-architecture)
* [Software Architect Roadmap](https://roadmap.sh/software-architect)
