# Docker Cheatsheet

</br>

## Dokumentation
* [Offizielle Docker Dokumentation](https://docs.docker.com/)
* [Offizielle Docker Referenz](https://docs.docker.com/reference/)


</br>

## Installation und Setup (Linux)
```shell
sudo apt update # Paketquellen aktualisieren
sudo apt upgrade # Pakete aktualisieren
```
Folge danach der [Installationsanleitung](https://docs.docker.com/desktop/setup/install/linux/ubuntu/) von Docker.

Ein Service ist unter Linux ein Prozess, der so eingestellt werden kann, dass er immer läuft. Für den Docker Deamon ist es sinnvoll so einen Service zu erstellen (entspricht Autostart von Docker Desktop unter Windows).
* Start: ```sudo service docker start```
* Stop: ```sudo service docker stop```
* Status aller Services (nicht nur Docker): ```service --status-all```


</br>

## Docker

### Dockerfile
[Dockerfile Referenz](https://docs.docker.com/reference/dockerfile/)

### Image erstellen
```shell
docker build -t imageName . # -t = xyz (Name des Images)
                            # . = Dockerfile liegt im selben Verzeichnis
```

### Container starten
```shell
docker run imageName
```

### Container mit Optionen starten
```shell
sudo docker run -it -p 8080:8080 --network="host" imageName
# -it : interaktiver Modus
# -p : Port, Container intern:extern
# --network="host" : Zugriff auf localhost
```

### Alle laufenden Container anzeigen
```shell
docker ps
```

### Alle vorhandenen Container (laufend oder gestoppt) anzeigen
```shell
docker ps -a
```

### Container stoppen
```shell
docker stop containerName
```

### Alle laufenden Container stoppen
```shell
docker stop $(docker ps -a -q)
```

### Container löschen
```shell
docker rm containerName
```

### Alle Container löschen
```shell
docker rm $(docker ps -a -q)
```

### Logs eines laufenden Containes anzeigen
```shell
docker logs containerName
```

### Image in einer Registry (default: Docker Hub) ablegen (vorher anmelden mit docker login)
```shell
docker push
```

### Aufräumen
```shell
docker system prune -a # löscht alle ungenutzen Images, gestoppten Conteiner, ungenutzen Netzwerke
```


</br>

## Docker-Compose

### Docker-Compose File
[Docker Compose File Referenz](https://docs.docker.com/reference/compose-file/)

### Mehrere Container erstellen und starten
```shell
docker-compose up -d # -d: detach, Konsole wird nach Start wieder freigegeben
```

### Container stoppen und entfernen
```shell
docker-compose down
```

### Images erstellen
```shell
docker-compose build
```

### Container starten
```shell
docker-compose start
```

### Container stoppen
```shell
docker-compose stop
```

### Container löschen
```shell
docker-compose rm
```

### Alle laufenden Container anzeigen
```shell
docker-compose ps
```


</br>

## Weitere Quellen
Tutorials
* [Docker 101](https://www.youtube.com/watch?v=rIrNIzy6U_g)
* [Docker Grundlagen](https://www.youtube.com/watch?v=eGz9DS-aIeY)
* [Docker Networking](https://www.youtube.com/watch?v=bKFMS5C4CG0)
* [Docker Compose](https://www.youtube.com/watch?v=DM65_JyGxCo)
