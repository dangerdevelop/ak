<?php

// Kullanıcının IP adresini al
$ip_address = $_SERVER['REMOTE_ADDR'];

require_once 'config.php';


// Last activity'yi güncelle
$sql = "INSERT INTO visitor (ip_address, last_activity) VALUES ('$ip_address', NOW())";
if ($conn->query($sql) === TRUE) {
    echo "IP adresi başarıyla kaydedildi";
} else {
    echo "Hata: " . $sql . "<br>" . $conn->error;
}

$conn->close();
