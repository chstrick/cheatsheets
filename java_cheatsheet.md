# Java Cheatsheet


## Java SE
Offizielle Dokumentation der Java Standard Edition (Java SE) findet sich [hier](https://docs.oracle.com/en/java/javase/).
### API
Auf den versionsspezifischen Unterseiten findet sich dann u.a. auch die API, z.B. [Java 25 API](https://docs.oracle.com/en/java/javase/25/docs/api/).


## Java EE
Offizielle Dokumentation der Java Enterprise Edition (Java EE) findet sich [hier](http://docs.oracle.com/javaee).


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
java Main.java # Klasse muss main-Methode enthalten
```


## JAR-Dateien

### JAR-Datei über die Konsole erstellen

1) Im Ordner mit den Java-Dateien neue Datei *manifest.txt* mit folgendem Inhalt erstellen.
    ```
    Main-Class: DateiMitMainMethode.java


    ```

2) Mit ```cd``` in Ordner mit den Java-Dateien und der *manifest.txt* navigieren.

4) Mit ```javac``` die .class-Datei(en) compilieren.

5) Mit ```jar cfm JarDateiName.jar manifest.txt Datei1.class Datei2.class``` wird eine .jar-Datei erstellt, die die angegeben .class-Dateien enthält.

    oder

5) Mit ```jar cfm JarDateiName.jar manifest.txt *.class``` wird eine .jar-Datei erstellt, die alle im Ordner vorhandenen .class-Datein einbindet.

    oder

5) Mit ```jar cvfm JarDateiName.jar manifest.txt *.class ordnerName``` wird eine .jar-Datei erstellt, die alle im Ordner vorhandenen .class-Datein und den Ordner *ordnerName* (samt Inhalt, z.B. Bilder) einbindet.

### JAR-Datei über die Konsole ausführen
```shell
java -jar DateiName.jar
```

## Weitere Quellen
* [OpenJDK](https://openjdk.org/)
* [Amazon Corretto](https://aws.amazon.com/de/corretto/)
