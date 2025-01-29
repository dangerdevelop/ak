<?php
require_once 'config.php';

$user_ip = $_SERVER['REMOTE_ADDR'];

$sql = "SELECT ip_ban FROM users WHERE ip = '$user_ip'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    if ($row["ip_ban"] == 1) {
        echo "banned";
    }
} 
?>
