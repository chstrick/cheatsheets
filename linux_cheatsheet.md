# Linux Cheatsheet

## Installation

### Boot-fähigen USB-Stick erstellen
In der Anwendungssuche (Windows-Taste drücken) nach *usb* suchen und das Programm *Startmedienersteller (USB Image Writer)* starten.

### Linux neben Windows installieren (Dual-Boot)
Linux lässt sich auch neben Windows installieren. Eine Anleitung findet sich [hier](https://linux-de.com/?p=2921).


## Kommandozeile
Unter Linux lassen sich alle Aufgaben zur Verwaltung des Systems über die Komandozeile (Shell) erledigen. Dazu gibt es zahlreiche Befehle. Eine Übersicht findet sich [hier](https://wiki.ubuntuusers.de/Shell/Befehls%C3%BCbersicht/).


## Pakete
Pakete (entspricht in etwa "Programme") lassen sich unter Ubuntu auf verschiedene Arten installieren und verwalten.

### Ubuntu-Softwarecenter
Ubuntu bietet standardmäßig die Anwendung *Softwarecenter* mit einer GUI an. In der Anwendungssuche (Windows-Taste drücken) nach *softwarecneter* suchen und die Anwendung *Softwarecenter* starten. In der Anwendung kann man Pakete suchen, installieren, deinstallieren und aktualisieren.

### apt
Pakete lassen sich auch mit [apt](https://wiki.ubuntuusers.de/apt/apt/) über die Kommandozeile verwalten.

Installieren:
```shell
sudo apt install paketName
```
Deinstallieren:
```shell
sudo apt remove paketName
```
Updaten:
```shell
sudo apt update # Paketquellen aktualisieren
sudo apt upgrade # alle Pakete werden upgedatet
```
Abhängigkeiten entfernen:
```shell
sudo apt autoremove # alle nicht mehr benötigten Pakete entfernen
```

### Synaptic
Wer lieber eine GUI nutzt, kann das Programm *Synaptic* installieren.
```shell
sudo apt install synaptic
```
Über die GUI von *Synaptic* lassen sich Pakete auf dem Rechner verwalten (installieren, deinstallieren, aktualisieren, ...).

### Manuelle Installation
Pakete können auch manuell installiert werden. Dazu die meist mitgelieferte Anleitung befolgen.

### Pakete komplett manuell löschen
1) Eventuell Ordner manuell löschen, auch versteckte Dateien (sichtbar machen mit Strg-H).
2) Paket löschen
```shell
sudo apt remove paketName
sudo apt autoremove 
```
3) Eventuell Desktopicon aus Starter entfernen. gegebenefalls auch .desktop-Datei unter */usr/share/applications* oder *~/.local/share/applications* löschen:
```shell
sudo rm paketName.desktop
```
4) Eventuell Paket aus Autostart löschen. Dazu in der Anwendungssuche (Windows-Taste drücken) *startprogramme* eingeben Programm *Startprogramme* ausführen und das Paket über die GUI entfernen.

### Prüfen, ob ein Paket installiert ist
```shell
dpkg -l paketName | cat
```
oder für alle Pakete
```shell
dpkg -l | cat
```


## Umgebungsvariablen
[Umgebungsvariablen](https://wiki.ubuntuusers.de/Umgebungsvariable/) speichern Werte, die in einer Shell-Sitzung und von Prozessen wiederverwendet werden können. Ein typisches Beispiel sind Suchpfade zu Programmen (z.B. PATH). Umgebungsvariablen werden von Prozessen vererbt.

### Umgebungsvariablen anzeigen
```shell
echo $VARIABLE
```
oder
```shell
printenv VARIABLE1 VARIABLE2 ...
```

### Umgebungsvariable erzeugen
```shell
VARIABLE=123 # Variable ist nur in der aktuellen Shell verfügbar
```

### Umgebungsvariable exportieren
```shell
export VARIABLE # Variable auch für Programme verfügbar,
                # die in der aktuellen Shell gestartet wurden
```

### Umgebungsvariablen anpassen
Beispiel: PATH erweitern:
```shell
PATH=$PATH:/pfad/zu/prog # gilt nur für aktuelle Shell-Sitzung
```
Weitere typische Anwendungsfälle findet sich [hier](https://wiki.ubuntuusers.de/Umgebungsvariable/typische_Anwendungsf%C3%A4lle/).

### Umgebungsvariablen dauerhaft anpassen
Um eine Umbebungsvariable dauerhaft anzupassen, muss man diese in der entsprechenden Konfigurationsdatei ändern.
Beispiel: PATH dauerhaft erweitern:
* systemweit (für alle Benutzer): Datei */etc/environment* anpssen oder seit Ubuntu 17.10 */etc/environment.d/\*.conf*, was den Vorteil hat, dass die Originaleinstellung erhalten bleibt, und die Erweiterung schnell (auch temporär) deaktiviert werden kann:
```shell
sudo nano /etc/environment.d/\*.conf # nano ist ein Editor in der Shell,
                                     # sudo verwenden, weil die Datei systemweit ist
```
* aktueller Benutzer: (versteckte) Datei *~/.profile* im Homeverzeichnis anpassen
```shell
nano ~/.profile
```
Eine Übersicht über alle Konfigurationsdateien findet sich [hier](https://wiki.ubuntuusers.de/Umgebungsvariable/Dateien/).

### Umgebungsvariablen für Prozess anzeigen
```shell
cat /proc/PID/environ | tr '\0' '\n' # PID ist die Prozess-ID, environ ist eine Datei
```
Für den aktuellen Prozess kann man auch *self* schreiben:
```shell
cat /proc/self/environ | tr '\0' '\n'
```


## PDF
PDF-Dateien lassen sich sehr einfach mit dem Programm [pdftk](https://wiki.ubuntuusers.de/pdftk/) bearbeiten. Dieses muss zuvor installiert werden:
```shell
sudo apt install pdftk
```

### PDF-Dateien zusammenfügen
```shell
pdftk datei1.pdf datei2.pdf datei3.pdf cat output datei123.pdf
```
oder
```shell
pdftk *.pdf cat output zusammen.pdf
```
Weitere Befehle und Beispiele finden sich [hier](https://wiki.ubuntuusers.de/pdftk/).

### Bilddateien zu PDF zusammenfügen
Zuvor muss das Programm [ImageMagick](https://wiki.ubuntuusers.de/ImageMagick/) installiert werden:
```shell
sudo apt install imagemagick
```
Mit *ImageMagick* lassen sich dann Bilddateien zu einer PDF-Datei zusammenfügen:
```shell
convert bild1.png bild2.png pdfDatei.pdf
```
Oder für alle Bilddateien in einem Ordner:
```shell
convert *.* -gravity center -page a4 pdfDatei.pdf
```
Weitere Befehle und Beispiele finden sich [hier](https://wiki.ubuntuusers.de/ImageMagick/).

### PDF-Datei verkleinern
Mit dem Programm [Ghostscript](https://wiki.ubuntuusers.de/Ghostscript/) lassen sich PDF-Dateien verkleinern (ist normalerweise unter Ubuntu vorinstalliert):
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

### Zip-Archiv erstellen
```shell
zip archivName.zip ordner/*
```

### Zip-Archiv mit Passwort erstellen
```shell
zip archivName.zip ordner/* -e
```


## Services
Ein Service ist ein Prozess, der permanent auf dem Rechner läuft (entspricht in etwa Autostart unter Windows).

### Alle laufenden Services auflisten
```shell
service --status-all
```

### Status des Services zeigen
```shell
systemctl status serviceName
```

### Service starten (nach Reboot nicht mehr aktiv)
```shell
systemctl start serviceName
```

### Service stoppen (nach Reboot Service wieder aktiv)
```shell
systemctl stop serviceName
```

### Service wieder starten
```shell
systemctl restart serviceName
```

### Service starten (nach Reboot automatisch wieder aktiv)
```shell
systemctl enable serviceName
```

### Service stoppen (nach Reboot nicht wieder aktiv)
```shell
systemctl disable serviceName
```

### Service nach nächstem Reboot automatisch stoppen
```shell
systemctl disable serviceName
```


## Festplatte überschreiben
Will man die Festplatte eines Rechners überschreiben, sodass keine Daten wiederherstellbar sind, z.B. vor Verkauf oedr Verschrottung eines Rechners, kann man das Programm [DBAN](https://dban.org/) nutzen. 

Tutorials:
* https://www.youtube.com/watch?v=ZNVpTIE3nf4
* https://techexchangeblog.wordpress.com/2015/08/12/festplatten-mit-dban-sicher-loeschen/
* https://www.youtube.com/watch?v=qSowh52Q5lA
* https://www.youtube.com/watch?v=lOkU2dY48_c


## Sonstiges

### Dateimanager (Nautilus) mit Root-Rechten ausführen
```shell
nautilus admin:/
```

### Aktuell eingeloggten Nutzer anzeigen
```shell
whoami
```

### Aktuelle Zeit und aktuelles Datum anzeigen
```shell
date
```

### Ganzen Pfad zum aktuellen Verzeichnis anzeigen
```shell
pwd
```

### Papierkorb leeren
```shell
sudo rm -r ~/.local/share/Trash/files/
```

### Systemwarnungstöne ausschalten (GNOME)
```shell
gsettings set org.gnome.desktop.sound event-sounds false
```

### Links
Unter Linux lassen sich Links (ähnlich Verknüpfungen unter Windows) erstellen. Dies ist mit dem Programm [ln](https://wiki.ubuntuusers.de/ln/) über die Kommandozeile möglich.


## Weitere Quellen
* [ubuntuusers.de](https://wiki.ubuntuusers.de/)
* Bash:
  - [Bash (eine Shell-Implementierung)](https://wiki.ubuntuusers.de/Bash/)
  - [Skripte](https://wiki.ubuntuusers.de/Skripte/)
  - [Scripting-Guide für Anfänger](https://wiki.ubuntuusers.de/Shell/Bash-Skripting-Guide_f%C3%BCr_Anf%C3%A4nger/)
  - [YouTube-Tutorial Scripting](https://www.youtube.com/watch?v=7qd5sqazD7k)
* [List oft nützlicher Befehle](https://gist.github.com/bradtraversy/cc180de0edee05075a6139e42d5f28ce)
* [Sicherheits-Einmaleins](https://wiki.ubuntuusers.de/Sicherheits-Einmaleins/)
* Linux File System:
  - https://www.youtube.com/watch?v=42iQKuQodW4
  - https://www.youtube.com/watch?v=HIXzJ3Rz9po&list=PLTXMX1FE5Hj4q0078_U4iP7JnEC8LPQaP&index=7
  - https://www.youtube.com/watch?v=A3G-3hp88mo
