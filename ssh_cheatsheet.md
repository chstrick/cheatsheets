# SSH Cheatsheet

Die [Secure Shell (SSH)](https://wiki.ubuntuusers.de/SSH/) bietet die Möglichkeit sich über eine gesicherte Verbindung mit einem Remote-Server zu verbinden.


## Mit Remote-Server über SSH und Passwort verbinden
```shell
ssh userName@remoteHost # remoteHost = IP-Adresse z.B. 127.0.0.1
                        # remoteHost = Rechnername
                        # remoteHost = Domain z.B. example.com
                        # Danach muss man das Passwort eingeben
```
Anstelle eines Passworts wird eine [Public-Key-basierte Authentifizierung](https://wiki.ubuntuusers.de/SSH/#Public-Key-Authentifizierung) empfohlen.


## Mit Remote-Server über SSH und Public-Key verbinden
Public- und Private-Key erzeugen:
```shell
ssh-keygen -t rsa -b 4096 -C "userName@remoteHost" -p passwort -f ~/.ssh/keyDateiName
# wird zwei Dateien unter /home/user/.ssh/ erzeugen, keyDateiName (private key) und keyDateiName.pub (public key)
# Passwort muss immer bei Nutzung des Schlüssel eingeben werden
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
* https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server
* https://www.digitalocean.com/community/tutorials/ssh-essentials-working-with-ssh-servers-clients-and-keys
* https://www.digitalocean.com/community/tutorials/how-to-use-ssh-to-connect-to-a-remote-server
