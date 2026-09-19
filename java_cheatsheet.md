# Java Cheatsheet

1. [Java](#java)
    - [Dokumentation](#dokumentation)
    - [Installation (Linux)](#installation-linux)
    - [Kommandozeile](#kommandozeile)
        - [JAR-Dateien erstellen](#jar-dateien-erstellen)
    - [Grundlagen der Sprache Java](#grundlagen-der-sprache-java)
        - [Ein Java-Programm](#ein-java-programm)
        - [Primitive Datentypen und Operatoren](#primitive-datentypen-und-operatoren)
        - [Kontrollflussstrukturen](#kontrollflussstrukturen)
        - [Zugriffsmodifikatoren](#zugriffsmodifikatoren)
        - [Klassen, Konstruktoren, Methoden, Variablen](#klassen-konstruktoren-methoden-variablen)
        - [Records](#records)
        - [Enums](#enums)
        - [Arrays, Listen und andere Datenstrukturen](#arrays-listen-und-andere-datenstrukturen)
        - [Objektorientierte Programmierung (OOP)](#objektorientierte-programmierung-oop)
        - [Exception Handling](#exception-handling)
        - [Lambdas und Funktionale Interfaces](#lambdas-und-funktionale-interfaces)
        - [Streams, Collectors und Optional](#streams-collectors-und-optional)
        - [Generics](#generics)
        - [Regular Expressions](#regular-expressions)
        - [Kommentare](#kommentare)
    - [Weitere Quellen](#weitere-quellen)
2. [Maven](#maven)
    - [Dokumentation und Central Repository](#dokumentation-und-central-repository)
    - [Installation (Linux)](#installation-linux-1)
    - [Kommandozeile](#kommandozeile-1)
    - [Maven-Wrapper](#maven-wrapper)
    - [Weitere Quellen](#weitere-quellen-1)
3. [Gradle](#gradle)
    - [Dokumentation](#dokumentation-1)
    - [Installation](#installation)
    - [Gradle-Wrapper](#gradle-wrapper)


## Java
[Java](https://de.wikipedia.org/wiki/Java_(Programmiersprache)) ist eine [objektorientierte Programmiersprache](https://de.wikipedia.org/wiki/Objektorientierte_Programmierung).


### Dokumentation
* [Java Standard Edition (Java SE)](https://docs.oracle.com/en/java/javase/)
* [Java Enterprise Edition (Java EE)](http://docs.oracle.com/javaee)
* [Java 25 API](https://docs.oracle.com/en/java/javase/25/docs/api/) (Versionszahl im Link ändern für andere Versionen)
* [Java Cheatsheet Uni Princeton](https://introcs.cs.princeton.edu/java/11cheatsheet/)


### Installation (Linux)
```shell
sudo apt update                  # Paketquellen aktualisieren
sudo apt upgrade                 # Pakete aktualisieren
sudo apt install openjdk-25-jdk  # OpenJDK 25 installieren
java --version                   # prüfen, ob Java korrekt installiert wurde
```


### Kommandozeile
```shell
# Java-Quellcode kompilieren
javac Main.java                        # Eine Java-Datei kompilieren
javac Main.java tests/Tests.java       # Mehrere Java-Dateien kompilieren
javac -sourcepath . path/to/Main.java  # Alle benötigten Java-Dateien kompilieren:

# Java-Programm ausführen
java Main       # Klasse muss main-Methode enthalten
java Main.java  # Seit Java 11+ in einem Schritt kompilieren und ausführen
```

#### JAR-Dateien erstellen
1) Mit `cd` in den Ordner mit den Java-Dateien navigieren.
2) Im Ordner dann die neue Datei *manifest.inf* mit folgendem Inhalt erstellen.
    ```txt
    Manifest-Version: 1.0
    Class-Path: .
    Sealed: true
    Main-Class: DateinameMitMainMethode

    ```
3) Mit `javac` die Java-Datei(en) compilieren.
4) JAR-Datei erstellen:
    - Mit `jar cfm JarDateiName.jar manifest.inf Datei1.class Datei2.class` wird eine JAR-Datei erstellt, die die angegeben .class-Dateien enthält.
    - Oder mit `jar cfm JarDateiName.jar manifest.inf *.class` wird eine JAR-Datei erstellt, die alle im Ordner vorhandenen .class-Dateien einbindet.
    - Oder mit `jar cvfm JarDateiName.jar manifest.inf *.class ordnerName` wird eine JAR-Datei erstellt, die alle im Ordner vorhandenen .class-Dateien und den Ordner *ordnerName* samt Inhalt einbindet, z.B. Bilder.
5) JAR-Datei ausführen: `java -jar DateiName.jar`.


### Grundlagen der Sprache Java

#### Ein Java-Programm
```java
// Datei: Main.java

public class Main {
    // In einem Java-Programm muss es mind. ein Klasse mit einer main-Methode geben.
    // Diese dient als Einstiegspunkt für das Programm
    public static void main(String[] args) {
        System.out.println("Hello World!");
    }
}
```

#### Primitive Datentypen und Operatoren
```java
// TODO
```

#### Kontrollflussstrukturen
```java
// TODO
// if und else

// while-Schleife

// for-Schleife

// for-each-Schleife

// do-while-Schleife

// switch

```

#### Zugriffsmodifikatoren
```java
// public : von überall Zugriff
// kein Modifikator : nur im selben Paket Zugriff
// private : nur in der selben Klasse/Methode Zugriff
```

#### Klassen, Konstruktoren, Methoden, Variablen
```java
public class Mensch { // Klassenkopf gefolgt von Klassenkörper in geschw. Klammern
    private static int anzahl; // Klassenvariable: Wert gebunden an Klasse, d.h. für alle Instanzen gleich
    private String name; // Instanzvariable: Wert gebunden an Instanz, d.h. pro Exemplar dieser Klasse
    private int gebJahr;

    // Konstruktor: Methode, die bei Erzeugung einer Instanz aufgerufen wird:
    // Mensch m = new Mensch("Toffee", 1995)
    public Mensch(String name, int gebJahr) {
        this.name = name;
        this.gebJahr = gebJahr;
        anzahl++;
        // da Instanzvariable und Parameter gleiche Bezeichner, Obj.var. mit this: this.name
    }

    // Klassenmethode: Wird im Klassenkontext aufgerufen über Klasse oder Instanz:
    // Mensch.menschenAufErde();
    // instanz.menschenAufErde();
    public static int menschenAufErde() { // Methodenkopf gefolgt von Klassenkörper in geschw. Klammern
        // hier nur Zugriff auf Klassenvariablen
        return anzahl; // return: Schlüsselwort für Rückgabe
    }

    // Instanzmethode: Wird im Instanzkontext aufgerufen über Instanz:
    // instanz.alter(2026)
    public int alter(int jahr) {
        // hier Zugriff auf alle Variablen, auch Klassenvariablen
        int alter = jahr - gebJahr; // Lokale Variable: Nur in dieser Methode verfügbar
        return alter;
    }
}
```

#### Records
```java
// Records (Java 16+) sind unveränderliche Datenklassen
// Konstruktor, Getter, equals, hashCode und toString werden automatisch generiert
record Point(int x, int y) {
    // Optional kompakter Konstructor für Validierung
    Point {
        if (x < 0 || y < 0) throw new IllegalArgumentException("negative");
    }
    // Extra Methoden sind erlaubt
    double distance() { return Math.sqrt(x * x + y * y); }
}

// Anwendungsbeispiel
var pt = new Point(3, 4);
pt.x();          // 3
pt.distance();   // 5.0
System.out.println(pt); // Point[x=3, y=4]
```

#### Enums
```java
// TODO
```

#### Arrays, Listen und andere Datenstrukturen
```java
// TODO
```

#### Objektorientierte Programmierung (OOP)
```java
// TODO
```

#### Exceptions
```java
// TODO
```

#### Lambdas und Funktionale Interfaces
```java
// TODO
```

#### Streams, Collectors und Optional
```java
// TODO
```

#### Generics
```java
// TODO
```

#### Kommentare
```java
/**
 * Klasse mit mathematischen Operationen. (JavaDoc-Kommentar)
 * @author Christoph
 * @version 1.0
 */
public class Mathe {
    /**
     * plus addiert zwei Zahlen. (JavaDoc-Kommentar)
     * @param a erster Summand als {@link Integer} (Ganzzahl)
     * @param b zweiter Summand als {@link Integer} (Ganzzahl)
     * @return Summe von a und b
     */
    public static int plus(int a, int b) {
        /*
        Blockkommentar
        über mehrere
        Zeilen
        */
        return a + b; // Zeilenkommentar
    }
}
```


### Weitere Quellen
* [wiki.ubuntuusers.de/Java](https://wiki.ubuntuusers.de/Java/)
* [wiki.ubuntuusers.de/OpenJDK](https://wiki.ubuntuusers.de/OpenJDK/)

Tutorials
* [Youtube-Kanal mit guten Tutorials zu Java](https://www.youtube.com/c/CodingwithJohn)
* [Geprüfte und Ungeprüfte Exceptions in Java](https://www.youtube.com/watch?v=bCPClyGsVhc)
* [Elegant Objects (Paradigmen für besseren Java-Code)](https://www.elegantobjects.org/)


</br>

## Maven
*[Maven](https://maven.apache.org/)* ist ein Open-Source Build-Tool von Apache für Java-basierte Projekte. Es unterstüzt den Build-Prozess, die Dokumentation von Abhängigkeiten und Distribution von Informationen und JARs.


### Dokumentation und Central Repository
* [Maven Getting Started Guide](https://maven.apache.org/guides/getting-started/index.html)
* [Build Lifecycles](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html)
* [Dependencies](https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html)
* [POM Reference](https://maven.apache.org/pom.html)
* Repository
    - [MvnRepository](https://mvnrepository.com/)
    - [Maven Central Repository](https://central.sonatype.com/search)


### Installation (Linux)
```shell
java --version # JDK >= 8 wird benötigt
sudo apt install maven
mvn --version # prüfen, ob Maven korrekt installiert wurde
```
ℹ️ Meist ist Maven in IDEs wie IntelliJ bereits enthalten.


### Kommandozeile
```shell
# Hilfe anzeigen
mvn -help

# neues Projekt mit bestimmten Archtype generieren (siehe Weitere Quellen)
mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

# Ordner /target löschen
mvn clean

# Kompilieren der Java-Klassen
mvn compiler:compile # nur normale Klassen
mvn compiler:testCompile # nur Testklassen
mvn compile # alle Klassen kompilieren und Build-Lifecycle bis Phase compile ausführen

# Tests ausführen
mvn test

# Projekt bauen und in JAR/WAR packen
mvn package
mvn -DskipTests package # Tests nicht ausführen

# Projekt bauen, packen und verifizieren
mvn verify

# Projekt bauen, packen und im lokalen Repo installieren (~/.m2/repository/)
mvn install

# Projekt bauen, packen und in Remote-Repo deployen
# (spezifiziert in distributionManagement in pom.xml)
# (in ~/.m2/settings.xml sind die Server-Credentials hinterlegt)
mvn deploy

# Abhängigkeitsbaum generieren und anzeigen
mvn dependency:tree

# Abhängigkeiten analysieren
# (deklarierte, aber ungenutzte, bzw. gebrauchte, aber nicht deklarierte Abhängigkeiten finden)
mvn dependency:analyze
```


### Maven-Wrapper
Der *[Maven-Wrapper](https://maven.apache.org/tools/mavenwrapper.html)* ist ein Tool, das eine konsitente Verwendung von der immer gleichen JDK- und Maven-Version sicherzustellen. Es ist die empfohlene Art Projekte zu bauen. Der Maven-Wrapper, bzw. seine Konfigurationsdateien werden auch ins Repository eingecheckt.


### Weitere Quellen
* [Maven by Example](https://www.sonatype.com/resources/guides/maven-by-example) (Sehr gutes Tutorial)
* [Standard Projektstruktur](https://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html)
* [Maven Archetypes](https://maven.apache.org/guides/introduction/introduction-to-archetypes.html)
* [Settings Reference](https://maven.apache.org/ref/3.9.16/maven-settings/settings.html)


</br>

## Gradle
*[Gradle](https://gradle.org/)* ist ebenfalls ein Open-Source Build-Tool ähnlich zu Maven. Anwendung findet es u.a. in Android-App-Projekten.


### Dokumentation
* [Gradle User Manual](https://docs.gradle.org/current/userguide/userguide.html)


### Installation
Folge zur Installation der [Anleitung von Gradle](https://docs.gradle.org/current/userguide/installation.html#installation).

ℹ️ Meist ist Gradle in IDEs wie IntelliJ bereits enthalten.


### Gradle-Wrapper
Der *[Gradle-Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html)* ist ein Skript, welches eine definierte Version von Gradle ausführt. Also muss kein Gradle installiert werden. Es ist die empfohlene Art Projekte zu bauen. Der Gradle-Wrapper, bzw. seine Konfigurationsdateien werden auch ins Repository eingecheckt.
