# Git Cheatsheet

</br>

## Dokumentation
* [Offizielle git Dokumentation](https://git-scm.com/)
* [Offizielle git Referenz](https://git-scm.com/docs)
* Außerdem lässt sich mit ```git --help``` Hilfe anzeigen, oder mit ```git command --help``` für einen spezifischen Befehl.


</br>

## Installation und Setup (Linux)
```shell
sudo apt update # Paketquellen aktualisieren
sudo apt upgrade # Pakete aktualisieren

sudo apt install git # Git installieren
git --version # Prüfen, ob Git korrekt installiert wurde
git lfs install # (Empfohlen) git-lfs auch direkt installieren

git config --global user.name "userName" # Nutzername festlegen (erscheint in Commits)
git config --global user.email "user@email.com" # Nutzer-E-Mail festlegen
git config --global credential.helper store # speichert Credentials, damit diese nicht bei jeder Kommuniation mit dem Remote-Repo eingegeben werden müssen
```


</br>

## Lokales Repository anlegen
```shell
cd pfad/zu/projectRootFolder # in Root-Verzeichnis des Projekts navigieren
git init repoName # erzeugt ein leeres lokales Repository und den main-Branch
# als erstes sollte dann eine README-Datei und eine .gitignore-Datei angelegt werden (s.u.)
```


</br>

## Remote-Repository klonen (lokale Kopie erstellen)
```shell
git clone remoteRepoUrl
# danach wird man aufgefordert sich zu authentifiziern (z.B. mit Benutzername und Password, Token, SSH-Key)
# eine Anleitung für GitHub und Token findet sich weiter unten.
```


</br>

## Branch erstellen und auschechen
```shell
git branch newBranchName existingBranch # neuen Branch erstellen, nicht auschecken
git checkout newBranchName # neuen Branch auschecken
# oder
git checkout -b newBranchName existingBranch # neuen Branch erstellen und direkt auschecken

# Tipp:
git checkout -b newBranchName # existingBranch weggelassen, dann wird der aktuelle HEAD verwendet

# Tipp:
git branch # listet alle lokalen Branches auf (aktueller Branch ist mit * markeiert)
```


</br>

## Änderung commiten und pushen
```shell
git fetch # Remote-Änderungen holen (nur Metadaten, kein pull)
          # (remoteName ist i.d.R. 'origin')
git checkout branchName # gewünschten Branch auschecken

# neue Dateien erstellen, oder Änderungen vornehmen

git stash # eigene Änderungen stashen (zwischenspeichern)
git pull --rebase # Änderungen von Remote-Branch einspielen (pull = fetch + merge)
git stash apply # eigene Änderungen anwenden

git add datei1 datei2 ... # neue/geänderte Datein in Staging Area hinzufügen
# oder: git add . # alle neuen/geänderten Dateien hinzugefügt
git commit -m "Commit message" # Änderungen commiten

# falls noch kein Remote-Repo angelegt:
git remote add remoteName remoteRepoUrl # (remoteName ist i.d.R. 'origin')
# falls Remote-Repo bereits verknüpft, aber Branch noch nicht im Remote-Repo:
git push -u remoteName localBranchName
# falls Remote-Repo verknüpft und Branch auch schon im Remote-Repo:
git push remoteName localBranchName # (pusht alle Commits)
# oder kurz:
git push
```


</br>

## Fremden Remote-Branch in aktuellen eigenen Local-Branch mergen
```shell
git status
git stash # alle eigenen Änderungen stashen (zwischenspeichern)
git status # (sicherheitshalber nach jedem Befehl Zustand kontrollieren)
git pull --rebase # Änderungen von Remote-Repo holen
git status
git stash list # listet alle Stash-Einträge auf
git stash apply nr # eigene Änderungen anwenden, nr ist Nummer in Stash-Liste (Eintrag bleibt in Stash erhalten)

git status
git add . # alle eigenen Änderungen zu Staging Area hinzufügen
git status
git commit -m "Commit Message" # eigene Änderungen commiten
git status
git pull --rebase # noch mal Änderungen von Remote-Repo holen
                  # (vielleicht hat sich in der Zwischenzeit was geändert)
git status
git push # eigene Änderungen pushen
git status
```


</br>

## Letzten lokalen Commit ändern/erweitern
```shell
git add geaenderteDatei1 geaenderteDatei2 ...
git commit --amend --no-edit # fügt die Änderungen zum letzten Commit hinzu

# Tipp:
git commit --amend -m "Neue Commit Message" # mit amend lässt sich auch die Commit-Message ändern
```


</br>

## Lokale Änderungen rückgängig machen
```shell
# Datei aus Staging Area löschen, aber Datei erhalten
git restore --staged

# einen Stash-Eintrag löschen
git stash drop nr

# Datei aus Versionsverwaltung löschen, aber Datei erhalten
git rm --cached

# einen Commit rückgängig machen
git revert commitId # erstellt einen neuen Commit, der die Änderungen des Commits mit der commitId rückgängig macht

# einen Commit löschen
git reset --hard commitId # setzt HEAD auf Commit mit commitId
                          # (Achtung: Löscht auch Staging Area)
# oder
git reset --soft commitId # setzt HEAD auf Commit mit commitId,
                          # behält aber Staging Area

# einen Branch löschen
git branch -d branchName
```
* [Siehe auch](https://www.atlassian.com/de/git/tutorials/resetting-checking-out-and-reverting)


</br>

## Git Rebase
Mit dem Befehl ```git rebase commitId/branchName``` lässt sich der aktuelle Arbeits-Branch auf den angegeben Commit anwenden, der "Startpunkt" des aktuellen Branches wird quasi verschoben.
* [Siehe auch: Git Rebase](https://www.atlassian.com/de/git/tutorials/rewriting-history/git-rebase)
* [Siehe auch: Merge vs. Rebase](https://www.atlassian.com/de/git/tutorials/merging-vs-rebasing)


</br>

## .gitignore
In der .gitignore-Datei werden alle Dateien spezifiziert, die nicht von Git erfasst werden sollen.
* [.gitignore Referenz](https://git-scm.com/docs/gitignore)
* [.gitignore-Templates von GitHub](https://github.com/github/gitignore)
* [.gitignore Best Practices](https://gitignore.pro/guides/gitignore-best-practices)


</br>

## README
In der *README.md*-Datei ("read me", engl. für "lies mich") wird das Projekt erklärt und es werden allegemeine Informationen gegeben. Es ist üblich die README-Datei als Markdown-Datei (Endung .md) anzulegen.
* [Leitfaden zur Erstellung einer README-Datei](https://www.makeareadme.com/)
* [Übersicht Markdown-Syntax](https://commonmark.org/help/)
* [Markdown Guide](https://www.markdownguide.org/)


</br>

## LICENSE
Erstellt man ein Open-Source-Projekt, sollte man eine Lizenz angeben. Die Lizenz wird im Repository in der Datei LICENSE angegeben (ohne Endung oder mit .txt).
* [Überblick und Auswahlhilfe](https://choosealicense.com/)


</br>

## .gitattributes
In der .gitattributes-Datei wird spezifiziert, wie Git mit bestimmten Dateien umgehen soll. Spezifiziert werden z.B. Dateitypen, Zeilenenden, Merge-Verhalten oder Diff-Tools.
* [.gitattributes Referenz](https://git-scm.com/docs/gitattributes)


</br>

## Git Large File Storage
[Git Large File Storage (LFS)](https://git-lfs.com/) ersetzt große Dateien, wie Audio- oder Video-Dateien, durch Pointer, damit auch diese platzsparend verwaltet werden können. Dazu im Repository folgende Befehle ausführen:
```shell
git lfs track "*.mp3" # festlegen, welche Datein getrackt werden sollen
git add .gitattributes # sicherstellen, dass die Datei .gitattributes getrackt wird
# nun können auch die großen Dateien mit add, commit, push verarbeitet werden
```


</br>

## Sontiges

### Git Cherry-Pick
Mit dem Befehl ```git cherry-pick commitId``` lässt sich ein beliebiger Commit auswählen und an den aktuellen HEAD anhängen.
* [Siehe auch: Cherry-Pick](https://www.atlassian.com/de/git/tutorials/cherry-pick)

### Letzte(n) Remote-Commit(s) löschen
```shell
git stash # alle lokale Änderungen zwischenspeichern!
git reset --hard idLetzterFunktionierenderCommit # setzt HEAD (aktueller Commit) auf diesen Commit
git push --force # pusht Änderungen (Achtung: force vorsichtig verwenden, es gibt kein zurück!)
```

### Remote-Repo ändern
```shell
git remote -v # listet alle Remote-Repos auf
git remote set-url remoteName newUrl # (remoteName ist i.d.R. 'origin')
```


</br>

## Weitere Quellen
* [Sehr gutes und kompaktes cheatsheet](https://cs.fyi/guide/git-cheatsheet)
* [Offizelles cheatsheet auf git-scm.com](https://git-scm.com/cheat-sheet)
* [giteveryday (nützliche Befehlsketten für die tägliche Arbeit mit Git)](https://git-scm.com/docs/giteveryday)
* [gittutorial (kleines Anfänger-Tutorial für Git)](https://git-scm.com/docs/gittutorial)
* [GitHub-Remote-Repo mit Token einrichten](https://blog.techeazyconsulting.com/connecting-git-to-github-with-pat-token)
* [Git Monorepos (ein Repo für mehrere Teile eines Projekts (z.B. Frontend und backend))](https://wellarchitected.github.com/library/scenarios/monorepos/)
* [Tipps für .gitignore in Monorepos](https://www.tutorialpedia.org/blog/ignoring-any-bin-directory-on-a-git-project/)
