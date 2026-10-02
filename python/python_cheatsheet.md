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
    - [Typsystem](#typsystem)
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
    * [Python Glossary](https://docs.python.org/3/glossary.html) (Glossar mit den wichtigsten Begriffen)
* [Python Standard Library](https://docs.python.org/3/library/) (eingebaute Module und Funktionen)
    * [Python Module Index](https://docs.python.org/3/py-modindex.html) (Liste aller Build-in-Module)
* [Python Language Reference](https://docs.python.org/3/reference/) (Syntax, Semantik, Datenmodell, etc. der Sprache Python)
* [PEP 8 - Style Guide for Python Code](https://peps.python.org/pep-0008/)
* [Python Developer Tooling Handbook](https://pydevtools.com/handbook/) (Handbuch zu modernen Python-Tools)
* [Scientific Python](https://scientific-python.org/) (Webseite zu Python in der Wissenschaft)


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
def func(reqPosArg, kwa1="Hello", kwa2=1):
    # ...
# Aufruf z.B. wie folgt möglich:
func("World")
func("World", kwa1="Ciao")
func(reqPosArg="World", kwa2=2)
func(kwa1="Tschüss", reqPosArg="World")
# aber nicht so:
func(kwa1="Ciao") # req pos arg missing
func(reqPosArg="World", "Ciao") # non-kwarg after kwarg
func("Bob", reqPosArg="World") # duplicate req pos arg
func(kwa3=True) # unknown kwarg

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
* [lambda Ausdrücke (Tutorial)](https://docs.python.org/3/tutorial/controlflow.html#lambda-expressions)
* [Functional Programming HOWTO](https://docs.python.org/3/howto/functional.html)
* [Tutorial zu FP in Python (RealPython)](https://realpython.com/python-functional-programming/)
* [Build-in-Module für FP](https://docs.python.org/3/library/functional.html)

### OOP in Python

#### Klassen
* [Python](https://de.wikipedia.org/wiki/Python_(Programmiersprache)) ist auch eine objektorientierte Programmiersprache. In Python können eigene [Klassen](https://docs.python.org/3/tutorial/classes.html) wie folgt erzeugt werden:
```python
class Point:
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
* Klassen bilden Typen, die [Nominelle Vererbung](https://typing.python.org/en/latest/reference/protocols.html) unterstützen.
* Abstrakte Klassen können mithilfe des Moduls [abc](https://docs.python.org/3/library/abc.html) erstellt werden:
```python
from abc import ABC, ABCMeta, abstractmethod # Modul abc muss importiert werden

class Shape(ABC): # abstrakte Klasse erbt von Klasse ABC
# oder: Shape(metaclass=ABCMeta), abstrakte Klasse hat ABCMeta als Metaklasse
    @abstractmethod # Decorator definiert eine abstrakte Methode
    def area(self):
        pass

class Rectangle(Shape): # konkrete Klasse erbt von abstrakter Klasse
    def __init__(self, length, width):
        self.length = length
        self.width = width

    def area(self): # abstrakte Methoden müssen implementiert werden
        return self.length * self.width

    def perimeter(self):
        return 2 * self.length + 2 * self.width

class Square(Rectangle):
    def __init__(self, length):
        super().__init__(length, length)

class Cube(Square):
    def surface_area(self):
        face_area = super().area()
        return face_area * 6

    def volume(self):
        face_area = super().area()
        return face_area * self.length
```

#### Protocols
* Protocols bilden Typen, die [Strukturelle Vererbung](https://typing.python.org/en/latest/reference/protocols.html) unterstützen (statisches Äquivalent zu Duck-Typing).
* Protocols können mithilfe des Moduls [typing](https://docs.python.org/3/library/typing.html) erstellt werden:
```python
from typing import Protocol
from abc import abstractmethod

class Template(Protocol):
    name: str        # This is a protocol member
    value: int = 0   # This is a protocol member (with default)

    def first(self) -> int: # This is a protocol member
        return 42

    @abstractmethod
    def second(self) -> int: # Method without a default implementation
        raise NotImplementedError

class Concrete: # implicit structural subtype, no base 'Template'
    def __init__(self, name: str, value: int) -> None:
        self.name = name
        self.value = value

    def first(self) -> int: # Concrete must implement this method
        return self.value   # because default implementation can not be used

    def second(self) -> int: # Concrete must implement this abstract method
        return 44

var: Template = Concrete('value', 42)  # OK
print(var.first()) # 42
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
* Ein [Decorator](https://docs.python.org/3/glossary.html#term-decorator) ist eine Funktion oder ein [Callable](https://docs.python.org/3/glossary.html#term-callable), die/das eine Funktion oder Klasse wrappt und so transformiert. Beispiele sind [@classmethod](https://docs.python.org/3/builtins/functions.html#classmethod), [@staticmethod](https://docs.python.org/3/builtins/functions.html#staticmethod) oder [@dataclass](https://docs.python.org/3/library/dataclasses.html#dataclasses.dataclass).
```python
import functools # Modul functools importieren

# Decorator für Funktionen
def do_twice(func): # Decorator-Funktion nimmt Funktion als Argument entgegen
    @functools.wraps(func) # Speichert Informationen über func (z.B. für Hilfe oder Debugging)
    def wrapper(): # Innere Wrapper-Funktion im Decorator
        func() # Funktion wird zweimal aufgerufen
        func()
    return wrapper # Wrapper-Funktion wird zurückgegeben

@do_twice # Anwendung des Decorators
def say_hello():
    print("Hello")
# Decorators können auch folgendermaßen angewendet werden:
# say_hello = do_twice(say_hello)

say_hello()
# Hello
# Hello

# Decorator für Funktion mit Argumenten
def do_twice(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        func(*args, **kwargs)
        func(*args, **kwargs)
    return wrapper

@do_twice
def greet(name): # Funktion hat argument
    print(f"Hello {name}")

greet("World")
# Hello World
# Hello World

# Decorator mit Argumenten
def repeat(num_times=4): # es gibt noch eine zusätzliche Schicht, die die Argumente entgegennimmt
    def dec_repeat(func): # (dec_repeat entspricht der Decorator-Funktion ohne Argumente, s. o.)
        @functools.wraps(func)
        def wrapper(*args, **kwargs): # (Closure mit num_times entsteht)
            for _ in range(num_times): func(*args, **kwargs) # x wird in Wrapper-Funktion angewendet
        return wrapper
    return dec_repeat

@repeat(num_times=5)
def greet(name):
    print(f"Hello {name}")

# Klassen als Decorator
class repeat:
    def __init__(self, num_times=4):
        self.num_times = num_times

    def __call__(self, func):
        def wrapper(*args, **kwargs):
            for _ in range(self.num_times): func(*args, **kwargs)
        return wrapper

# Decorator für Klassen - Beispiel 1
from dataclasses import dataclass

@dataclass
class Point:
    x: int
    y: int

# Decorator für Klassen - Beispiel 2
def singleton(cls):
    """Make a class a Singleton class (only one instance)"""
    @functools.wraps(cls)
    def wrapper_singleton(*args, **kwargs):
        if wrapper_singleton.instance is None:
            wrapper_singleton.instance = cls(*args, **kwargs)
        return wrapper_singleton.instance
    wrapper_singleton.instance = None
    return wrapper_singleton

@singleton
class TheOne:
    pass

first_one = TheOne()
another_one = TheOne()
print(first_one is another_one) # True

# Verschachtelte Decorators
@debug # wird als erstes ausgeführt
@do_twice # wird quasi "in" @debug ausgeführt
def greet(name):
    print(f"Hello {name}")

greet("World")
# Calling greet('World')
# Hello World
# Hello World
# greet() returned None

# Bedingte Decorators (Decorator wird nur angewandt, wenn Bedingung erfüllt ist)
def conditional_decorator(decorator, condition):
    def wrapper(func):
        # return the function unchanged, not decorated
        return decorator(func) if condition else func
    return wrapper

# Anwendungsbeispiel:
DO_TIME_ANALYSIS = True

@conditional_decorator(timeit, DO_TIME_ANALYSIS)
def myFunc()
    # ...
```

### Exceptions
* Python verfolgt den Ansatz [EAFP](https://docs.python.org/3/glossary.html#term-EAFP) (Easier to ask for forgiveness than permission), d.h. es wird darauf vertraut, dass übergebene Werte korrekt sind, sonst wird eine [Exception](https://docs.python.org/3/tutorial/errors.html) geworfen.
    * Viele andere Sprachen verfolgen eher den Ansatz [LBYL](https://docs.python.org/3/glossary.html#term-LBYL) (Look before you leap), d.h. es wird explizit auf Vorbedingungen geprüft, bevor Werte verwendet werden.
* [Behandlung von Exceptions](https://docs.python.org/3/tutorial/errors.html#handling-exceptions) mit `try`, `except` und ggf. `else` und `finally`:
    ```python
    def this_fails():
        x = 1/0 # Division durch 0
        return x

    try:
        this_fails()
    except ZeroDivisionError as err:
        # hier meist Logging
        print('Handling run-time error:', err)
    ```
* [Werfen von Exceptions](https://docs.python.org/3/tutorial/errors.html#raising-exceptions) mit [`raise`]:
    ```python
    class My_Class:
        @abstractmethod # abstrakte Methode in einer Klasse
        def my_func(x):
            raise NotImplementedError
    ```
* [Eigene Exceptions erstellen]((https://docs.python.org/3/tutorial/errors.html#raising-exceptions)):
    ```python
    class MyError(BaseException): # Namenskonvention: ...Error
        pass
    ```
* [Liste aller Build-in-Exceptions](https://docs.python.org/3/library/exceptions.html)

### Generatoren und yield
* Ein [Generator](https://docs.python.org/3/glossary.html#term-generator) eine Funktion, die durch ein [`yield`-Ausdruck](https://docs.python.org/3/reference/expressions.html#yieldexpr)/[-Statement](https://docs.python.org/3/reference/simple_stmts.html#yield) erzeugt wurde, d.h. Funktion enthält `yield`-Ausdruck.
Die Funktion gibt ein Iterator-Objekt, den Generator, zurück. Diese steuert die Ausführung der Funktion, die zeitlich verschoben wird (suspending).
```python
def infinite_sequence():
    num = 0
    while True:
        yield num
        num += 1

gen = infinite_sequence()
next(gen) # Berechnung der ersten Zahl: 0
next(gen) # Berechnung der nächsten Zahl: 1
next(gen) # Berechnung der nächsten Zahl: 2
# could be done forever
```
* [Nette Erklärung ;)](https://www.youtube.com/watch?v=5jwV3zxXc8E)

### Context Managers
* Ein [Context Manager](https://docs.python.org/3/glossary.html#term-context-manager) ist ein Objekt, das das *Context Management Protocol* in einem [`with`](https://docs.python.org/3/reference/compound_stmts.html#with)-Statement implementiert, wodurch bestimmte Garantien gegeben sind.
* Ein bekanntes Anwendungsbeispiel ist das Öffnen und Lesen von Dateien und dem garantierten Schließen am Ende des Vorgangs. [Weitere Beispiele](https://peps.python.org/pep-0343/#examples)

### Typsystem
* Python ist eine [dynamisch typisierte Sprache](https://typing.python.org/en/latest/spec/concepts.html#static-dynamic-and-gradual-typing), d.h. ....
    * [Typsystem von Python](https://typing.python.org/en/latest/spec/)
    * Python verfolgt [Duck Typing](https://docs.python.org/3/glossary.html#term-duck-typing)
    * Python verfolgt [Gradual Typing](https://jsiek.github.io/home/WhatIsGradualTyping.html)
* [Liste aller Build-in-Typen](https://docs.python.org/3/library/stdtypes.html)
* Spezielle Typen sind z.B.:
    * `Any`: Representiert einen unbekannten statischen Typ
    * `None`: Representiert fehlende oder optionale Werte
* Spezielle Funktionen zur Typermittlung und -prüfung:
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
* [Zen of Python](https://docs.python.org/3/glossary.html#term-Zen-of-Python)
* [PEP 8 - Style Guide for Python Code](https://peps.python.org/pep-0008/)
* [Best Practices (RealPython)](https://realpython.com/ref/best-practices/)


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

Tutorials
* [Python HOWTOs](https://docs.python.org/3/howto/)
* [The Hitchhiker’s Guide to Python](https://docs.python-guide.org/) (Tipps für die tägliche Arbeit mit Python, etwas veraltet)
* [Python Tutorials (RealPython)](https://realpython.com/) (anschauliche Python-Tutorials)
* [Python Cheat Sheet (RealPython)](https://realpython.com/cheatsheets/python/)
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
* [Laziness in Python (YouTube)](https://www.youtube.com/watch?v=5jwV3zxXc8E)
* [Interessante Python-Kurse](https://www.dabeaz.com/)
</details>
