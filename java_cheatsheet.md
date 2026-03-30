# Java Cheatsheet

## Dokumentation
* [Java Standard Edition (Java SE)](https://docs.oracle.com/en/java/javase/)
* [Java Enterprise Edition (Java EE)](http://docs.oracle.com/javaee)


### API
Die Java-API enthält alle Build-in-Sprachelemente/Packages.

[Java 25 API](https://docs.oracle.com/en/java/javase/25/docs/api/) (durch Änderung der Versionszahl im Link lassen sich auch andere Versionen aufrufen)


## Installation (Linux)
```shell
sudo apt update # Paketquellen aktualisieren
sudo apt upgrade # Pakete aktualisieren

sudo apt install openjdk-25-jdk # OpenJDK 25 installieren
java --version # Prüfen, ob Java korrekt installiert wurde
```


## Kommandozeile

### Java Version abfragen
```shell
java --version
```

### Java-Datei(en) compilieren
```shell
javac Main.java
```
Mehrere Dateien kompilieren, durch Auflistung:
```shell
javac Main.java tests/Tests.java
```
Alle benötigten Java-Datein kompilieren:
```shell
javac -sourcepath . path/to/Main.java
```

### Java-Programm ausführen
```shell
java Main.class # Klasse muss main-Methode enthalten
```


## JAR-Dateien

### JAR-Datei über die Konsole erstellen
1) Im Ordner mit den Java-Dateien neue Datei *manifest.txt* mit folgendem Inhalt erstellen.
    ```
    Main-Class: DateiMitMainMethode.java


    ```

2) Mit ```cd``` in Ordner mit den Java-Dateien und der *manifest.txt* navigieren.

4) Mit ```javac``` die Java-Datei(en) compilieren.

5) Mit ```jar cfm JarDateiName.jar manifest.txt Datei1.class Datei2.class``` wird eine JAR-Datei erstellt, die die angegeben .class-Dateien enthält.

    oder

5) Mit ```jar cfm JarDateiName.jar manifest.txt *.class``` wird eine JAR-Datei erstellt, die alle im Ordner vorhandenen .class-Datein einbindet.

    oder

5) Mit ```jar cvfm JarDateiName.jar manifest.txt *.class ordnerName``` wird eine JAR-Datei erstellt, die alle im Ordner vorhandenen .class-Datein und den Ordner *ordnerName* (samt Inhalt, z.B. Bilder) einbindet.

### JAR-Datei über die Konsole ausführen
```shell
java -jar DateiName.jar
```


## Weitere Quellen
* [wiki.ubuntuusers.de/Java](https://wiki.ubuntuusers.de/Java/)
* [wiki.ubuntuusers.de/OpenJDK](https://wiki.ubuntuusers.de/OpenJDK/)

Versionen
* [OpenJDK](https://openjdk.org/)
* [Amazon Corretto](https://aws.amazon.com/de/corretto/)



# Maven

## Dokumentation und Central Repository
* [Maven Documentation](https://maven.apache.org/guides/index.html)
* [Maven Getting Started Guide](https://maven.apache.org/guides/getting-started/index.html)
* [POM Reference](https://maven.apache.org/pom.html)
* [MvnRepository](https://mvnrepository.com/)
* [Maven Central Repository](https://central.sonatype.com/search)


## Installation (Linux)
```shell
sudo apt install maven
```


## Kommandozeile
...


## Weitere Quellen
* [Maven by Example](https://www.sonatype.com/resources/guides/maven-by-example) (Sehr gutes Tutorial)
* [Maven Cheatsheet von Eberhard Wolff](https://github.com/ewolff/cheatsheets-DE/blob/master/MavenCheatSheet.md)



# Gradle
...
