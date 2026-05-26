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

### Learnings
- Nur StateFlows in ViewModels nutzen (private val _state = MutableStateFlow(MyState())), Compose-States (mutableStateOf) nur in UI für einfache States nutzen [-> Video](https://www.youtube.com/watch?v=T8vApYJlW8o)
- Kein ViewModel in Screens übergeben (MyScreen(viewModel: MyViewModel) {...}), sondern nur State (MyScreen(state: MyState) {...}) [-> Video](https://www.youtube.com/watch?v=4D79It7Jnzg)
- Komponenten i.d.R. stateless halten, d.h. Status(-parameter) von außen eingeben und nicht innerhalb der Komponente erstellen (MyScreen() { var state = ... }) [-> Video](https://www.youtube.com/watch?v=C8IfGDrmwiE)
- State-Klassen @Immutable machen und bei Update mit it.copy(...) neue Instanz anlegen (sorgt für Optimierung von Recomposition (Neuerzeugung von Komponenten wenn State sich verändert hat)) [-> Video](https://www.youtube.com/watch?v=_FtKhWvHiTg)
- Keine Strings als Routen nutzen, sondern Route-Objekte (data object ListRoute) oder -Klassen, wenn Argumente in Route übergeben (data class DetailRoute(val id: String))
- Initiale Daten für State laden: Siehe Video [-> Video](https://www.youtube.com/watch?v=mNKQ9dc1knI)
- Einzelne Statusfelder (isLoading, Profile, ...) oder Statusklassen (ProfileState(val isLoading: Boolean = false, val profile: Profile = Profile())): i.d.R. Statusklassen verwenden [-> Video](https://www.youtube.com/watch?v=ZTebNp-FyYY)
- UI-Architekturen: MVVM, MVI, ...
    - [-> Video: Vergleich alle](https://www.youtube.com/watch?v=Zwmcr6duzhY&t=242s)
    - [-> Video: Vergleich MVVM vs. MVI](https://www.youtube.com/watch?v=b2z1jvD4VMQ&t=479s)
    - [-> Video: State vs. Actions vs. Events](https://www.youtube.com/watch?v=kzfVub-AJPs)
- Globaler NavManager und SnackbarManager:
    - [-> Video: NavManager](https://www.youtube.com/watch?v=BFhVvAzC52w)
    - [-> Video: SnackbarManager](https://www.youtube.com/watch?v=KFazs62lIkE)
    - [-> Artikel: Best Practices](https://www.siberoloji.com/navigation-with-viewmodels-and-state-preservation-in-jetpack-compose/#best-practices-for-navigation-and-state-management)
- suspend-Funktionen (suspend fun myFun(...): T {...}) oder Flow-Funktionen (fun myFun(...): Flow<T> {...}): Siehe Video [-> Video](https://www.youtube.com/watch?v=9NdhsnZPM1k)
- Individueller SplashScreen: Siehe Video [-> Video](https://www.youtube.com/watch?v=eFZmMSm1G1c)

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
unzip ./dex-tools-v2.4.zip -d .

# erzeuge aus der classes.dex eine JAR-Datei (für jede .dex-Datei durchführen)
./dex-tools-v2.4/d2j-dex2jar.sh ./apkFile/classes.dex

# -> Zwischenergebnis: classes-dex2jar.jar

# lade den JD-GUI-Decompiler herunter (JAR-Datei) (die Version kann angepasst werden)
wget -q -P . https://github.com/java-decompiler/jd-gui/releases/download/v1.6.6/jd-gui-1.6.6.jar

# führe den JD-GUI-Decompiler aus und öffne eine classes-dex2jar.jar-Datei
java -jar jd-gui-1.6.6.jar

# -> Ergebnis: Source Code aus dieser classes-dex2jar.jar-Datei
``` 


</br>

## Weitere Quellen
Tutorials
* [Create your first Android app (Google)](https://developer.android.com/codelabs/basic-android-kotlin-compose-first-app#0)
* [Phillipp Lackner YouTube-Video-Tutorials](https://www.youtube.com/@PhilippLackner/videos)
