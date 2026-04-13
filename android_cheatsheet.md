# Android Cheatsheet

</br>

## Dokumentation
* [Android Developers (Google)](https://developer.android.com/) (Einstiegsseite für Android-Entwicklung)
* [Get Started (Google)](https://developer.android.com/get-started/overview)
* [Android API Referenz](https://developer.android.com/reference)
* [Android Jetpack (Google)](https://developer.android.com/jetpack) (Bibliothek-Suite für gute Android-Entwicklung)
* [Android Jetpack Compose (Google)](https://developer.android.com/compose) (Toolkit für native UI-Entwicklung)


</br>

## Installation und Setup (Linux)
Der einfachste Weg ist die Installation von [Android Studio](https://developer.android.com/studio?hl=de) über das Ubuntu-Softwarecenter. Mit Android Studio wird auch direkt das Android SDK installiert.


</br>

## Sonstiges

### Quellcode aus einer APK-Datei extrahieren
```shell
# prüfe ob Java installiert ist, wenn nicht, installiere Java
java --version

# navigiere in den Ordner mit der APK-Datei
cd ~/pfad/zur/apk

# installiere das Tool apktool (Infos unter: apktool.org)
sudo apt install apktool

# decodiere die APK-Datei mit apktool
apktool decode apkFile.apk

# -> Ergebnis: Quelldateien (kein Source Code, aber Struktur erkennbar) und AndroidManifest.xml

# entpacke die APK-Datei wie eine ZIP-Datei
unzip apkFile.apk -d ./apkFile/

# -> Zwischenergebnis: classes.dex Dateien

# lade dex-tools herunter (ZIP-Datei) (die Version kann angepasst werden) und entpacke die ZIP-Datei
wget -q -P . https://github.com/pxb1988/dex2jar/releases/download/v2.4/dex-tools-v2.4.zip

# entpacke die ZIP-Datei
unzip ./dex-tools-v2.4.zip -d ./dex-tools-v2.4/

# erzeuge aus der classes.dex eine JAR-Datei
./dex-tools-v2.4/d2j-dex2jar.sh ./apkFile/classes.dex

# -> Zwischenergebnis: classes-dex2jar.jar

# lade den JD-GUI-Decompiler herunter (JAR-Datei) (die Version kann angepasst werden)
wget -q -P . https://github.com/java-decompiler/jd-gui/releases/download/v1.6.6/jd-gui-1.6.6.jar

# führe den JD-GUI-Decompiler aus und öffne die Datei classes-dex2jar.jar
java -jar jd-gui-1.6.6.jar

# -> Ergebnis: Source Code
``` 


</br>

## Weitere Quellen
Tutorials
* [Create your first Android app (Google)](https://developer.android.com/codelabs/basic-android-kotlin-compose-first-app#0)
