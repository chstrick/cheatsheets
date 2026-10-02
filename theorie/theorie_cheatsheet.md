# Theorie Cheatsheet

1. [Überblick](#überblick)
2. [Binärsystem](#binärsystem)
    - [Darstellung von Zahlen im Computer](#darstellung-von-zahlen-im-computer)
3. [Logik](#logik)
4. [Theoretische Informatik](#theoretische-informatik)
    - [Formale Sprachen](#formale-sprachen)
    - [Automatentheorie](#automatentheorie)
    - [Berechenbarkeitstheorie](#berechenbarkeitstheorie)
    - [Komplexitätstheorie](#komplexitätstheorie)
5. [Weitere Quellen](#weitere-quellen)


## Überblick
In dem verlinkten [YouTube-Video](https://www.youtube.com/watch?v=SzJ46YA_RaA) wird ein Überblick über verschiednene Bereiche der Informatik gegben.

Die [Computer Science Roadmap](https://roadmap.sh/computer-science) von *roadmap.sh* stellt einen möglichen Lehrplan dar und verlinkt hilfreiche Quellen.


## Binärsystem
Im [Binärsystem](https://de.wikipedia.org/wiki/Dualsystem) werden Zahlen nur durch die beiden Ziffern/Symbole 0 und 1 dargestellt. Mit Bezug zur Logik spricht man auch von 0 = "faslch/false" und 1 = "wahr/true". In der elektronischen Datenverarbeitung (Computer, Schaltkreise) stehen die Symbole für 0 = "aus" (kein Strom fließt) und 1 = "an" (Strom fließt) (siehe auch [Darstellung von Zahlen im Computer](#darstellung-von-zahlen-im-computer)).

### Dezimal zu Binär
Zerlege die Dezimalzahl in eine Summe von 2er-Potenzen (1, 2, 4, 8, 16, 32, 64, ...). Beginne mit der größten 2er-Potenz, die in die Dezimalzahl passt. Verfahre mit dem Rest genau so weiter, bis dieser 0 ist. Für die 2er-Potenzen, die in der Summe vorkommen, schreibe eine 1 und sonst 0, dann erhät man die Binärzahl.
```text
78 - 64 = 14 => 78 = 64 + 14
14 -  8 =  6 => 78 = 64 + 8 + 6
 6 -  4 =  2 => 78 = 64 + 8 + 4 + 2
 2 -  2 =  0

64 32 16 8 4 2 1
 1  0  0 1 1 1 0 => 1001110
```

### Binär zu Dezimal
Addiere die Stellen der Binärzahl (1er, 2er, 4er, 16er, 32er, ...), bei denen eine 1 steht. Die Summe ist die Dezimalzahl.
```text
 1   0  1  0  1  0
32  16  8  4  2  1 => 32 + 8 + 2 = 42
```
Hier gibt es einen [Online-Konverter](https://www.rapidtables.org/de/convert/number/index.html).

### Addition
Regeln:
- 0 + 0 = 0
- 0 + 1 = 1
- 1 + 0 = 1
- 1 + 1 = 0 mit Übertrag (Ü) 1

Beispiel:
```text
    11100  |     28
+    1001  |  +   9
Ü: 11      |  Ü: 1 
---------  |  -----
   100101  |     37
```

### Subtraktion
Regeln:
- 0 - 0 =  0
- 0 - 1 = -1 => 1 mit Übertrag 1
- 1 - 0 =  1
- 1 - 1 =  0

Beispiel:
```text
    11100  |     28
-    1001  |  -   9
Ü:    11   |  Ü: 1 
---------  |  -----
    10011  |     19
```

### Multiplikation
Regeln:
- 0 * 0 = 0
- 0 * 1 = 0
- 1 * 0 = 0
- 1 * 1 = 1

Beispiel:
```text
         1101 * 1001  |  13 * 9
--------------------  |  ------
                1101  |     117
+              0000   |
+             0000    |
+            1101     |
Ü:             1      |
--------------------  |
             1110101  |
```

### Division
Regeln:
0 : 1 = 0
1 : 1 = 1

Beispiel:
```text
 1000010 : 11 = 010110           |  66 : 3 = 22
- 0 (11 passt 0 mal in 10)       |
----                             |
 100 (10 - 0 und 0 runterholen)  |
- 11 (11 passt 1 mal in 100)     |
-----                            |
   10                            |
-   0                            |
-------                          |
    100                          |
-    11                          |
--------                         |
      11                         |
-     11                         |
---------                        |
       00                        |
-       0                        |
---------                        |
        0                        |
```

### Darstellung von Zahlen im Computer
Das Dokument [Zahlendarstellung](/docs/Zahlendarstellung.pdf) beschreibt, wie Zahlen (und andere Zeichen) in Bits und Bytes dargestellt werden.


## Logik
Mit Logik ist hier die [Aussagenlogik](https://de.wikipedia.org/wiki/Aussagenlogik) bzw. [Boolsche Algebra](https://de.wikipedia.org/wiki/Boolesche_Algebra) gemeint mit den Operatoren not (Negation), and (Konjunktion), or (Disjunktion), xor (exclusive or, entweder oder), -> (Implikation) und <-> (Äquivalenz)

 a | b | ¬ a | a ∨ b | a ∧ b | a → b | a xor b
---|---|-----|-------|-------|-------|---------
 0 | 0 |  1  |   0   |   0   |   1   |    0
 0 | 1 |  1  |   1   |   0   |   1   |    1
 1 | 0 |  0  |   1   |   0   |   0   |    1
 1 | 1 |  0  |   1   |   1   |   1   |    0

Die Implikation *a → b* entspricht *¬ a ∨ b*.

Die Äquivalenz *a ↔ b* entspricht *a → b ∧ b → a*.


## Theoretische Informatik
Die [Theoretische Informatik](https://de.wikipedia.org/wiki/Theoretische_Informatik) ist ein Teilgebiet der Mathematik und behandelt u.a. die folgenden Felder:

### Formale Sprachen
[Formale Sprachen](https://de.wikipedia.org/wiki/Formale_Sprache) ...

### Automatentheorie
[Automatentheorie](https://de.wikipedia.org/wiki/Automatentheorie) ...

### Berechenbarkeitstheorie
[Berechenbarkeitstheorie](https://de.wikipedia.org/wiki/Berechenbarkeitstheorie) ...

### Komplexitätstheorie
[Komplexitätstheorie](https://de.wikipedia.org/wiki/Komplexit%C3%A4tstheorie) ...


## Weitere Quellen
Mathematische Grundlagen
* [Themensammlung Mathematische Grundlagen](https://www.matheretter.de/wiki)

Vorlesungen
* [Konkrete Mathematik (nicht nur) für Informatiker (Edmund Weitz, HAW Hamburg)](https://www.youtube.com/playlist?list=PLb0zKSynM2PBYzz6l37rWH3B_n_7P40QP)
* [Theoretische Informatik (WiSe 2014/2015) (Edmund Weitz, HAW Hamburg)](https://www.youtube.com/playlist?list=PLb0zKSynM2PDc_m0WZ2DdEoui71J4TL4N)
* [Theoretische Informatik (WiSe 2023/2024) (Edmund Weitz, HAW Hamburg)](https://www.youtube.com/playlist?list=PLb0zKSynM2PDUcEEkjv48Y_4N9CBFyzsz)

Komplexität
* [P vs. NP and the Computational Complexity Zoo (YouTube-Video)](https://www.youtube.com/watch?v=YX40hbAHx3s)
