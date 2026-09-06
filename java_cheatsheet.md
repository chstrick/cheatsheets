# Java Cheatsheet

1. [Java](#java)
2. [Maven](#maven)
3. [Gradle](#gradle)


## Java
[Java](https://de.wikipedia.org/wiki/Java_(Programmiersprache)) ist eine [objektorientierte Programmiersprache](https://de.wikipedia.org/wiki/Objektorientierte_Programmierung).


### Dokumentation
* [Java Standard Edition (Java SE)](https://docs.oracle.com/en/java/javase/)
* [Java Enterprise Edition (Java EE)](http://docs.oracle.com/javaee)


### API
Die Java-API enthält alle Build-in-Sprachelemente/Packages.

[Java 25 API](https://docs.oracle.com/en/java/javase/25/docs/api/) (durch Änderung der Versionszahl im Link lassen sich auch andere Versionen aufrufen)


### Installation (Linux)
```shell
sudo apt update # Paketquellen aktualisieren
sudo apt upgrade # Pakete aktualisieren

sudo apt install openjdk-25-jdk # OpenJDK 25 installieren
java --version # prüfen, ob Java korrekt installiert wurde
```


### Kommandozeile

#### Java-Datei(en) kompilieren
```shell
# Eine Datei kompilieren
javac Main.java

# Mehrere Dateien kompilieren
javac Main.java tests/Tests.java

# Alle benötigten Dateien kompilieren:
javac -sourcepath . path/to/Main.java
```

#### Java-Programm ausführen
```shell
java Main.class # Klasse muss main-Methode enthalten
```

#### JAR-Datei über die Konsole erstellen und ausführen
1) Im Ordner mit den Java-Dateien neue Datei *manifest.txt* mit folgendem Inhalt erstellen.
    ```
    Main-Class: DateiMitMainMethode.java


    ```

2) Mit ```cd``` in Ordner mit den Java-Dateien und der *manifest.txt* navigieren.

4) Mit ```javac``` die Java-Datei(en) compilieren.

5) Mit ```jar cfm JarDateiName.jar manifest.txt Datei1.class Datei2.class``` wird eine JAR-Datei erstellt, die die angegeben .class-Dateien enthält.

6) Oder mit ```jar cfm JarDateiName.jar manifest.txt *.class``` wird eine JAR-Datei erstellt, die alle im Ordner vorhandenen .class-Dateien einbindet.

7) Oder mit ```jar cvfm JarDateiName.jar manifest.txt *.class ordnerName``` wird eine JAR-Datei erstellt, die alle im Ordner vorhandenen .class-Dateien und den Ordner *ordnerName* (samt Inhalt, z.B. Bilder) einbindet.

8) JAR-Datei mit ```java -jar DateiName.jar``` ausführen.


### Grundlagen der Sprache Java
```java
////// Klassen, Konstruktoren, Methoden, Variablen
public class Mensch { // Klassenkopf gefolgt von Klassenkörper in geschw. Klammern
    private static int anzahl; // Klassenvariable: Wert gebunden an Klasse, d.h. für alle Instanzen gleich
    private String name; // Instanzvariable: Wert gebunden an Instanz (Exemplar dieser Klasse)
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

////// Zugriffsmodifikatoren
// public : von überall Zugriff
// kein Modifikator : nur im selben Paket Zugriff
// private : nur in der selben Klasse/Methode Zugriff

////// Objektorientierte Programmierung (OOP)
// TODO

////// Java-Programme (mind. eine Klasse mit main-Methode)
public class MainClass {
    public static void main(String[] args) {
        System.out.println("Hello World!");
    }
}

////// Kommentare
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
        /* Blockkommentar */
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
