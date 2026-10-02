# Docker Cheatsheet

1. [Docker](#docker)
    - [Dokumentation](#dokumentation)
    - [Installation und Setup (Linux)](#installation-und-setup-linux)
    - [Dockerfile](#dockerfile)
    - [Docker-Befehle](#docker-befehle)
2. [Docker-Compose](#docker-compose)
    - [Docker-Compose File](#docker-compose-file)
    - [Docker-Compose-Befehle](#docker-compose-befehle)


## Docker

### Dokumentation
* [Offizielle Docker Dokumentation](https://docs.docker.com/)
* [Offizielle Docker Referenz](https://docs.docker.com/reference/)

### Installation und Setup (Linux)
```shell
sudo apt update # Paketquellen aktualisieren
sudo apt upgrade # Pakete aktualisieren
```
Folge danach der [Installationsanleitung von Docker](https://docs.docker.com/desktop/setup/install/linux/ubuntu/).

Für den *Docker Deamon* ist es sinnvoll einen Service zu erstellen (entspricht Autostart von Docker Desktop unter Windows):
```shell
# Start des Services
sudo service docker start
systemctl enable docker # startet automatisch nach Reboot

# Stop des Services
sudo service docker stop
systemctl disable docker # startet nicht mehr automatisch nach Reboot

# Status aller Services (nicht nur Docker) abfragen
service --status-all
```

### Dockerfile
[Dockerfile Referenz](https://docs.docker.com/reference/dockerfile/)

### Docker-Befehle
```shell
# Image erstellen
docker build -t imageName . # -t = xyz (Name des Images)
                            # . = Dockerfile liegt im selben Verzeichnis

# Container starten
docker run imageName
# Container mit Optionen starten
sudo docker run -it -p 8080:8080 --network="host" imageName
# -it : interaktiver Modus
# -p : Port, Container intern:extern
# --network="host" : Zugriff auf localhost

# Alle laufenden Container anzeigen
docker ps

# Alle vorhandenen Container (laufend oder gestoppt) anzeigen
docker ps -a

# Container stoppen
docker stop containerName

# Alle laufenden Container stoppen
docker stop $(docker ps -a -q)

# Container löschen
docker rm containerName

# Alle Container löschen
docker rm $(docker ps -a -q)

# Logs eines laufenden Containes anzeigen
docker logs containerName

# Image in einer Registry (default: Docker Hub) ablegen (vorher anmelden mit docker login)
docker push

# Aufräumen
docker system prune -a # löscht alle ungenutzen Images, gestoppten Conteiner, ungenutzen Netzwerke
```


## Docker-Compose

### Docker-Compose File
[Docker Compose File Referenz](https://docs.docker.com/reference/compose-file/)

### Docker-Compose-Befehle
```shell
# Mehrere Container erstellen und starten
docker-compose up -d # -d: detach, Konsole wird nach Start wieder freigegeben

# Container stoppen und entfernen
docker-compose down

# Images erstellen
docker-compose build

# Container starten
docker-compose start

# Container stoppen
docker-compose stop

# Container löschen
docker-compose rm

# Alle laufenden Container anzeigen
docker-compose ps
```


## Weitere Quellen
Tutorials
* [Docker 101](https://www.youtube.com/watch?v=rIrNIzy6U_g)
* [Docker Grundlagen](https://www.youtube.com/watch?v=eGz9DS-aIeY)
* [Docker Networking](https://www.youtube.com/watch?v=bKFMS5C4CG0)
* [Docker Compose](https://www.youtube.com/watch?v=DM65_JyGxCo)
