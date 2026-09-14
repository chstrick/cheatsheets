# LaTeX Cheatsheet

1. [Installation und Setup (Linux)](#installation-und-setup-linux)
2. [LaTeX-Package installieren](#latex-package-installieren)
3. [Weitere Quellen](#weitere-quellen)


## Installation und Setup (Linux)
Zur installation aller relevanten Pakete des [TeX Live Systems](https://wiki.ubuntuusers.de/TeX_Live/) folgenden Befehl ausführen:
```shell
texlive texlive-lang-german texlive-latex-extra
```
Als Editor kann [TeXstudio](https://texstudio.org/) genutzt werden, welches über das Ubuntu-Softwarecenter installiert werden kann.


## LaTeX-Package installieren
1) Package herunterladen, z.B. unter [ctan.org](https://ctan.org/pkg/pgf-pie?lang=de) (Beispiel Package!)

2) ZIP entpacken und Ordner wie Package benennen

3) Ordner nach */usr/share/texlive/texmf-dist/tex/latex/* kopieren

4) Befehl ```sudo mktexlsr``` ausführen


## Weitere Quellen
* [wiki.ubuntuusers.de/LaTeX](https://wiki.ubuntuusers.de/LaTeX/)
