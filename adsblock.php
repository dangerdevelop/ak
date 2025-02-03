<?php
include_once 'h4ci/modules/lib/useragent_detect_os.php';
function dd($data)
{
    echo '<pre>';
    print_r($data);
    echo '</pre>';
    exit;
}
$detectOs = useragent_detect_os::analyze($_SERVER['HTTP_USER_AGENT']);
$osName = strtolower($detectOs['name']);
$queryString = $_SERVER['QUERY_STRING'];
$referer = $_SERVER['HTTP_REFERER'] ?? null;
$isBlock = 0;
$isBlockedOs = match (true) {
    str_contains($osName, 'windows') => $isBlock = 1,
    str_contains($osName, 'mac') => $isBlock = 1,
    !str_contains($queryString, 'fbclid') => $isBlock = 1,
    // !str_contains($queryString, 'facebook') => $isBlock = 1,
    default => $isBlock = 0
};

if ($isBlock == 1) {
    require_once 'main.html';
    exit;
}
