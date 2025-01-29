<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['sec-username']) || $_SESSION['sec-username'] !== 'admin') {
    echo json_encode(['error' => 'Unauthorized access']);
    exit();
}

function fetchAndCacheFilteredUrls($cacheDuration = 15 * 60)
{
    try {
        $cacheFile = __DIR__ . '/cache.json';

        if (file_exists($cacheFile) && (time() - filemtime($cacheFile) < $cacheDuration)) {
            $cacheData = json_decode(file_get_contents($cacheFile), true);
            $data = $cacheData['urls'];
        } else {
            $now = new DateTime();
            $tenHoursAgo = (new DateTime())->modify('-10 hours');

            $dateGte = $tenHoursAgo->format('Y-m-d\TH:i:s');
            $dateLte = $now->format('Y-m-d\TH:i:s');

            $allData = [];

            $urlBP = "https://api.codetabs.com/v1/proxy?quest=https://www.usom.gov.tr/api/address/index?type=domain&desc=BP&date_gte={$dateGte}&date_lte={$dateLte}&page=0";
            $contextBP = stream_context_create([
                'http' => [
                    'method' => 'GET',
                    'header' => [
                        'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
                    ]
                ]
            ]);
            $responseBP = file_get_contents($urlBP, false, $contextBP);
            if ($responseBP === false) {
                $http_response_code = $http_response_header[0] ?? 'N/A';
                throw new Exception("Failed to fetch data from API for desc=BP - HTTP Code: $http_response_code");
            }
            $dataBP = json_decode($responseBP, true);
            if ($dataBP === null) {
                $http_response_code = $http_response_header[0] ?? 'N/A';
                throw new Exception("Failed to parse JSON response for desc=BP - HTTP Code: $http_response_code");
            }
            $urls = array_map(function ($model) {
                return $model['url'];
            }, $dataBP['models']);

            $urlPH = "https://api.codetabs.com/v1/proxy?quest=https://www.usom.gov.tr/api/address/index?type=domain&desc=PH&date_gte={$dateGte}&date_lte={$dateLte}&page=0";
            $responsePH = file_get_contents($urlPH, false, $contextBP);
            if ($responsePH === false) {
                $http_response_code = $http_response_header[0] ?? 'N/A';
                throw new Exception("Failed to fetch data from API for desc=PH - HTTP Code: $http_response_code");
            }
            $dataPH = json_decode($responsePH, true);
            if ($dataPH === null) {
                $http_response_code = $http_response_header[0] ?? 'N/A';
                throw new Exception("Failed to parse JSON response for desc=PH - HTTP Code: $http_response_code");
            }
            $urls = array_merge($urls, array_map(function ($model) {
                return $model['url'];
            }, $dataPH['models']));

            file_put_contents($cacheFile, json_encode([
                'created_at' => date('Y-m-d H:i:s'),
                'urls' => $urls
            ]));
            $data = $urls;
        }

        return $data;
    } catch (Exception $e) {
        error_log(date('[Y-m-d H:i:s] ') . $e->getMessage() . "\n", 3, __DIR__ . '/error.txt');
        return [];
    }
}

$urls = fetchAndCacheFilteredUrls();
print_r($urls);
