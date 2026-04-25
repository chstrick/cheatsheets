# Web Engineering Cheatsheet

</br>

## Grundlagen
* [MDN (Mozilla Developer Network)](https://developer.mozilla.org/de/) (Dokumentation aller Web-Standards)
    * [HTML](https://developer.mozilla.org/de/docs/Web/HTML)
    * [CSS](https://developer.mozilla.org/de/docs/Web/CSS)
    * [JavaScript](https://developer.mozilla.org/de/docs/Web/JavaScript)
    * [Web-APIs](https://developer.mozilla.org/de/docs/Web/API)
* [Grundlagenkurs von André Kless (HBRS)](https://akless.github.io/akless/we/index.html)
* [Online-Lehrbuch Web Development](http://web-development.github.io/)


</br>

## Hypertext Markup Language (HTML)

<details close>
<summary>Grundlegende HTML-Datei</summary>

```html
<!DOCTYPE html> <!-- Dokumenttyp -->
<html lang="en"> <!-- Basis-HTML-Tag mit Sprache der Webseite -->
    <head>
        <!-- Metadaten der Webseite -->
        <meta charset="UTF-8"> <!-- verwendetes Character-Set -->
        <meta name="description" content="Basic HTML Tutorial">
        <meta name="keywords" content="HTML, Web">
        <meta name="author" content="John Doe">
        <!-- Refresh der Seite alle 30 Sek. -->
        <meta http-equiv="refresh" content="30">
        <!-- Viewport sorgt für gute Darstellung auf allen Geräten -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <!-- Titel der Seite, wird in Tab angezeigt -->
        <title>Basic HMTM File</title>

        <!-- Favicon, wird in Tab angezeigt -->
        <link rel="icon" type="image/x-icon" href="/images/favicon.ico">

        <!-- externes Style-Sheet -->
        <link rel="stylesheet" href="mystyle.css">
    </head>
    <body>

        <!-- Kommentar in HTML -->

        <p>Paragraph</p>
        <div>Container</div>
        <a href="https://www.google.com/">Link</a>
        <img src="Bild_Datei.jpeg" alt="Alternativer Text" width="300px" height="300px">

    </body>
</html>
```
</details>


</br>

## Cascading Style Sheets (CSS)

### Einbindung von CSS in HTML
```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Einbindung von CSS in HTML</title>

        <!-- interner style-Tag im Head -->
        <style>
            body {
                background-color: blue;
            }
            p {
                color: red; -- Schriftfarbe
            }
        </style>

        <!-- externe CSS-Datei im Head (empfohlen) -->
        <link rel="stylesheet" href="mystyle.css">
    </head>
    <body>
        
        <p>Hello World!</p>

        <!-- Inline-Style als Attribut in einem Tag -->
        <div style="background-color:green;width:100%">Container</div>

    </body>
</html>
```

## CSS-Regeln

<details close>
<summary>Grundlegende Beispiele</summary>

```css
/* Kommentar in CSS */
/* TODO */
```
</details>


</br>

## JavaScript (JS)

### Einbindung von JS in HTML
```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Einbindung von JS in HTML</title>
    </head>
    <body>

    <!-- interner script-Tag im Body -->
    <script>
        console.log("Hello World")
    </script>

    <!-- externe JS-Datei (empfohlen) -->
    <script src="myscript.js"></script>

    <!-- noscript-Tag definiert Inhalt, falls JS im Browser nicht unterstüzt/erlaubt -->
    <noscript>Sorry, your browser does not support JavaScript!</noscript>

    </body>
</html> 
```

### Fetch API
Die Fetch-API ist eine standardmäßig in JavaScript eingebaute Schnittstelle zum Senden von HTTP-Anfragen und Verarbeiten der Antworten.
* [Fetch API (MDN)]()https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch
* [Beispiele](https://danlevy.net/you-may-not-need-axios/#fetch-recipes)

### Promises und async/await
* [Gute Erklärung für Promises und async/await](https://javascript.info/async)


</br>

## Web Components
* [Web Components (MDN)](https://developer.mozilla.org/en-US/docs/Web/Web_Components)
* [Shadow DOM Deep Dive](https://github.com/praveenpuglia/shadow-dom-in-depth)


</br>

## Weitere Quellen
Tools
* [Can I use](https://caniuse.com/) (Tool zur Prüfung von Browser-spezifischer Unterstützung von Web-Standards)
* [OWASP Cheatsheets](https://cheatsheetseries.owasp.org/index.html) (Cheatsheets für (Web) Security)

Tutorials
* [W3Schools](https://www.w3schools.com/) (Einfache Tutorials)

Coole Sachen
* [Video: Jake Archibald: Die Event-Loop](https://www.youtube.com/watch?v=cCOL7MC4Pl0&feature=youtu.be&t=490)
* [Lösungen: Schreibe eine JS-Funktion , die ...](https://github.com/nem035/js-function-fun/blob/master/functions.js)
* [Lösung: JS-Funktion mit unendlichen Argumenten](https://medium.com/@ishwar.rimal/trickiest-javascript-interview-question-with-solution-73958f99a376)
* [Currying in JavaScript](https://www.sitepoint.com/currying-in-functional-javascript/)
* [Überblick über ECMAScript 6 Features](https://github.com/lukehoban/es6features)
* [ECMAScript 6 Cheatsheet](https://github.com/DrkSephy/es6-cheatsheet)
