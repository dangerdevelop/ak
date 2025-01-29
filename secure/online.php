<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['sec-username']) || $_SESSION['sec-username'] !== 'admin') {
    echo json_encode(['error' => 'Unauthorized access']);
    exit();
}

include('./config.php');
$onlineList = [];
$notification = false;

// Log errors to file
ini_set('display_errors', 0);
ini_set('log_errors', 1); 
error_reporting(E_ALL);
ini_set('error_log', 'error.txt');

try {
    $sql = "SELECT * FROM ips";
    $result = $mysqli->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            if ($row['lastOnline'] > time()) {
                array_push($onlineList, $row['ipAddress']);
            }
        }
    }

    $onlineCount = count($onlineList);

    $sql = "SELECT COUNT(*) as total FROM `psec_live-traffic`";
    $result = $mysqli->query($sql);
    $totalRow = $result->fetch_assoc();
    $totalCount = $totalRow['total'];

    $sql = "SELECT * FROM users";
    $result = $mysqli->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            if ($row['sound'] == '1') {
                $notification = true;

                $updateSql = "UPDATE users SET sound='0'";
                $mysqli->query($updateSql);
            }
        }
    }

    echo json_encode(['onlineCount' => $onlineCount, 'totalCount' => $totalCount, 'notification' => $notification]);

} catch (Exception $e) {
    error_log("Error in online.php: " . $e->getMessage());
    echo json_encode(['error' => 'An error occurred']);
}

$mysqli->close();
