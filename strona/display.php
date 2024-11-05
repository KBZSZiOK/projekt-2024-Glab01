<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>title</title>
    <link rel="stylesheet" href="./style.css">
</head>
<body>
    
</body>
</html>
<?php
    $mysqli = new mysqli("localhost","root","","kino");

    if ($mysqli -> connect_errno) {
    echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
    exit();
    } else {
        echo "Connection established <br>";
    }
    $MovieQuery = "SELECT TYTUŁ, REŻYSER, CZAS_TRWANIA FROM FILMY;";
    $MovieExec = $mysqli->query($MovieQuery);
    
    if ($MovieExec->num_rows > 0) {

        echo "<br> <table border='1' cellpadding='5' cellspacing='0'>";
        echo "<tr><th>Tytuł</th><th>Reżyser</th><th>Czas Trwania (min.)</th></tr>";
    
        while($row = $MovieExec->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row["TYTUŁ"]) . "</td>";
            echo "<td>" . htmlspecialchars($row["REŻYSER"]) . "</td>";
            echo "<td>" . htmlspecialchars($row["CZAS_TRWANIA"]) . "</td>";
            echo "</tr>";
        }
    
        echo "</table>";
    } else {
        echo "0 results";
    }
    echo "asdasdad";
?>