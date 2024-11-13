<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>title</title>
    <style>
        <?php include "style.css" ?>
    </style>
</head>
<body>
    
</body>
</html>
<?php
    $mysqli = new mysqli("localhost","root","","kino");

    $Query = "SELECT SEANSE.TERMIN, SEANSE.LICZBA_WOLNYCH_MIEJSC, FILMY.TYTUŁ FROM `SEANSE`, `FILMY` WHERE SEANSE.FILM_ID = FILMY.ID;";
    $QueryExec = $mysqli->query($Query);

    echo "<table border='1'>";
    echo "<tr><th>Termin</th><th>Liczba wolnych miejsc</th><th>Tytuł filmu</th></tr>";
    while ($row = $QueryExec->fetch_assoc()) {

        echo "<tr>";
        echo "<td>" . $row["TERMIN"] . "</td>";
        echo "<td>" . $row['LICZBA_WOLNYCH_MIEJSC'] . "</td>";
        echo "<td>" . $row['TYTUŁ'] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
?>