<?php

include($_SERVER['DOCUMENT_ROOT'] . '/a/config.php');
$mysqli = new mysqli($host, $username, $password, $database);

// Checking Connection
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: " . $mysqli->connect_error;
    exit();
}

$mysqli->set_charset("utf8mb4");
mysqli_query($mysqli, "SET NAMES 'utf8mb4'");
mysqli_query($mysqli, "SET CHARACTER SET utf8mb4");
mysqli_query($mysqli, "SET COLLATION_CONNECTION = 'utf8mb4_unicode_ci'");

// Settings
include "config_settings.php";
