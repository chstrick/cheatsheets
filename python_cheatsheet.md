# Python Cheatsheet

- [Dokumentation](#dokumentation)
- [Installation und Setup (Linux)](#installation-und-setup-linux)
- [Kommandozeile](#kommandozeile)
  - [Python CLI starten](#python-cli-starten)
  - [Python-Datei ausführen](#python-datei-ausfhren)
  - [Python-Skripte direkt ausführbar machen](#python-skripte-direkt-ausführbar-machen)
- [Python-Pakete verwalten](#python-pakete-verwalten)
  - [Virtual Environments](#virtual-environments)
- [Grundlagen](#grundlagen)
  - [Module und Pakete](#module-und-pakete)
    - [Import von Modulen](#import-von-modulen)
  - [\_ (Unterstrich) in Python](#unterstrich-in-python)
  - [if \_\_name\_\_ == "\_\_main\_\_"](#if-name-main)
  - [Funktionen](#funktionen)
  - [OOP in Python](#oop-in-python)
    - [Klassen](#klassen)
    - [Abstract Base Classes](#abstract-base-classes)
    - [Protocols](#protocols)
    - [Interfaces](#interfaces)
    - [Dataclasses](#dataclasses)
  - [Decorators](#decorators)
  - [Exceptions](#exceptions)
  - [Generatoren und yield](#generatoren-und-yield)
  - [Context Managers](#context-managers)
  - [Typen, Type Hints und Type-Checking](#typen-type-hints-und-type-checking)
    - [Type Hints](#type-hints)
    - [Type-Checking](#type-checking)
- [Konventionen](#konventionen)
- [Testing](#testing)
- [Linting und Formatting](#linting-und-formatting)
- [Bau und Distribution von Python-Paketen](#bau-und-distribution-von-python-paketen)
- [Struktur eines Python-Projekts](#struktur-eines-python-projekts)
  - [Spezielle Dateien](#spezielle-dateien)
  - [Beispiele für ein Python-Projekt-Repository](#beispiele-für-ein-python-projekt-repository)
- [Logging](#logging)
- [Metaprogramming in Python](#metaprogramming-in-python)
- [Installierbares stand-alone Programm erzeugen](#installierbares-stand-alone-programm-erzeugen)
- [C/C++ Code in Python ausführen](#cc-code-in-python-ausführen)
- [Nützliche Third-Party-Pakete](#nützliche-third-party-pakete)
- [Weitere Quellen](#weitere-quellen)


## Dokumentation
* [python.org](https://www.python.org/) (Python-Webseite)
* [Python Docs](https://docs.python.org/) (Python-Dokumentation)
* [Python Standard Library](https://docs.python.org/3/library/) (eingebaute Module und Funktionen)
  * **[Python Module Index](https://docs.python.org/3/py-modindex.html) (Liste aller Build-in-Module)**
* [Python Language Reference](https://docs.python.org/3/reference/) (Syntax, Semantik, Datenmodell, etc. der Sprache Python)
* [Python Glossary](https://docs.python.org/3/glossary.html) (Glossar mit den wichtigsten Begriffen)
* [PEP 8 – Style Guide for Python Code](https://peps.python.org/pep-0008/)
* [Python Developer Tooling Handbook](https://pydevtools.com/handbook/) (Handbuch zu modernen Python-Tools)


## Installation und Setup (Linux)
```shell
sudo apt update # Paketquellen aktualisieren
sudo apt upgrade # Pakete aktualisieren

sudo apt install python3 python3-pip python3-venv # Python, pip und venv installieren
sudo apt install python-is-python # zusätzliches Paket, damit man 'python' statt 'python3' schreiben kann
python --version # prüfen, ob Python korrekt installiert wurde
python -m pip --version # prüfen, ob pip installiert wurde (Standard-Paketmanager)
python -m venv --version # prüfen, ob venv installiert wurde (Standard zur Verwaltung von Virtual Ebvironments)
python -m setuptools --version # prüfen, ob setuptools installiert wurde (Build-System für Pakete)
python -m wheel --version # prüfen, ob wheel installiert wurde (Standard zur Distribution von Paketen)
```


## Kommandozeile

### Python CLI starten
```shell
python
```

### Python-Datei ausführen
```shell
python file_name.py
```

### Python-Skripte direkt ausführbar machen
1) Erste Zeile im Skript: `#!/usr/bin/env python3` ([Shebang](https://de.wikipedia.org/wiki/Shebang))
2) Skript ausführbar machen (in Kommandozeile): `chmod +x my_script.py`
3) Skript ausführen (in Kommandozeile): `my_script.py`

## Python-Pakete verwalten

<details close>
<summary>pip</summary>

[pip](https://pip.pypa.io/en/stable/) ist der Standard-Paketmanager für Python.
```shell
# Paket installieren
python -m pip install package_name # (ohne Virtual Environment werden Pakete global installiert)
                                   # die Nutzung von VEs wird empfohlen

# mehrere Pakete über ein Requirements File installieren
# RF erzeugen
python -m pip freeze > requirements.txt
# RF zur Installation verwenden
python -m pip install -r requirements.txt

# Paket updaten
python -m pip install --upgrade package_name

# Paket deinstallieren
python -m pip uninstall package_name

# Liste aller installierten Pakete anzeigen
python -m pip list
```
* [Liste aller pip-Befehle](https://pip.pypa.io/en/stable/cli/)
* [pip Docs](https://pip.pypa.io/en/stable/user_guide/)
* [Installation von Paketen (Python Packaging User Guide)](https://packaging.python.org/en/latest/tutorials/installing-packages/)
* [*Development Mode*](https://docs.python.org/3/library/devmode.html)
 | [Entwickeln im *Development Mode*](https://packaging.python.org/en/latest/guides/distributing-packages-using-setuptools/#working-in-development-mode)
</details>

<details close>
<summary>uv</summary>

[uv](https://docs.astral.sh/uv/) ist ein modernes Tool für Paketmanagement, Virtual Environments und Management verschiedener Python-Versionen.
Zunächst muss *uv* installiert werden:
```shell
# Installation mit curl
curl -LsSf https://astral.sh/uv/install.sh | sh

# Installation mit wget
wget -qO- https://astral.sh/uv/install.sh | sh

# INstallation einer bestimmten Version
curl -LsSf https://astral.sh/uv/0.12.13/install.sh | sh
```
Danach kann *uv* verwendet werden:
```shell
# Projekt in Ordner hello-world anlegen
uv init hello-world
# erzeugt folgende Struktur:
# hello-world/
#    .git/
#    .venv/
#       bin/
#       lib/
#       pyvenv.cfg
#    .gitignore
#    .python-version
#    README.md
#    src/
#       hello_world/
#          __init__.py
#    pyproject.toml
#    uv.lock

# Modul in VE auführen
uv run hello-world

# Python-Script in VE auführen
uv run example.py
```
Weitere Infos und Befehle finden sich in der [Dokumentation](https://docs.astral.sh/uv/).
</details>

### Virtual Environments
[Virtual Environments](https://docs.python.org/3/glossary.html#term-virtual-environment) (VEs) isolieren projektspezifisch installierte Pakete, ggf. sogar Python-Versionen, von der systemweiten Python-Installation. Siehe auch [VEs im Python Packaging User Guide](https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/#creating-a-virtual-environment).

<details close>
<summary>venv</summary>

[venv](https://docs.python.org/3/library/venv.html) ist das Standard Build-in-Modul zur Verwaltung von VEs. Siehe auch das entsprechende [Tutorial](https://docs.python.org/3/tutorial/venv.html).
```shell
# Projektordner anlegen und hineinnavigieren
mkdir project_name
cd project_name

# VE erstellen (Name ist oft '.venv')
python -m venv .venv

# VE aktivieren
source .venv/bin/activate # '.venv' bzw. Name der VE steht vor der Prompt

# wenn VE aktiv, dann werden Pakete in diese VE installiert
python -m pip install package_name

# VE deaktivieren
deactivate # '.venv' vor der Prompt verschwindet
```
</details>

<details close>
<summary>pipenv</summary>

[pipenv](https://pipenv.pypa.io/en/stable/) ist ein Third-Party-Modul für VEs. Es vereinfacht einige Dinge im Vergleich zu venv.
```shell
# Paket pipenv global installieren
python -m pip install pipenv

# Projektordner anlegen und hineinnavigieren
mkdir project_name
cd project_name

# VE erstellen durch Starten der Pipenv Shell
pipenv shell
# oder VE erstellen durch Installation des ersten Pakets
python -m pipenv install package_name

# VE aktivieren
pipenv shell

# Paket in VE installieren
pipenv install package_name

# Paket in VE deinstallieren
pipenv uninstall package_name

# VE deaktivieren
deactivate

# Python-Datei ohne Aktivierung der Environment, aber in der Environment ausführen
pipenv run python file_name.py
```
</details>

<details close>
<summary>uv</summary>

Mit *uv* können auch VEs verwaltet werden. Siehe [Python-Pakete verwalten > uv](#python-pakete-verwalten).
</details>


## Grundlagen

### Module und Pakete
* Module
  * Ein [Modul](https://docs.python.org/3/glossary.html#term-module) ist ein Objekt, das als Organisationseinheit dient.
  * Ein Modul spannt einen [Namespace](https://docs.python.org/3/glossary.html#term-namespace) mit anderen Python-Objekten auf.
  * [Tutorial](https://docs.python.org/3/tutorial/modules.html)
* Pakete
  * Ein [Package](https://docs.python.org/3/glossary.html#term-package) ist eine Modul mit einer Datei *\_\_init\_\_.py* und ggf. weiteren Dateien, Submodulen und Subpackages.
  * Jedes Package ist eine Modul, aber nicht jedes Modul ist ein Package.
  * [Tutorial](https://docs.python.org/3/tutorial/modules.html#packages)

#### Import von Modulen
```python
# ganzes Modul importieren
import module
module.func1()

# Alias vergeben
import numpy as np
a = np.array([[1, 2, 3],
              [4, 5, 6]]) # Matrix

# nur bestimmte Teile importieren
from module import const0, func1
const0
func1() # ohne Referenz nutzbar (nicht empfohlen)
# analog können auch Aliase vergeben werden
from module import func1 as f1

# Absolute Imports: Subpaket/-modul/etc. durch explizite Referenz importieren
import pkg.subpkg1.mod
pkg.subpkg1.mod.subfunc()
# oder mit from
from pkg.subpkg1.mod import subfunc
subfunc()

# Relative Imports: Import von Subpaketen/-modulen/etc. innerhalb eines Hauptpakets
# Beispielstruktur:
# pkg
#   modA
#   subpkg1
#     modB (wir befinden uns hier)
#     modC
#   subpkg2
#     modD
from . import modC
from .modC import funcC as fC
from ..subpkg1 import modC # wie erstes Beispiel
from .. import modA
from ..modA import funcA
from ..subpkg2.modD import funcD

# Wildcard-Import: Alle öffentlichen Teile aus einem Paket importieren
from package import *
# ! Sollte nicht verwendet werden, wegen schlechter Performance, Nameskonflikten oder Import-Loops !
# In der Datei __init__.py eines Pakets kann eine Liste __all__ mit dem Namen der öffentlichen Teile definiert werden.
# und nur diese werden durch den Wildcard-Import importiert.
# Ist __all__ nicht definiert, werden alle öffentlichen Namen (die nicht mit einem _ beginnen) importiert.
```
Weitere hilfreiche Quellen:
* [YoutTube-Video zu Import-Loops](https://www.youtube.com/watch?v=UnKa_t-M_kM)

### \_ (Unterstrich) in Python
Der \_ (Unterstrich) wird in Python in verschiedenen Situationen verwendet:
* `_var` : Variable/Methode ist private (allg. nur Konvention, außer bei Wildcard-Import (import *))
* `var_` : Name der Variable/Methode ist schon an Schlüsselwort vergeben, z.B. `class_`
* `__var` : Name Mangling: D.h. der Python-Interpreter verändert Namen, so dass es bei Vererbung keine Konflikte in Subklassen gibt
* `__method__()` : Sogenannte *[dunder](https://docs.python.org/3/glossary.html#term-dunder) methods* sind [spezielle Python-Methoden](https://docs.python.org/3/glossary.html#term-special-method) wie z.B. `__init___()` ([Liste aller spezillen Methoden](https://docs.python.org/3/reference/datamodel.html#special-method-names))
* `_` : Einzelner Unterstrich
  * anzeigen, dass ein (Argument-, Rückgabe-)Wert ignoriert wird, oder nur temporär gebraucht wird
  * Wert des letzten Ausdrucks in der Python-Shell
* In Python wird konventionell der **Snake-Case** für Bezeichner verwendet, z.B. `hello_world`

### if \_\_name\_\_ == "\_\_main\_\_"
Der `if __name__ == "__main__"`-Block definiert einen [Entry-Point/Top-level code Environment](https://docs.python.org/3/library/__main__.html) in einem Python-Programm, [z.B. in einem Skript](https://docs.python.org/3/library/__main__.html#idiomatic-usage).
```python
# my_script.py

def my_func()
    # ...

# Konvention ist, die Definition einer zusätzlichen Methode main(), da
# sonst die Variablen, die im Block definiert werden, global verfügbar wären.
def main()
    # ...
    my_func()
    # ...
    return 0

if __name__ == "__main__":
    # Code in diesem Block wird ausgeführt, wenn Modul nicht über import geladen wird
    main()
```

### Funktionen
```python
# Funktion ohne Argumente
def hello_world():
    print("Hello World!")

# Funktion mit Argumenten
def hello(first_name, last_name):
    print("Hello " + first_name + " " + last_name + "!")

# Funktion mit Rückgabewert
def even(n):
    if n % 2 == 0:
        return True
    else
        return False

# Default-Werte für Argumente
def hello(name="World"):
    print("Hello " + name + "!")

# beliebig viele Argumente
def multiply(*args):
    result = 1
    for num in args:
        result *= num
    return result

print(multiply(2, 3, 4)) # 24

# Positions- und Keyword-Argumente
def myFunc(reqPosArg, kwa1="Hello", kwa2=1):
    # ...
# Aufruf z.B. wie folgt möglich:
myFunc("World")
myFunc("World", kwa1="Ciao")
myFunc(reqPosArg="World", kwa2=2)
myFunc(kwa1="Tschüss", reqPosArg="World")
# aber nicht so:
myFunc(kwa1="Ciao") # req pos arg missing
myFunc(reqPosArg="World", "Ciao") # non-kwarg after kwarg
myFunc("Bob", reqPosArg="World") # duplicate req pos arg
myFunc(kwa3=True) # unknown kwarg

# beliebig viele Keyword-Argumente
def introduce(**kwargs):
    details = []
    for k, v in kwargs.items():
        details.append(k + ": " + str(v))
    return ", ".join(details)

print(introduce(name="Bob", age=25, city="New York"))
# name: Bob, age: 25, city: New York

# Funktion ohne Implementierung
def empty_func():
    pass

# Funktionsannotationen (Type-Hints für Funktionen)
def add(a: int, b: int) -> int:
    return a + b

# Lambda-Funktionen (anonyme Funktionen in und mit einem Ausdruck)
f = lambda x: x + 1
x = f(3) # x = 4
```
* [Funktionen (Tutorial)](https://docs.python.org/3/tutorial/controlflow.html#defining-functions)
* [Arten von Argumenten (Tutorial)](https://docs.python.org/3/tutorial/controlflow.html#more-on-defining-functions)
* [lambda (Tutorial)](https://docs.python.org/3/tutorial/controlflow.html#lambda-expressions)
* [Functional Programming HOWTO](https://docs.python.org/3/howto/functional.html)
* [Tutorial zu FP in Python (RealPython)](https://realpython.com/python-functional-programming/)
* [Build-in-Module für FP](https://docs.python.org/3/library/functional.html)

### OOP in Python

#### Klassen
* [Python](https://de.wikipedia.org/wiki/Python_(Programmiersprache)) ist auch eine objektorientierte Programmiersprache. In Python können eigene [Klassen](https://docs.python.org/3/tutorial/classes.html) wie folgt erzeugt werden:
```python
class Point():
    def __init__(self, x, y):
        # self ist die Referenz auf das Objekt selbst
        # self ist immer der erste Parameter einer Methode
        self.x = x # public
        self._y = y # private

    def move(self, a, b):
        self.x += a
        self._y += b

    def __repr__(self): # __repr__ ist die "toString"-Methode in Python
        return f"({self.x}, {self._y})"
```
* Initialisierung durch die Klassenmethode [`__init__(self, ...)`](https://docs.python.org/3/reference/datamodel.html#object.__init__) (vgl. Konstruktor)
* Objekterzeugung und Speicherplatzzuweisung durch die Klassenmethode [`__new__(cls, *args, **kwargs)`](https://docs.python.org/3/reference/datamodel.html#object.__new__), wird i.d.R. nicht überschrieben (siehe Abschnitt [Metaprogramming in Python](#metaprogramming-in-python))
* Eigene Klassen können [**Python-Operatoren überladen**](https://realpython.com/operator-function-overloading/), indem sie die entsprechende spezielle Methode für den Operator überschreiben:
```python
# Operator len() für die Länge (z.B. von Strings) wird überladen,
# indem __len__() überschrieben wird:
class Order:
    def __init__(self, cart, customerNr):
        self.cart = list(cart)
        self.customerNr = customerNr

    def __len__(self):
        return len(self.cart)

# Anwendung
order = Order(['banana', 'apple', 'mango'], '4711')

len(order) # liefert 3
```

#### Abstract Base Classes
* [Abstract Base Classes (ABCs)](https://docs.python.org/3/glossary.html#term-abstract-base-class) sind das Gegenstück zum [Duck-Typing](https://docs.python.org/3/glossary.html#term-duck-typing).
* Klassen im Allgemeinen implementieren [Nominelle Vererbung](https://typing.python.org/en/latest/reference/protocols.html).
* Abstrakte Klassen können mithilfe des Moduls [abc](https://docs.python.org/3/library/abc.html) erstellt werden:
```python
from abc import ABC, ABCMeta, abstractmethod # Modul abc muss importiert werden

class Animal(ABC): # abstrakte Klasse erbt von Klasse ABC
    @abstractmethod # Decorator definiert eine abstrakte Methode
    def feed(self):
        pass

# oder
class Animal(metaclass=ABCMeta): # abstrakte Klasse hat ABCMeta als Metaklasse
    pass

class Dog(Animal): # konkrete Klasse erbt von abstrakter Klasse
    def __init__(self):
        super.

    def feed(self): # abstrakte Methoden müssen implementiert werden
        return True
```

#### Protocols
* Protocols implementieren im Gegensatz zu ABCs, die [Strukturelle Vererbung](https://typing.python.org/en/latest/reference/protocols.html) (statisches Äquivalent zu Duck-Typing).
```python
# TODO(Beispiel)
```

#### Interfaces
In Python gibt es keine Interfaces, aber [das Konzept lässt sich auf verschiedene Art und Weise umsetzen](https://realpython.com/python-interface/).

#### Dataclasses
* *Dataclasses* sind ...
* Dataclasses können mithilfe des Moduls [dataclasses](https://docs.python.org/3/library/dataclasses.html) erstellt werden:
```python
from dataclasses import dataclass # Modul dataclasses muss importiert werden

@dataclass
class InventoryItem:
    name: str
    unit_price: float
    quantity_on_hand: int = 0
    # Methode __init__() wird generiert
```

### Decorators
TODO(Decorators erläutern)
* Ein [Decorator](https://docs.python.org/3/glossary.html#term-decorator) ist ...
```python
# Decorator für Funktionen
# TODO(Beispiel)
def myDec():
    pass

@myDec
def add(a, b):
    return a + b

# Decorator mit Argumenten
# TODO(Beispiel)

# Decorator für Klassen
# TODO(Beispiel)
```
* [Conditional Decorator](https://stackoverflow.com/questions/10724854/how-to-do-a-conditional-decorator-in-python/10724898#10724898)
* Klasse als Decorator für Funktion oder Methode ...

### Exceptions
* Python verfolgt den Ansatz [EAFP](https://docs.python.org/3/glossary.html#term-EAFP) (Easier to ask for forgiveness than permission), d.h. es wird darauf vertraut, dass übergebene Wert korrekt sind, sonst wird eine Exception geworfen.
  * Viele andere Sprachen verfolgen eher den Ansatz [LBYL](https://docs.python.org/3/glossary.html#term-LBYL) (Look before you leap), d.h. es wird explizit auf Vorbedingungen geprüft, bevor Werte verwendet werden.
* Behandlung von Exceptions funktioniert in Python mit
  * [`try`](https://docs.python.org/3/reference/compound_stmts.html#try),
  * [`except`](https://docs.python.org/3/reference/compound_stmts.html#except-clause) und
  * ggf. [`finally`](https://docs.python.org/3/reference/compound_stmts.html#finally)
```python
# Exceptions fangen und behandeln
# TODO(Beispiel)

# Eigene Exceptions erstellen
# TODO(Beispiel)
```
* [Liste aller Build-in-Exceptions](https://docs.python.org/3/library/exceptions.html)
* [Tutorial zu Exceptions in Python (RealPython)](https://realpython.com/python-exceptions/)

### Generatoren und yield
TODO(Generatoren und yield erläutern)
* [Generatoren](https://docs.python.org/3/glossary.html#term-generator) sind [Funktionen](https://docs.python.org/3/glossary.html#term-generator-function) oder [Iteratoren](https://docs.python.org/3/glossary.html#term-generator-iterator), die ...
* [`yield`-Ausdrücke](https://docs.python.org/3/reference/expressions.html#yieldexpr) sind ...
```python
# TODO(Beispiel)
```

### Context Managers
TODO(Context Manager erläutern)
* [Context Managers](https://docs.python.org/3/glossary.html#term-context-manager) sind ...
* [Referenz *Context Managers*](https://docs.python.org/3/reference/datamodel.html#context-managers)
* [Referenz `with`](https://docs.python.org/3/reference/compound_stmts.html#with)
* [Tutorial zu Context Managers (RealPython)](https://realpython.com/python-with-statement/)
* [YouTube-Video zu Context Managers zum Lesen von Dateien](https://www.youtube.com/watch?v=-aKFBoZpiqA&list=PL-osiE80TeTt2d9bfVyTiXJA-UTHn6WwU&index=50)

### Typen, Type Hints und Type-Checking
* Python ist eine dynamisch typisierte Sprache, d.h. .
  * [Typsystem von Python](https://typing.python.org/en/latest/spec/)
  * Python verfolgt [Duck Typing](https://docs.python.org/3/glossary.html#term-duck-typing)
  * Python verfolgt [Gradual Typing](https://jsiek.github.io/home/WhatIsGradualTyping.html)
* [Liste aller Build-in-Typen](https://docs.python.org/3/library/stdtypes.html)
* `None`: Representiert fehlende oder optionale Werte
* `type()`: Typ eines Objektes prüfen: `type(3)  # <class 'int'>`
* `isinstance()`: Auf einen bestimmten Typ prüfen: `isinstance(3.14, float)  # True`
* `issubclass()`: Prüft, ob eine Klasse eine Subclasse ist: `issubclass(int, object)  # True - everything is an object`

#### Type Hints
* [Type Hints](https://docs.python.org/3/glossary.html#term-type-hint) sind optionale Annotationen, die den Typ von Variablen/Parametern/Funktionen/Methoden (Rückgabewert) angeben.
* [Spezifikation](https://typing.python.org/en/latest/spec/annotations.html)
* Für Type Hints können die [Build-in-Typen](https://docs.python.org/3/library/stdtypes.html) verwendet werden.
  ```python
  def add(a: int, b: int) -> int:
      return a + b
  ```
* Das Modul [typing](https://docs.python.org/3/library/typing.html) enthält weitere (komplexere) Typen, wie `List` oder `Set`.
* Ein [Typ-Alias](https://docs.python.org/3/glossary.html#term-type-alias) ist ein Synonym für einen (komplexeren) Typ (z.B. für die Vereinfachung von Type Hints). Ein Typ-Alias kann wie folgt [erzeugt](https://typing.python.org/en/latest/spec/aliases.html) werden:
  ```python
  # durch einfach Zuweisung
  Url = str

  # durch Nutzung von typing.TypeAlias
  from typing import TypeAlias

  Url: TypeAlias = str

  # durch ein type-Statement (Python >= 3.12)
  type Point = tuple(float, float)
  ```

#### Type-Checking
* Typannotionen können von externen [statischen Type-Checkern](https://docs.python.org/3/glossary.html#term-static-type-checker) zur Typanalyse genutzt werden (z.B. um Fehler früher zu erkennen).
* Beispiele für Type-Checker:
  * [mypy](https://mypy-lang.org/) (Standard)
  * [ty](https://docs.astral.sh/ty/) (empfehlenswert)
  * [Pyrefly](https://pyrefly.org/)
  * [pytype](https://google.github.io/pytype/)
  * [pyright](https://github.com/microsoft/pyright)
* [Static Typing with Python](https://typing.python.org/en/latest/) (Übersichtsseite)
* [Tutorial zu Type-Checking in Python (RealPython)](https://realpython.com/python-type-checking/)


## Konventionen
```python
# Snake-Case für Bezeichner
my_text = "Hello world!" # Variable

def hello_world(): # Funktion
    print(my_text)

# TODO(weitere Konventionen hinzufügen)
```
* [Zen of Python](https://docs.python.org/3/glossary.html#term-Zen-of-Python)
* [Best Practices (RealPython)](https://realpython.com/ref/best-practices/)
* [Artikelsammlung zu Pythonic Code (RealPython)](https://realpython.com/learning-paths/writing-pythonic-code/)


## Testing
* Test-Framworks:
  * [unittest](https://docs.python.org/3/library/unittest.html) (Build-in-Modul)
  * [pytest](https://docs.pytest.org/en/stable/) (empfehlenswert, [unterstützt auch unittest-Test-Cases](https://docs.pytest.org/en/stable/how-to/unittest.html))
    * [Konfiguration von pytest](https://docs.pytest.org/en/stable/reference/customize.html)
* [Tutorial zu Testing in Python (RealPython)](https://realpython.com/python-testing/)
* [Debugging und Profiling (Standard Library)](https://docs.python.org/3/library/debug.html)
* [Performance measurement (Tutorial)](https://docs.python.org/3/tutorial/stdlib.html#performance-measurement)


## Linting und Formatting
* *Linting* ist der Prozess der statischen Code-Analyse bei der verschiedene statische Eigenschaften geprüft werden können, z.B. die Einhaltung von [Stype Guidelines](https://peps.python.org/pep-0008/).
* *Formatting* ist der Prozess Python-Code automatisch so zu formattieren, dass dieser den Style Guidelines entspricht.
* Linter (L) und Formatter (F):
  * [Pylint](https://pylint.readthedocs.io/en/stable/) (L)
  * [Black](https://black.readthedocs.io/en/stable/) (F)
  * [autopep8](https://github.com/hhatto/autopep8) (F)
  * [Flake8](https://github.com/PyCQA/flake8) (L)
  * [bandit](https://bandit.readthedocs.io/en/latest/) (L, insb. Security Issues)
  * [Ruff](https://docs.astral.sh/ruff/) (L & F, empfehlenswert)

Weitere hilfreiche Quellen:
* [Übersicht zu statischer Code-Analyse (Blog-Beitrag)](https://luminousmen.com/post/python-static-analysis-tools)
* [Artikel zu Code-Qualität im Allgemeinen (RealPython)](https://realpython.com/python-code-quality/)
* [Liste statischer Analyse-Tools für Python (und andere Sprachen)](https://analysis-tools.dev/tools?languages=python)


## Bau und Distribution von Python-Paketen
💡 Bevor man sich mit diesem Thema auseinandersetzt, lohnt es sich auch den Abschnitt [Struktur eines Python-Projekts](#struktur-eines-python-projekts) anzuschauen.
* Anleitung im [Python Packaging User Guide](https://packaging.python.org/) (Standard)
* Anleitung in der [Dokumentation des Build-Tools *setuptools*](https://setuptools.pypa.io/en/stable/setuptools.html)


## Struktur eines Python-Projekts

<details close>
<summary>Projekt mit nur einer Skript-Datei</summary>

```
helloworld/
  .gitignore
  helloworld.py
  LICENSE
  README.md
  requirements.txt
  setup.py
  tests.py
```
</details>

<details close>
<summary>Projekt mit einem installierbaren Package</summary>

```
sample/
  docs/
  sample/
    __init__.py
    simple.py
  tests/
    simple_tests.py
    helpers_test.py
  .gitignore
  LICENSE
  README.md
  pytest.toml
  requirements.txt
  setup.cfg
  setup.py
```
</details>

<details close>
<summary>Projekt mit einem Package und mehreren Subpackages</summary>

```
sample/
  data/
    input.csv
    output.xlsx
  docs/
    hello.md
    world.jpeg
  sample/
    __init__.py
    runner.py
    hello/
      __init__.py
    world/
      __init__.py
  tests/
  .gitignore
  LICENSE
  MANIFEST.in
  README.md
  Makefile
  pyproject.toml
  pytest.toml
  requirements.txt
  setup.cfg
  setup.py
```
</details>

<details close>
<summary>Projekt mit einem Web-Framework</summary>

Frameworks wie [Django](https://www.djangoproject.com/) erzeugen ihre eigene Projektstruktur.
</details>

### Spezielle Dateien

<details close>
<summary>__init__.py</summary>

* Enthält ein Ordner die Datei *\_\_init\_\_.py*, wird daraus ein [Python-Paket](https://docs.python.org/3/glossary.html#term-regular-package).
* Beim [Laden eines Pakets](https://docs.python.org/3/reference/import.html#regular-packages) wird der Code in der Datei *\_\_init\_\_.py* ausgeführt.
* Oft ist die Datei einfach leer.
</details>

<details close>
<summary>__main__.py</summary>

Der Code in der Datei *[\_\_main\_\_.py](https://docs.python.org/3/library/__main__.html#main-py-in-python-packages)* wird ausgeführt, wenn das Modul direkt mit `python -m module` ausgeführt wird.
</details>

<details close>
<summary>requirements.txt</summary>

Die Datei *requirements.txt* enthält eine Liste von Paketen, die mit `pip install` installiert werden sollen (Abhängigkeiten des Projekts).
* [Guide](https://pip.pypa.io/en/stable/user_guide/#requirements-files)
* [Spezifikation](https://pip.pypa.io/en/stable/reference/requirements-file-format/)
* ℹ️ Die Datei ist ggf. nicht notwendig, falls *pyproject.toml* und/oder *setup.cfg* verwendet wird/werden.
</details>

<details close>
<summary>pyproject.toml</summary>

Die Datei *pyproject.toml* ...
* [Guide](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/)
* [Spezifikation](https://packaging.python.org/en/latest/specifications/pyproject-toml/)
* ℹ️ Weitere Infos siehe [Bau und Distribution von Python-Paketen](#bau-und-distribution-von-python-paketen).
</details>

<details close>
<summary>pytest.toml/.ini</summary>

* *pytest.toml/.ini* ist die Konfigurationsdatei für das Test-Framework *pytest*.
* ℹ️ Weitere Infos siehe [Testing](#testing).
</details>

<details close>
<summary>setup.cfg</summary>

* *setup.cfg* ist die deklarative Variante zur Konfiguration des Build-Tools *setuptools*.
* vereint die Konfiguration verschiedener Tools (z.B. Linter, Formatter, ...)
* [Guide *setup.cfg*](https://setuptools.pypa.io/en/stable/userguide/declarative_config.html)
* [Referenz der Keywords](https://setuptools.pypa.io/en/stable/references/keywords.html)
* ℹ️ *setuptools* kann auch [über die Datei *pyproject.toml* konfiguriert werden](https://setuptools.pypa.io/en/stable/userguide/declarative_config.html).
* ℹ️ Weitere Infos siehe [Bau und Distribution von Python-Paketen](#bau-und-distribution-von-python-paketen).
</details>

<details close>
<summary>setup.py</summary>

* *setup.py* ist die programmatische Variante zur Konfiguration des Build-Tools *setuptools*.
* **💡 Es wird jedoch empfohlen eher eine Datei *setup.cfg* zu verwenden!**
* ❗ Falls die Konfiguration von *setuptools* in der Datei *pyproject.toml* erfolgt, sollte folgende *setup.py* vorhanden sein.
  ```python
  # minimale setup.py
  from setuptools import setup

  setup()
  ```
</details>

<details close>
<summary>MANIFEST.in</summary>

* *MANIFEST.in* enthält Befehle für das Build-Tool *setuptools*, welche Dateien in *sdist* inkludiert werden und welche nicht.
* [Spezifikation](https://setuptools.pypa.io/en/stable/userguide/miscellaneous.html)
```ini
# Beispiel für MANIFEST.in

include README.md LICENSE

global-exclude *~ *.py[cod] *.so
# -> matches file names (regardless of directory)
```
</details>

<details close>
<summary>__pycache__ (Ordner)</summary>

* Wenn ein Python-Programm ausgeführt wird, erzeugt der Python-Interpreter Byte-Code.
* Der Byte-Code wird im Ordner *\_\_pycache\_\_* gespeichert (Vereifachung).
* Der Ordner *\_\_pycache\_\_* kann (quasi immer) ignoriert werden (siehe *.gitignore*).
</details>

<details close>
<summary>Makefile</summary>

* Im *Makefile* können Aliase für bestimmte Befehle/Prozesse (z.B. build, test) definiert werden (nicht nur für Python-Projekte).
* [Spezifikation](https://www.gnu.org/software/make/manual/make.html)
* [Beispiel für Makefile für Python-Projekte](https://martinheinz.dev/blog/14)
</details>

<details close>
<summary>Beispiel für .gitignore für Python-Projekt</summary>

```gitignore
# general things
*~

# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
.Python
env/
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
*.egg-info/
.installed.cfg
*.egg

# Virtual environments
# venv
venv/
.venv/
ENV/
# pyenv
.python-version

# Testing / coverage reports
htmlcov/
.tox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*,cover
.hypothesis/
.nox

# PyBuilder
target/

# IPython Notebook
.ipynb_checkpoints

# ...
```
</details>

### Beispiele für ein Python-Projekt-Repository
* [Cookiecutter PyPackage](https://github.com/audreyfeldroy/cookiecutter-pypackage)
* [Beispielstruktur (Blog-Beitrag)](https://martinheinz.dev/blog/14)


## Logging
* [Logging HOWTO](https://docs.python.org/3/howto/logging.html)
* [Logging (Tutorial)](https://docs.python.org/3/tutorial/stdlib2.html#logging)
* [Logging Cookbook](https://docs.python.org/3/howto/logging-cookbook.html)


## Metaprogramming in Python
* Python ermöglicht [Metaprogramming](https://en.wikipedia.org/wiki/Metaprogramming), d.h. Programme können den Quellcode anderer Programme als Eingabe empfangen und verarbeiten, z.B. lesen, analysieren, transformieren oder generieren.
* [Python Language Services](https://docs.python.org/3/library/language.html) (Module für Metaprogramming)
* [Artikel zu Objekterzeugung und Metaclasses](https://www.honeybadger.io/blog/python-instantiation-metaclass/)
* [YouTube-Video zu Python-Metaclasses](https://www.youtube.com/watch?v=NzzKTWiaN68)


## Installierbares stand-alone Programm erzeugen
* Ein Python-Skript kann zu einem installierbaren stand-alone Programm gemacht werden.
* Mehr Infos [hier](https://docs.python.org/3/faq/programming.html#how-can-i-create-a-stand-alone-binary-from-a-python-script).


## C/C++ Code in Python ausführen
* In Python ist es möglich C/C++ Code auszuführen (einfaches Beispiel):
    * Eine Funktion in C schreiben:
        ```c
        int isPowerOf2(int num)
        {
            if (num == 0)
                return 0;
            else
                // if number is power of 2, return 1 else return 0
                return ((num & (num - 1)) == 0 ? 1 : 0) ;

        }
        ```
    * C Code compilieren und Shared-Library erzeugen:
        ```shell
        cc -fPIC -shared -o libfun.so function.c
        ```
    * In Python kann die Funktion aufgerufen werden:
        ```python
        import ctypes # Modul ctypes importieren

        # Load C library libfun to the python file
        fun = ctypes.CDLL("libfun.so") # or full path to file

        # Specify the matching C type of argument(s) using ctypes
        fun.isPowerOf2.argtypes = [ctypes.c_int]

        # Call the function
        returnVale = fun.isPowerOf2(32)

        print(returnValue) # 1
        ```
* [ctypes](https://docs.python.org/3/library/ctypes.html) (Build-in-Modul zum Laden von C/C++ Code)
* Komplexeres Beispiel in folgenden Artikeln: [Part 1](https://www.geeksforgeeks.org/python/using-c-codes-in-python-set-1/), [Part 2](https://www.geeksforgeeks.org/python/using-c-codes-in-python-set-2/)


## Nützliche Third-Party-Pakete

<details close>
<summary>(Hier klicken)</summary>

* [SciPy](https://www.scipy.org/) (Wissenschaftliches Arbeiten)
* [scikit-learn](https://scikit-learn.org/stable/) (Maschinelles Lernen)
* [matplotlib](https://matplotlib.org/stable/) (Mathematische Visualisierung)
* [OpenCV](https://pypi.org/project/opencv-python/) (Open Source Computer Vision Library)
* [pypdf](https://github.com/py-pdf/pypdf) (PDFs erzeugen und bearbeiten)
* [Typer](https://typer.tiangolo.com/) (CLI-Programme bauen)
* [numba](https://github.com/numba/numba) (JIT-Compiler für nummerische Funktionen)
* [Uberi/speech_recognition](https://github.com/Uberi/speech_recognition) (Speech Recognition Library)
</details>


## Weitere Quellen

<details close>
<summary>(Hier klicken)</summary>

* [wiki.ubuntuusers.de/Python](https://wiki.ubuntuusers.de/Python/)

Tutorials
* [Python HOWTOs](https://docs.python.org/3/howto/)
* [The Hitchhiker’s Guide to Python](https://docs.python-guide.org/) (Tipps für die tägliche Arbeit mit Python, etwas veraltet)
* [Python Tutorials (RealPython)](https://realpython.com/) (anschauliche Python-Tutorials)
* [PYthon Cheat Sheet (RealPython)](https://realpython.com/cheatsheets/python/)
* [Full Stack Python](https://www.fullstackpython.com/) (Open-Source Online-Buch zu Full-Stack-Entwicklung mit Python)
* [YouTube-Video zu Modulen, Paketen und Namespaces](https://www.youtube.com/watch?v=0oTh1CXRaQ0)

Architektur
* [GoF Design Patterns in Python](https://python-patterns.guide/)
* [Python Patterns, Recipes, Idioms](https://python-3-patterns-idioms-test.readthedocs.io/en/latest/index.html) (Open-Source Buch zu Mustern etc. in Python)
* [SOLID principles (RealPython)](https://realpython.com/solid-principles-python/)
* [Clean Architecture in Python](https://rhodesmill.org/brandon/slides/2014-07-pyohio/clean-architecture/)

Notebooks
* [Jupyter Notebooks](https://jupyter.org/) (interaktive Programmierumgebung (nicht nur für Python))
* [Google Colab](https://colab.research.google.com/) (Cloud-basierte Notebooks)

Coole Sachen
* [Lambda-Kalkül in Python](https://www.youtube.com/watch?v=pkCLMl0e_0k)
* [Turingmaschine in Python](https://www.python-kurs.eu/turingmaschine.php)
* [Python Class Performance verbessern (YouTube)](https://www.youtube.com/watch?v=Fot3_9eDmOs)
* [Laziness in Python (YouTube)](https://www.youtube.com/watch?v=5jwV3zxXc8E)
* [Interessante Python-Kurse](https://www.dabeaz.com/)
</details>
