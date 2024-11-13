<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>filler</title>
    <style>
        <?php include "style.css" ?>
    </style>
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
    echo "<center><h1>Connection established</h1></center> <br>";
    }
?>