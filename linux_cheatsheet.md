# Linux Cheatsheet

1. [Installation](#installation)
2. [Pakete](#pakete)
3. [Kommandozeile](#kommandozeile)
4. [PDF-Dateien](#pdf-dateien)
    - [PDF-Datei anzeigen](#pdf-datei-anzeigen)
    - [PDF-Datei bearbeiten](#pdf-datei-bearbeiten)
    - [Bilddateien zu PDF-Datei zusammenfügen](#bilddateien-zu-pdf-datei-zusammenfügen)
    - [PDF-Datei verkleinern](#pdf-datei-verkleinern)
5. [ZIP-Archive](#zip-archive)
6. [Umgebungsvariablen](#umgebungsvariablen)
7. [Links](#links)
8. [Services](#services)
9. [Festplatte überschreiben (komplett löschen)](#festplatte-überschreiben-komplett-löschen)
10. [Boot-fähigen USB-Stick für Windows erstellen und anwenden](#boot-fähigen-usb-stick-für-windows-erstellen-und-anwenden)
11. [Von Linux auf Windows-Partition zugreifen](#von-linux-auf-windows-partition-zugreifen)
12. [Von Linux Windows Product Key finden](#von-linux-windows-product-key-finden)
13. [Weitere Quellen](#weitere-quellen)


## Installation

### Linux über Boot-fähigen USB-Stick installieren
0) Boot-fähigen USB-Stick für Linux erstellen
    - Ggf. noch folgendes Programm installieren: `sudo apt-get install usb-creator-gtk`.
    - Das Programm *Startmedienersteller (USB Image Writer)* starten. Dazu in der Anwendungssuche (Windows-Taste drücken) nach *usb image writer* suchen.
    - Mit dem *Startmedienersteller* einen Boot-fähigen USB-Strick erstellen.
1) Rechner herunterfahren.
2) USB-Stick einstecken.
3) Rechner neu starten und den Start mit einer der Tasten Enter / F2 / F11 / F12 unterbrechen.
4) Danach kann der USB-Stick als Startmedium ausgewählt werden.
5) Das Linx-Betriebssystem startet im *Live-Modus* (eine Art Probemodus).
    - In diesem kann das System leicht installiert werden.
    - Dazu einfach den Anweisungen folgen.

Alternativ kann auch das Tool [YUMI](https://pendrivelinux.com/yumi-multiboot-usb-creator/#yumi-py) mit grafischer Benutzeroberfläche genutzt werden.

### Linux neben Windows installieren (Dual-Boot)
Linux lässt sich auch neben Windows installieren. Eine Anleitung findet sich [hier](https://linux-de.com/?p=2921).

### Ubuntu upgraden (neue Ubuntu-Version)
Um Ubuntu auf die nächste Version upzugraden, folge den [hier](https://wiki.ubuntuusers.de/Upgrade/) oder [hier](https://documentation.ubuntu.com/desktop/en/latest/how-to/upgrade-ubuntu-desktop/) beschriebenen Anweisungen.


## Pakete
Pakete (entspricht in etwa "Programme" unter Windows) lassen sich unter Ubuntu auf verschiedene Arten installieren und verwalten.

### Ubuntu-Softwarecenter
Ubuntu bietet standardmäßig die Anwendung *Softwarecenter* mit einer GUI an. In der Anwendungssuche (Windows-Taste drücken) nach *softwarecneter* suchen und die Anwendung *Softwarecenter* starten. In der Anwendung kann man Pakete suchen, installieren, deinstallieren und aktualisieren.

### apt
Pakete lassen sich auch mit [apt](https://wiki.ubuntuusers.de/apt/apt/) über die Kommandozeile verwalten.
```shell
# Paket installieren
sudo apt install paketName -y

# Paket updaten
sudo apt update # alle Paketquellen aktualisieren
sudo apt upgrade -y # alle Pakete aktualisieren

# Paket deinstallieren
sudo apt remove paketName -y

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

### Pakete komplett löschen
1) Paket löschen mit apt:
```shell
sudo apt remove paketName
sudo apt autoremove --purge
sudo apt autoclean
```
2) Eventuell Dateien und Verzeichnisse noch manuell löschen, auch versteckte Dateien (sichtbar machen mit Strg-H).
3) Eventuell Desktopicon aus Starter entfernen. Ggf. auch *.desktop*-Datei löschen:
```shell
sudo rm /usr/share/applications/paketName.desktop
sudo rm ~/.local/share/applications/paketName.desktop
```
4) Eventuell Paket aus Autostart löschen.
    - Dazu in der Anwendungssuche (Windows-Taste drücken) *startprogramme* suchen.
    - Das Programm *Startprogramme* ausführen und das Paket über die GUI entfernen.


## Kommandozeile
Unter Linux lassen sich alle Aufgaben zur Verwaltung des Systems über die Komandozeile ([**Shell**](https://wiki.ubuntuusers.de/Shell/)) erledigen. Dazu gibt es zahlreiche Befehle. Die [**Bash**](https://wiki.ubuntuusers.de/Bash/) (Bourne Again Shell) ist eine Implementierung der Shell und der Quasi-Standard-Shell.

<details>
<summary>Nützliche Befehle</summary>

```shell
# --- Verzeichnis wechseln --------------------
cd /pfad/zu/verzeichnis/
cd ~           # Home-Verzeichnis des aktuellen Nutzers
cd ..          # ein Verzeichnis hoch
cd -           # vorheriges Verzeichnis
pwd            # Pfad zum aktuellen Verzeichnis anzeigen


# --- Dateien & Verzeichnisse auflisten --------------------
ls
ls -l          # Liste alle Dateien/Verzeichnisse mit Details
ls -la         # inklusive versteckter Dateien/Verzeichnisse
ls -lt         # nach Änderungsdatum sortieren
ls -lS         # nach Größe sortieren
ls -R          # rekursiv - Inhalt von Unterordnern anzeigen


# --- Datei(en) erstellen --------------------
touch neueDatei.txt
touch datei1.txt datei2.txt datei3.txt

# --- Verzeichnis erstellen --------------------
mkdir neuesVerzeichnis
# Verschachtelte Verzeichnisse erstellen
mkdir -p pfad/von/verschachtelten/verzeichnissen/
# Mehrere Verzeichnisse gleichzeitig erstellen
mkdir ordner1 ordner2 ordner3

# --- Dateien & Verzeichnisse kopieren --------------------
cp alterName.txt neuerName.txt
cp datei1.txt datei2.txt pfad/zum/ziel/
# Verzeichnisse rekursiv kopieren
cp -r quell_verz/ ziel_verz/

# --- Datei umbenennen/verschieben --------------------
mv alterName.txt neuerName.txt
# Datei(en) verschieben
mv datei.txt /pfad/zum/ziel/
mv datei1.txt datei2.txt /pfad/zum/ziel/

# --- Dateien & Verzeichnisse löschen --------------------
rm datei.txt                # Datei löschen
rm datei1.txt datei2.txt    # mehrere Dateien löschen
rm -rf verzeichnis/         # Verzeichnis rekursiv löschen
rmdir leeres_verz/          # Leeres Verzeichnis löschen

# --- Dateiinhalt anzeigen --------------------
cat datei.txt
cat -n datei.txt     # mit Zeilennummern
less datei.txt       # aufgeteilt in Seiten (gut für große Dateien)

# --- Datei bearbeiten --------------------
nano datei.txt       # Nano ist ein einfacher Texteditor
vim datei.txt        # Vim ist ein umfangreicher Texteditor


# --- Suchen & Finden --------------------
find /pfad -name "dateiname.txt"        # Datei nach Dateiname
find . -name "*.js"                     # Datei nach Dateiendung
find . -type f                          # nur Dateien suchen
find . -type d                          # nur Verzeichnisse suchen
find . -name "*.log" -delete            # Datei suchen und Löschen
find . -type f -exec chmod 644 {} \;    # Datei suchen und Befehl ausführen (z.B. chmod)

grep "muster" datei.txt                 # in Datei suchen
grep -i "muster" datei.txt              # Case-sensitiv
grep -r "muster" verzeichnis/           # rekursiv in Inhalt von Verzeichnis suchen
grep -n "muster" datei.txt              # Zeilennummern anzeigen
grep -c "muster" datei.txt              # Treffer zählen
grep -v "muster" datei.txt              # Suche invertieren (exkludieren)


# --- Rechte für Dateien & Verzeichnisse bearbeiten --------------------
chmod XXX datei.txt         # XXX = Nummer, z.B. 644 = rw-r--r--
chmod +x                    # Datei ausführbar machen
chmod -R XXX verzeichnis/   # rekursiv für Verzeichnisse
sudo befehl                 # befehl mit Root-Rechten ausführen
# Besitzer für Dateien & Verzeichnissenbearbeiten
sudo chown username datei.txt
sudo chown -R username verzeichnis/
# Gruppe für Dateien & Verzeichnisse bearbeiten
chgrp groupname file.txt
chgrp -R groupname verzeichnis/
groups                      # aktuelle Gruppen anzeigen
id                          # aktuelle Gruppen inklusive IDs anzeigen


# --- Systeminformationen --------------------
uname -a                # Alle Systeminformationen
uname -r                # Aktuelle Kernel-Version
uname -m                # Aktuelle Rechnerarchitekture
cat /etc/os-release     # OS Informationen
hostname                # Hostname (Name des Rechners)
who                     # Aktueller Nutzer
whoami                  # Name des aktuellen Nutzers
id                      # ID des aktuellen Nutzers
date                    # Aktuelle Zeit und aktuelles Datum


# --- Festplatten-/RAM-Informationen --------------------
df -h                           # Größe/freier Platz pro Dateisystem
du -h verzeichnis/              # Verzeichnisgröße
du -ah | sort -rh | head -20    # Dateien/Verzeichnisse nach Größe sortiert
free -h                         # Größe/freier Platz RAM
cat /proc/meminfo               # Ausführliche RAM-Informationen


# --- Netzwerkinformationen --------------------
ip a                # IP-Adresse anzeigen
ss -tuln            # Alle offenen eingehenden Ports anzeigen
ss -ant             # Alle Verbindungen anzeigen
ping google.com     # Ping zu Server; prüft, ob Server erreicht werden kann


# --- Weitere Befehle --------------------
# Papierkorb leeren
sudo rm -r ~/.local/share/Trash/files/

# Job anhalten
# Strg-Z drücken

# Angehaltenen Job stoppen
jobs                # listet alle Jobs auf (NUmmer ist Zahl in eckigen Klammern)
kill -9 %nummer     # stoppt Job mit nummer

# Ausführbare Programme finden
which python3        # Verzeichnis der Binärdatei
whereis python3      # Verzeichnisse von Binärdatei, Quellcode, etc.

# Dateimanager (Nautilus) mit Root-Rechten ausführen
nautilus admin:/

# Systemwarnungstöne ausschalten (GNOME)
gsettings set org.gnome.desktop.sound event-sounds false
```
* [Shell-Befehlsübersicht (ubuntuusers)](https://wiki.ubuntuusers.de/Shell/Befehls%C3%BCbersicht/)
</details>


## PDF-Dateien

### PDF-Datei anzeigen
```shell
evince datei.pdf
```

### PDF-Datei bearbeiten
Das Programm [pdftk](https://wiki.ubuntuusers.de/pdftk/) installieren:
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
Das Programm [Ghostscript](https://wiki.ubuntuusers.de/Ghostscript/) installieren:
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


## ZIP-Archive
```shell
# ZIP-Archiv erstellen
zip archiv.zip datei1.txt datei2.txt    # Archiv erstellen
zip archiv.zip verzeichnis/*            # alle Datein im Verzeichnis
zip -r archiv.zip verzeichnis/          # rekursiv das ganze Verzeichnis
zip archiv.zip verzeichnis/* -e         # Archiv mit Passwort erstellen
unzip archiv.zip                        # Archiv entpacken
unzip archiv.zip -d /verzeichnis/       # Archiv nach Verzeichnis entpacken
unzip -l archiv.zip                     # Inhalt des Archivs auflisten
```


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


## Links
Mit dem Befehl [ln](https://wiki.ubuntuusers.de/ln/) lassen sich unter Linux lassen zwei Arten von Links erstellen:
* Ein *Symbolic/Soft Link* ist eine kleine Datei, die den Pfad zu einer anderen Datei/einem anderen Verzeichnis enthält. Symbolic Links können Partitions- und Dateisystemübergreifend auf Ziele zeigen. Sie sind vergleichbar mit Verknüpfungen unter Windows. Wird eine Symbolic Link gelöscht, bleibt die Ursprungsdatei erhalten.
* Ein *Hard Link* ist ein zusätzlicher Name für eine Datei (auch nur eine Datei). Zwei oder mehr Namen zeigen auf die gleichen Daten auf der Festplatte. Hard Links können nur für Dateien erstellt werden und sind nicht Dateisystem-übergreifend. Werden alle Hard Links gelöscht, wird auch die Ursprungsdatei gelöscht.
```shell
ln pfad1/ziel.txt pfad2/linkname.txt    # Hard link erstellen
ln -s ziel linkname                     # Symbolic Link erstellen (ziel/linkname sind Verzeichnis oder Datei)
ln -sf ziel linkname	                # Symbolic Link erstellen oder überschreiben (f = force)
ls -l linkname                          # Link und sein Ziel anzeigen
ls -la /pfad/                           # Alle Dateien anzeigen (inkl. versteckter Symlinks)
readlink linkname                       # Ziel eines Symlinks anzeigen
readlink -f linkname                    # Absoluten Zielpfad eines Symlinks anzeigen
stat linkname	                        # Komplette Metadaten eines Links anzeigen
file linkname                           # Prüfen, ob ein Pfad ein Symlink ist
find verzeichnis/ -type l               # Finde alle Symbolic Links in einem Verzeichnis
find verzeichnis/ -xtype l              # Finde nur kaputte Symbolic Links
rm symlinkname                          # Symbolic Link löschen
unlink symlinkname                      # Symbolic Link löschen
find verzeichnis/ -type l -delete       # Alle Symbolic Links in einem Verzeichnis löschen
```


## Services
Ein Service ist ein Prozess, der permanent auf dem Rechner läuft (entspricht in etwa Autostart unter Windows).
```shell
service --status-all                # alle laufenden Services auflisten
systemctl status serviceName        # Status des Services zeigen
systemctl start serviceName         # Service starten (nach Reboot nicht mehr aktiv)
systemctl stop serviceName          # Service stoppen (nach Reboot Service wieder aktiv)
systemctl restart serviceName       # Service wieder starten
systemctl enable serviceName        # Service starten (nach Reboot automatisch wieder aktiv)
systemctl disable serviceName       # Service stoppen (nach Reboot nicht wieder aktiv)
```


## Festplatte überschreiben (komplett löschen)
Will man die Festplatte eines Rechners überschreiben, sodass keine Daten wiederherstellbar sind, z.B. vor Verkauf oder Verschrottung eines Rechners, kann man das Programm [DBAN](https://dban.org/) nutzen.

### Boot-fähigen USB-Stick für DBAN erstellen
1) Datei *DBAN.iso* herunterladen.
2) USB-Stick einstecken.
3) Boot-fähigen USB-Stick erstellen:
```shell
# Ggf. benötigte Programme installieren
sudo apt install fdisk

# USB-Stick- und Partitionsnamen ermitteln
lsblk           # listet alle Medien und Partitionen auf
sudo fdisk -l   # Alternative

# USB-Stick aushängen
sudo umount /dev/sdX*   # hängt das Medium sdX und alle seine Partionen aus
                        # (X durch eigenen Buchstaben ersetzen!!!)

# ISO auf USB-Stick schreiben
sudo dd if=/path/to/dban.iso of=/dev/sdX bs=4M status=progress

# Buffer synchronisieren
sudo sync
```

### DBAN anwenden
0) Boot-fähigen USB-Stick erstellen.
1) Rechner herunterfahren.
2) USB-Stick mit DBAN einstecken.
3) Rechner neu starten und den Start mit einer der Tasten Enter / F2 / F11 / F12 unterbrechen.
4) Danach kann der USB-Stick als Startmedium ausgewählt werden.
5) DBAN startet und dort den Anweisungen folgen. Tutorials:
    - https://www.youtube.com/watch?v=ZNVpTIE3nf4
    - https://techexchangeblog.wordpress.com/2015/08/12/festplatten-mit-dban-sicher-loeschen/
    - https://www.youtube.com/watch?v=qSowh52Q5lA
    - https://www.youtube.com/watch?v=lOkU2dY48_c


## Boot-fähigen USB-Stick für Windows erstellen und anwenden

### USB-Stick erstellen
1) Datei *Win11_25H2_German_x64_v2.iso* (oder so ähnlich) herunterladen.
2) USB-Stick einstecken.
3) Boot-fähigen USB-Stick erstellen:
```shell
# Ggf. benötigte Programme installieren
sudo apt install fdisk

# USB-Stick- und Partitionsnamen ermitteln
lsblk           # listet alle Medien und Partitionen auf
sudo fdisk -l   # Alternative

# USB-Stick aushängen
sudo umount /dev/sdX*   # hängt das Medium sdX und alle seine Partionen aus
                        # (X durch eigenen Buchstaben ersetzen!!!)

# ISO auf USB-Stick schreiben
sudo dd if=/path/to/windows.iso of=/dev/sdX bs=4M status=progress

# Buffer synchronisieren
sudo sync
```
Für ein Hybrid-System, folge dieser [Anleitung](https://guillermodotn.github.io/posts/Creating_a_bootable_Windows_USB_on_linux/).

### USB-Stick anwenden
0) Boot-fähigen USB-Stick erstellen.
1) Rechner herunterfahren.
2) USB-Stick mit Windows einstecken.
3) Rechner neu starten und den Start mit einer der Tasten Enter / F2 / F11 / F12 unterbrechen.
4) Danach kann der USB-Stick als Startmedium ausgewählt werden.
5) Windows startet und dort den Anweisungen folgen.


## Von Linux auf Windows-Partition zugreifen
```shell
sudo fdisk -l                                       # Partitionsname ermitteln (sollte /dev/xxx.. sein)
sudo mkdir /mnt/mswpart                             # Mount-Point erstellen
sudo mount -t ntfs-3g -o ro /dev/xxx /mnt/mswpart   # Partition einhängen (xxx durch richtigen Namen ersetzen)

# Wenn Partion eingehängt
cd Users/chris/XXX/         # In Benutzerordner navigieren, z.B. XXX = Documents, Downloads, ...
ls -la                      # z.B. Dateien anzeigen
cat MeineDatei.txt          # z.B. Dateiinhalt anzeigen
exit                        # Terminal und Session beenden

# Neues Terminal starten
sudo umount /mnt/mswpart/   # Partition aushängen
lsblk                       # Prüfen, ob Partition ausgehängt ist
sudo rmdir /mnt/mswpart     # Mount-Point löschen
```


## Von Linux Windows Product Key finden
```shell
sudo cat /sys/firmware/acpi/tables/MSDM | tail -1   # gibt Product Key aus
```


## Weitere Quellen
* [ubuntuusers.de (Wiki)](https://wiki.ubuntuusers.de/)
* [Sammlung von Cheatsheets (linuxize.com)](https://linuxize.com/cheatsheet/page/1/)
* [Sammlung von Cheatsheets (devsheets.io)](https://devsheets.io/sheets/)
* [Sicherheits-Einmaleins für Linux](https://wiki.ubuntuusers.de/Sicherheits-Einmaleins/)
* Linux File System:
  - https://www.youtube.com/watch?v=42iQKuQodW4
  - https://www.youtube.com/watch?v=HIXzJ3Rz9po&list=PLTXMX1FE5Hj4q0078_U4iP7JnEC8LPQaP&index=7
  - https://www.youtube.com/watch?v=A3G-3hp88mo
