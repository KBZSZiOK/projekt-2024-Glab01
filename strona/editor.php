<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>editor</title>
    <style>
        <?php include "style.css" ?>
    </style>
</head>
<body>
    <form method="post">
        <h2>Dodaj film:</h2><br>
        Tytuł filmu: <input type="text" id="title" name="title"><br>
        Reżyser: <input type="text" id="director" name="director"><br>
        Czas trwania (min): <input id="number" name="number" type="number" min="0" step="1"><br>
        Typ filmu: <select id="genre" name="genre">
        <option value="1">Horror</option>
        <option value="2">Komedia</option>
        <option value="3">Thriller</option>
        </select><br>
        <input type="submit" value="Dodaj film">
    </form>
</body>
</html>
<?php
    if (isset($_POST["title"]) && !empty($_POST["title"])) {
        $MovieTitle = $_POST["title"];
        $MovieDirector = $_POST["director"];
        $MovieLenght = (int)$_POST["number"];
        $MovieGenre = (int)$_POST["genre"];
        
        $mysqli = new mysqli("localhost","root","","kino");
        if ($mysqli -> query("INSERT INTO FILMY (ID, TYTUŁ, REŻYSER, CZAS_TRWANIA) VALUES (DEFAULT, '$MovieTitle', '$MovieDirector', $MovieLenght);") === TRUE){
            echo "Dodano nowy film";            
        } else {
            echo "Nope";
        }
        
        $MovieIdCheck = $mysqli -> query("SELECT ID FROM `FILMY` ORDER BY ID DESC;");
        $MovieIDs = $MovieIdCheck->fetch_assoc();
        $NewestMovieID = $MovieIDs["ID"];
        
        $mysqli -> query("INSERT INTO FILMY_RODZAJ (ID, FILMY_ID, RODZAJ_ID) VALUES (DEFAULT, $NewestMovieID, $MovieGenre);");
    }
?>