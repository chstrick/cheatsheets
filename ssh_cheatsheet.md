# SSH Cheatsheet

1. [Secure Shell (SSH)](#secure-shell-ssh)
2. [Installation (Linux)](#installation-linux)
3. [Mit Remote-Server über SSH und Passwort verbinden](#mit-remote-server-über-ssh-und-passwort-verbinden)
4. [Mit Remote-Server über SSH und Public-Key verbinden](#mit-remote-server-über-ssh-und-public-key-verbinden)


## Secure Shell (SSH)
Die [Secure Shell (SSH)](https://wiki.ubuntuusers.de/SSH/) bietet die Möglichkeit sich über eine gesicherte Verbindung mit einem Remote-Server zu verbinden.


## Installation (Linux)
```shell
sudo apt update
sudo apt install openssh-client
```


## Mit Remote-Server über SSH und Passwort verbinden
```shell
ssh userName@remoteHost # remoteHost = IP-Adresse z.B. 127.0.0.1
                        # remoteHost = Rechnername z.B. rechner
                        # remoteHost = Domain z.B. example.com
                        # Danach muss man das Passwort eingeben
```
Anstelle eines Passworts wird eine [Public-Key-basierte Authentifizierung](https://wiki.ubuntuusers.de/SSH/#Public-Key-Authentifizierung) empfohlen.


## Mit Remote-Server über SSH und Public-Key verbinden
Public- und Private-Key erzeugen:
```shell
ssh-keygen -t rsa -b 4096 -P "passwort" -f ~/.ssh/keyDateiName
# wird zwei Dateien unter /home/user/.ssh/ erzeugen, keyDateiName (private key) und keyDateiName.pub (public key)
# Passwort muss immer bei Nutzung des Schlüssels eingegeben werden
```
Nachdem der Public-Key dem Server übermittelt wurde, kann man sich mit dem Private-Key einloggen:
```shell
ssh -i ~/.ssh/keyDateiName userName@remoteHost # der Pfad unter -i kann auch anders lauten, wenn die Datei woanders liegt
```
Möchte man die Informationen sehen, die genutzt werden, kann man den Verbose-Modus nutzen:
```shell
ssh -v userName@remoteHost
```


## Weitere Quellen
* [Tutorial von linuxize.com](https://linuxize.com/series/ssh-essentials/)
* [SSH Cheatsheet von linuxize.com](https://linuxize.com/cheatsheet/ssh/)
