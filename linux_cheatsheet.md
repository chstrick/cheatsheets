# Linux Cheatsheet

1. [Installation](#installation)
2. [Kommandozeile](#kommandozeile)
3. [Pakete](#pakete)
4. [Umgebungsvariablen](#umgebungsvariablen)
5. [PDF](#pdf)
6. [Zip](#zip)
7. [Weitere nützliche Kommandozeilenbefehle](#weitere-nützliche-kommandozeilenbefehle)
8. [Services](#services)
9. [Links](#links)
10. [Festplatte überschreiben](#festplatte-überschreiben)
11. [Weitere Quellen](#weitere-quellen)


## Installation

### Boot-fähigen USB-Stick erstellen
In der Anwendungssuche (Windows-Taste drücken) nach *usb* suchen und das Programm *Startmedienersteller (USB Image Writer)* starten. Ggf. muss das Programm *Startmedienersteller (USB Image Writer)* noch installiert werden:
```shell
sudo apt-get install usb-creator-gtk
```

### Linux neben Windows installieren (Dual-Boot)
Linux lässt sich auch neben Windows installieren. Eine Anleitung findet sich [hier](https://linux-de.com/?p=2921).

### Ubuntu upgraden (neue Ubuntu-Version)
Um Ubuntu auf die nächste Version upzudaten ("Upgrade"), folge den [hier](https://wiki.ubuntuusers.de/Upgrade/) oder [hier](https://documentation.ubuntu.com/desktop/en/latest/how-to/upgrade-ubuntu-desktop/) beschriebenen Anweisungen.


## Kommandozeile
Unter Linux lassen sich alle Aufgaben zur Verwaltung des Systems über die Komandozeile (**Shell**) erledigen. Dazu gibt es zahlreiche Befehle. Eine Übersicht findet sich [hier](https://wiki.ubuntuusers.de/Shell/Befehls%C3%BCbersicht/) und ein gutes Cheatsheet findet sich [hier](https://linuxize.com/cheatsheet/linux-commands/).

Die **Bash** (Bourne Again Shell) ist eine Implementierung der Shell und in vielen Linux-Distributionen die Standard-Shell. Ein gutes Cheatsheet findet sich [hier](https://linuxize.com/cheatsheet/bash/).


## Pakete
Pakete (entspricht in etwa "Programme" unter Windows) lassen sich unter Ubuntu auf verschiedene Arten installieren und verwalten.

### Ubuntu-Softwarecenter
Ubuntu bietet standardmäßig die Anwendung *Softwarecenter* mit einer GUI an. In der Anwendungssuche (Windows-Taste drücken) nach *softwarecneter* suchen und die Anwendung *Softwarecenter* starten. In der Anwendung kann man Pakete suchen, installieren, deinstallieren und aktualisieren.

### apt
Pakete lassen sich auch mit [apt](https://wiki.ubuntuusers.de/apt/apt/) über die Kommandozeile verwalten.
```shell
# Paket installieren
sudo apt install paketName -y

# Paket deinstallieren
sudo apt remove paketName -y

# Paket updaten
sudo apt update -y # alle Paketquellen aktualisieren
sudo apt upgrade -y # alle Pakete aktualisieren

# Abhängigkeiten entfernen
sudo apt autoremove --purge -y # alle nicht mehr benötigten Pakete entfernen
                               # --purge entfernt auch alle Abhägigkeiten

# Paketquellen entfernen
sudo apt autoclean
```

### Synaptic
Wer lieber eine GUI nutzt, kann das Programm *Synaptic* installieren (```sudo apt install synaptic```).
Über die GUI von *Synaptic* lassen sich dann die Pakete auf dem Rechner verwalten (installieren, deinstallieren, aktualisieren, ...).

### Manuelle Installation
Pakete können auch manuell installiert werden. Dazu die meist mitgelieferte Anleitung befolgen.

### Prüfen, ob ein Paket installiert ist
```shell
dpkg -l paketName | cat

# oder für eine Liste aller Pakete
dpkg -l | cat
```

### Pakete komplett manuell löschen
1) Eventuell Ordner manuell löschen, auch versteckte Dateien (sichtbar machen mit Strg-H).
2) Paket löschen
```shell
sudo apt remove paketName
sudo apt autoremove --purge
sudo apt autoclean
```
3) Eventuell Desktopicon aus Starter entfernen. gegebenefalls auch .desktop-Datei unter */usr/share/applications* oder *~/.local/share/applications* löschen:
```shell
sudo rm paketName.desktop
```
4) Eventuell Paket aus Autostart löschen. Dazu in der Anwendungssuche (Windows-Taste drücken) *startprogramme* eingeben Programm *Startprogramme* ausführen und das Paket über die GUI entfernen.


## Umgebungsvariablen
[Umgebungsvariablen](https://wiki.ubuntuusers.de/Umgebungsvariable/) speichern Werte, die in einer Shell-Sitzung und von Prozessen wiederverwendet werden können. Ein typisches Beispiel sind Suchpfade zu Programmen (z.B. PATH). Umgebungsvariablen werden von Prozessen vererbt.
```shell
# Umgebungsvariablen anzeigen
echo $VARIABLE

# oder
printenv VARIABLE1 VARIABLE2 ...

# Umgebungsvariable erzeugen
VARIABLE=123 # Variable ist nur in der aktuellen Shell verfügbar

# Umgebungsvariable exportieren
export VARIABLE # Variable auch für Programme verfügbar,
                # die in der aktuellen Shell gestartet wurden

# Umgebungsvariablen anpassen (Beispiel: PATH erweitern)
PATH=$PATH:/pfad/zu/prog # gilt nur für aktuelle Shell-Sitzung
```
Weitere typische Anwendungsfälle finden sich [hier](https://wiki.ubuntuusers.de/Umgebungsvariable/typische_Anwendungsf%C3%A4lle/).

### Umgebungsvariablen dauerhaft anpassen
Um eine Umbebungsvariable dauerhaft anzupassen, muss man diese in der entsprechenden Konfigurationsdatei ändern. Beispiel: PATH dauerhaft erweitern:
* systemweit (alle Benutzer): Datei */etc/environment.d/\*.conf* anpassen:
```shell
sudo nano /etc/environment.d/\*.conf # nano ist ein Editor in der Shell,
                                     # sudo verwenden, weil die Datei systemweit ist
```
* nur aktueller Benutzer: (versteckte) Datei *~/.profile* anpassen:
```shell
nano ~/.profile
```
Eine Übersicht über alle Konfigurationsdateien findet sich [hier](https://wiki.ubuntuusers.de/Umgebungsvariable/Dateien/).

### Umgebungsvariablen für Prozess anzeigen
```shell
cat /proc/PID/environ | tr '\0' '\n' # PID ist die Prozess-ID, environ ist eine Datei

# für den aktuellen Prozess kann man auch *self* schreiben
cat /proc/self/environ | tr '\0' '\n'
```


## PDF

### PDF-Datei anzeigen
```shell
evince datei.pdf
```

### PDF-Dateien bearbeiten
Zuvor muss das Programm [pdftk](https://wiki.ubuntuusers.de/pdftk/) installiert werden:
```shell
sudo apt install pdftk
```
Mit *pdftk* lassen sich PDF-Dateien bearbeiten, z. B.:
```shell
# PDF-Dateien zusammenführen
pdftk datei1.pdf datei2.pdf datei3.pdf cat output datei123.pdf

# oder
pdftk *.pdf cat output zusammen.pdf

# Seiten aus PDF-Dateien entfernen
pdftk datei.pdf cat 2-10 15 20-end output dateiOhneSeiten.pdf # Seiten 1, 11-14, 16-19 werden entfernt
```
Weitere Befehle und Beispiele finden sich [hier](https://wiki.ubuntuusers.de/pdftk/).

### Bilddateien zu PDF-Datei zusammenfügen
Zuvor muss das Programm [ImageMagick](https://wiki.ubuntuusers.de/ImageMagick/) installiert werden:
```shell
sudo apt install imagemagick
```
Mit *ImageMagick* lassen sich dann Bilddateien zu einer PDF-Datei zusammenfügen:
```shell
convert bild1.png bild2.png pdfDatei.pdf

# oder für alle Bilddateien in einem Ordner
convert *.* -gravity center -page a4 pdfDatei.pdf
```
Weitere Befehle und Beispiele finden sich [hier](https://wiki.ubuntuusers.de/ImageMagick/).

### PDF-Datei verkleinern
Zuvor muss das Programm [Ghostscript](https://wiki.ubuntuusers.de/Ghostscript/) installiert werden:
```shell
sudo apt install ghostscript
```
Mit *Ghostscript* lassen sich dann PDF-Dateien verkleinern:
```shell
gs -sDEVICE=pdfwrite \
   -dCompatibilityLevel=1.4 \
   -dPDFSETTINGS=ebook \
   -dNOPAUSE \
   -dBATCH \
   -sOutputFile=pfad/zu/Ausgabe.pdf \
   pfad/zu/Eingabe.pdf
```
Folgende Parameter müssen/können dabei jeweils angepasst werden:
- **sDEVICE** definiert das Ausgabegerät, hier das Schreiben in eine PDF-Datei (*pdfwrite*) (kann so bleiben)
- **dCompatibilityLevel** legt den kompatiblen PDF-Standard fest (kann so bleiben)
- **dPDFSETTINGS** spezifiziert die Qualität der Ausgabedatei. Qualität kann durch einen der folgenden Werte ersetzt werden:
  - *screen* niedrige Qualität (72 dpi)
  - *ebook* mittlere Qualität (150 dpi)
  - *printer* hohe Qualität (300 dpi)
  - *prepress* sehr hohe Qualität (300 dpi)
- **dNOPAUSE** deaktiviert die notwendige manuelle Bestätigung nach der Konvertierung jeder einzelner Seite
- **dBATCH** beendet Ghostscript nach dem Ausführen automatisch
- **sOutputFile** legt den Namen bzw. Pfad der Ausgabedatei fest
- **pfad/zu/Eingabe.pdf** ist der Name bzw. Pfad zur Eingabedatei


## Zip
```shell
# Zip-Archiv erstellen
zip archivName.zip ordner/*

# Zip-Archiv mit Passwort erstellen
zip archivName.zip ordner/* -e
```


## Weitere nützliche Kommandozeilenbefehle
```shell
# Dateimanager (Nautilus) mit Root-Rechten ausführen
nautilus admin:/

# Aktuell eingeloggten Nutzer anzeigen
whoami

# Aktuelle Zeit und aktuelles Datum anzeigen
date

# Ganzen Pfad zum aktuellen Verzeichnis anzeigen
pwd

# Papierkorb leeren
sudo rm -r ~/.local/share/Trash/files/

# Systemwarnungstöne ausschalten (GNOME)
gsettings set org.gnome.desktop.sound event-sounds false
```


## Services
Ein Service ist ein Prozess, der permanent auf dem Rechner läuft (entspricht in etwa Autostart unter Windows).
```shell
# Alle laufenden Services auflisten
service --status-all

# Status des Services zeigen
systemctl status serviceName

# Service starten (nach Reboot nicht mehr aktiv)
systemctl start serviceName

# Service stoppen (nach Reboot Service wieder aktiv)
systemctl stop serviceName

# Service wieder starten
systemctl restart serviceName

# Service starten (nach Reboot automatisch wieder aktiv)
systemctl enable serviceName

# Service stoppen (nach Reboot nicht wieder aktiv)
systemctl disable serviceName
```


### Links
Unter Linux lassen sich Links (ähnlich Verknüpfungen unter Windows) erstellen. Dies ist mit dem Programm [ln](https://wiki.ubuntuusers.de/ln/) über die Kommandozeile möglich.


## Festplatte überschreiben
Will man die Festplatte eines Rechners überschreiben, sodass keine Daten wiederherstellbar sind, z.B. vor Verkauf oedr Verschrottung eines Rechners, kann man das Programm [DBAN](https://dban.org/) nutzen. Folgende Tutorials können hilfreich sein:
* https://www.youtube.com/watch?v=ZNVpTIE3nf4
* https://techexchangeblog.wordpress.com/2015/08/12/festplatten-mit-dban-sicher-loeschen/
* https://www.youtube.com/watch?v=qSowh52Q5lA
* https://www.youtube.com/watch?v=lOkU2dY48_c


## Weitere Quellen
* [ubuntuusers.de (Wiki)](https://wiki.ubuntuusers.de/)
* [Sammlung von Cheatsheets](https://linuxize.com/cheatsheet/page/1/)
* [Sicherheits-Einmaleins für Linux](https://wiki.ubuntuusers.de/Sicherheits-Einmaleins/)
* Linux File System:
  - https://www.youtube.com/watch?v=42iQKuQodW4
  - https://www.youtube.com/watch?v=HIXzJ3Rz9po&list=PLTXMX1FE5Hj4q0078_U4iP7JnEC8LPQaP&index=7
  - https://www.youtube.com/watch?v=A3G-3hp88mo
