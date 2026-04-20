# Java Cheatsheet

</br>

## Dokumentation
* [Java Standard Edition (Java SE)](https://docs.oracle.com/en/java/javase/)
* [Java Enterprise Edition (Java EE)](http://docs.oracle.com/javaee)


### API
Die Java-API enthält alle Build-in-Sprachelemente/Packages.

[Java 25 API](https://docs.oracle.com/en/java/javase/25/docs/api/) (durch Änderung der Versionszahl im Link lassen sich auch andere Versionen aufrufen)


</br>

## Installation (Linux)
```shell
sudo apt update # Paketquellen aktualisieren
sudo apt upgrade # Pakete aktualisieren

sudo apt install openjdk-25-jdk # OpenJDK 25 installieren
java --version # prüfen, ob Java korrekt installiert wurde
```


</br>

## Kommandozeile

### Java-Datei(en) compilieren
```shell
# Eine Datei kompilieren
javac Main.java

# Mehrere Dateien kompilieren
javac Main.java tests/Tests.java

# Alle benötigten Datein kompilieren:
javac -sourcepath . path/to/Main.java
```

### Java-Programm ausführen
```shell
java Main.class # Klasse muss main-Methode enthalten
```


</br>

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


</br>

## Weitere Quellen
* [wiki.ubuntuusers.de/Java](https://wiki.ubuntuusers.de/Java/)
* [wiki.ubuntuusers.de/OpenJDK](https://wiki.ubuntuusers.de/OpenJDK/)

Tutorials
* [Youtube-Kanal mit guten Tutorials zu Java](https://www.youtube.com/c/CodingwithJohn)
* [Geprüfte und Ungeprüfte Exceptions in Java](https://www.youtube.com/watch?v=bCPClyGsVhc)
* [Elegant Objects (Paradigmen für besseren Java-Code)](https://www.elegantobjects.org/)


</br>
</br>

# Maven
*[Maven](https://maven.apache.org/)* ist ein Open-Source Build-Tool von Apache für Java-basierte Projekte. Es unterstüzt den Build-Prozess, die Dokumentation von Abhängigkeiten und Distribution von Informationen und JARs.

</br>

## Dokumentation und Central Repository
* [Maven Documentation](https://maven.apache.org/guides/index.html)
* [Maven Getting Started Guide](https://maven.apache.org/guides/getting-started/index.html)
* [Build Lifecycle](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html)
* [POM Reference](https://maven.apache.org/pom.html)
* [MvnRepository](https://mvnrepository.com/)
* [Maven Central Repository](https://central.sonatype.com/search)


</br>

## Installation (Linux)
```shell
java --version # JDK >= 8 wird benötigt
sudo apt install maven
mvn --version # prüfen, ob Maven korrekt installiert wurde
```
ℹ️ Meist ist Maven in IDEs wie IntelliJ bereits enthalten.


</br>

## Kommandozeile
```shell
# TODO
```


</br>

## Maven-Wrapper
Der *[Maven-Wrapper](https://maven.apache.org/tools/mavenwrapper.html)* ist ...


</br>

## Weitere Quellen
* [Maven by Example](https://www.sonatype.com/resources/guides/maven-by-example) (Sehr gutes Tutorial)
* [Maven Cheatsheet von Eberhard Wolff](https://github.com/ewolff/cheatsheets-DE/blob/master/MavenCheatSheet.md)


</br>
</br>

# Gradle
*[Gradle](https://gradle.org/)* ist ein Open-Source Build-Tool. 

</br>

## Dokumentation
* [Gradle User Manual](https://docs.gradle.org/current/userguide/userguide.html)


</br>

## Installation
Folge zur Installation der [Anleitung von Gradle](https://docs.gradle.org/current/userguide/installation.html#installation).

ℹ️ Meist ist Gradle in IDEs wie IntelliJ bereits enthalten.


</br>

## Gradle-Wrapper
Der *[Gradle-Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html)* ist ein Skript, welches eine definierte Version von Gradle ausführt. Es ist die *empfohlene Art den Build zu starten*.
