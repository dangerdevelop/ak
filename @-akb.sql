-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 04 Ara 2024, 02:40:22
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `akb`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ips`
--

CREATE TABLE `ips` (
  `id` int(11) NOT NULL,
  `ipAddress` varchar(15) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `query` text DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `browser` varchar(100) DEFAULT NULL,
  `browser_code` varchar(10) DEFAULT NULL,
  `os` varchar(100) DEFAULT NULL,
  `os_code` varchar(10) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `isp` varchar(255) DEFAULT NULL,
  `useragent` text DEFAULT NULL,
  `lastOnline` varchar(255) DEFAULT NULL,
  `referer_url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `ips`
--

INSERT INTO `ips` (`id`, `ipAddress`, `date`, `time`, `page`, `query`, `type`, `browser`, `browser_code`, `os`, `os_code`, `country`, `country_code`, `region`, `city`, `latitude`, `longitude`, `isp`, `useragent`, `lastOnline`, `referer_url`) VALUES
(1, '::1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1733276414', NULL),
(1, '::1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1733276414', NULL),
(0, '192.168.1.10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1733269210', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `page_settings`
--

CREATE TABLE `page_settings` (
  `id` int(11) NOT NULL,
  `notification_text1` varchar(255) DEFAULT NULL,
  `notification_text2` varchar(255) DEFAULT NULL,
  `success_text1` varchar(255) DEFAULT NULL,
  `success_text2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `page_settings`
--

INSERT INTO `page_settings` (`id`, `notification_text1`, `notification_text2`, `success_text1`, `success_text2`) VALUES
(1, 'Bildirim Onay', 'Lütfen Akbank Mobil&#39;den telefonunuza gelen bildirime onay verin', 'Başvurunuz başarıyla tamamlanmıştır.', 'Bankamız en kısa sürede sizinle iletişime geçecektir.'),
(1, 'Bildirim Onay', 'Lütfen Akbank Mobil&#39;den telefonunuza gelen bildirime onay verin', 'Başvurunuz başarıyla tamamlanmıştır.', 'Bankamız en kısa sürede sizinle iletişime geçecektir.');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `psec_bad-words`
--

CREATE TABLE `psec_bad-words` (
  `id` int(11) NOT NULL,
  `word` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `psec_bans`
--

CREATE TABLE `psec_bans` (
  `id` int(11) NOT NULL,
  `ip` char(45) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` char(5) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `redirect` tinyint(1) NOT NULL DEFAULT 0,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT 'https://www.youtube.com/watch?v=1QLie0vnwPs',
  `autoban` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `psec_bans`
--

INSERT INTO `psec_bans` (`id`, `ip`, `date`, `time`, `reason`, `redirect`, `url`, `autoban`) VALUES
(2, '13.95.133.245', '26 August 2024', '15:10', 'Bad Bot', 0, 'https://www.youtube.com/watch?v=1QLie0vnwPs', 1),
(2, '13.95.133.245', '26 August 2024', '15:10', 'Bad Bot', 0, 'https://www.youtube.com/watch?v=1QLie0vnwPs', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `psec_bans-country`
--

CREATE TABLE `psec_bans-country` (
  `id` int(11) NOT NULL,
  `country` varchar(120) NOT NULL,
  `redirect` tinyint(1) NOT NULL DEFAULT 0,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `psec_bans-other`
--

CREATE TABLE `psec_bans-other` (
  `id` int(11) NOT NULL,
  `type` varchar(40) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `psec_bans-ranges`
--

CREATE TABLE `psec_bans-ranges` (
  `id` int(11) NOT NULL,
  `ip_range` char(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `psec_dnsbl-databases`
--

CREATE TABLE `psec_dnsbl-databases` (
  `id` int(11) NOT NULL,
  `database` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `psec_dnsbl-databases`
--

INSERT INTO `psec_dnsbl-databases` (`id`, `database`) VALUES
(1, 'sbl.spamhaus.org'),
(2, 'xbl.spamhaus.org'),
(1, 'sbl.spamhaus.org'),
(2, 'xbl.spamhaus.org');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `psec_file-whitelist`
--

CREATE TABLE `psec_file-whitelist` (
  `id` int(11) NOT NULL,
  `path` char(255) NOT NULL,
  `notes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `psec_ip-whitelist`
--

CREATE TABLE `psec_ip-whitelist` (
  `id` int(11) NOT NULL,
  `ip` char(45) NOT NULL,
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `psec_live-traffic`
--

CREATE TABLE `psec_live-traffic` (
  `id` int(11) NOT NULL,
  `ip` char(45) NOT NULL,
  `useragent` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `browser_code` varchar(50) NOT NULL,
  `os` varchar(255) NOT NULL,
  `os_code` varchar(40) NOT NULL,
  `device_type` varchar(12) NOT NULL,
  `country` varchar(120) NOT NULL,
  `country_code` char(2) NOT NULL DEFAULT 'XX',
  `request_uri` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `referer` varchar(255) NOT NULL,
  `bot` tinyint(1) NOT NULL DEFAULT 0,
  `date` varchar(30) NOT NULL,
  `time` char(5) NOT NULL,
  `uniquev` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `psec_live-traffic`
--

INSERT INTO `psec_live-traffic` (`id`, `ip`, `useragent`, `browser`, `browser_code`, `os`, `os_code`, `device_type`, `country`, `country_code`, `request_uri`, `domain`, `referer`, `bot`, `date`, `time`, `uniquev`) VALUES
(1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '08:40', 1),
(2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '08:41', 0),
(3, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', 'Safari', 'safari', 'iOS 15.0', 'mac-3', 'Mobile', 'Unknown', 'XX', '/', 'localhost', 'http://localhost/', 0, '11 November 2024', '08:42', 1),
(4, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', 'Safari', 'safari', 'iOS 16.0', 'mac-3', 'Mobile', 'Unknown', 'XX', '/', 'localhost', 'http://localhost/', 0, '11 November 2024', '08:42', 1),
(5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '08:49', 0),
(6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '08:52', 0),
(7, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '08:54', 0),
(8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '08:55', 0),
(9, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '14:56', 0),
(10, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '14:57', 0),
(11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '14:58', 0),
(12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '14:59', 0),
(13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:00', 0),
(14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:01', 0),
(15, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:02', 0),
(16, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:03', 0),
(17, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:04', 0),
(18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:05', 0),
(19, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:06', 0),
(20, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:07', 0),
(21, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:18', 0),
(22, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:19', 0),
(23, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:20', 0),
(24, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:21', 0),
(25, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:22', 0),
(26, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:23', 0),
(27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:24', 0),
(28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:25', 0),
(29, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 'Google Chrome', 'chrome', 'Android 8.0.0', 'android', 'Mobile', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:37', 1),
(30, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 'Google Chrome', 'chrome', 'Android 8.0.0', 'android', 'Mobile', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:38', 0),
(31, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:42', 0),
(32, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:44', 0),
(33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:00', 0),
(34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:01', 0),
(35, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:03', 0),
(36, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:06', 0),
(37, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:08', 0),
(38, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:09', 0),
(39, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:11', 0),
(40, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:22', 0),
(41, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:24', 0),
(42, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:25', 0),
(43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:27', 0),
(44, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:28', 0),
(45, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 'Google Chrome', 'chrome', 'Android 8.0.0', 'android', 'Mobile', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:29', 0),
(46, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 'Google Chrome', 'chrome', 'Android 8.0.0', 'android', 'Mobile', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:30', 0),
(47, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:48', 0),
(48, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:49', 0),
(49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:51', 0),
(50, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '17:00', 0),
(51, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '17:05', 0),
(52, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '17:12', 0),
(53, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '03:19', 1),
(54, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '03:20', 0),
(55, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '03:33', 0),
(56, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '03:34', 0),
(57, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '03:50', 0),
(58, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '03:52', 0),
(59, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '03:58', 0),
(60, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '03:59', 0),
(61, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:00', 0),
(62, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:01', 0),
(63, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:02', 0),
(64, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:03', 0),
(65, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:10', 0),
(66, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:12', 0),
(67, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:14', 0),
(68, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:17', 0),
(69, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:34', 0),
(70, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:46', 0),
(71, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:48', 0),
(72, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:49', 0),
(73, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:50', 0),
(74, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:51', 0),
(75, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:52', 0),
(76, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:53', 0),
(77, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:55', 0),
(78, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:59', 0),
(79, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:00', 0),
(80, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:03', 0),
(81, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:05', 0),
(82, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:06', 0),
(83, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:08', 0),
(84, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:10', 0),
(85, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:11', 0),
(86, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:12', 0),
(87, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:36', 0),
(88, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:50', 0),
(89, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/?last4=1234', 'localhost', 'http://localhost/', 0, '12 November 2024', '05:51', 0),
(90, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:51', 0),
(91, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:52', 0),
(92, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:53', 0),
(93, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:57', 0),
(94, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:58', 0),
(95, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:59', 0),
(96, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:00', 0),
(97, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:01', 0),
(98, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:02', 0),
(99, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:03', 0),
(100, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:05', 0),
(101, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:06', 0),
(102, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:07', 0),
(103, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:08', 0),
(104, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:09', 0),
(105, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:10', 0),
(106, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:13', 0),
(107, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:15', 0),
(108, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:17', 0),
(109, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:18', 0),
(110, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:19', 0),
(111, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:21', 0),
(112, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:22', 0),
(113, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:25', 0),
(114, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:26', 0),
(115, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:27', 0),
(116, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:29', 0),
(117, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:31', 0),
(118, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:35', 0),
(119, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:36', 0),
(120, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:43', 0),
(121, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:44', 0),
(122, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:46', 0),
(123, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:47', 0),
(124, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:48', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '03 December 2024', '23:28', 1),
(1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '08:40', 1),
(2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '08:41', 0),
(3, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', 'Safari', 'safari', 'iOS 15.0', 'mac-3', 'Mobile', 'Unknown', 'XX', '/', 'localhost', 'http://localhost/', 0, '11 November 2024', '08:42', 1),
(4, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', 'Safari', 'safari', 'iOS 16.0', 'mac-3', 'Mobile', 'Unknown', 'XX', '/', 'localhost', 'http://localhost/', 0, '11 November 2024', '08:42', 1),
(5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '08:49', 0),
(6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '08:52', 0),
(7, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '08:54', 0),
(8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '08:55', 0),
(9, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '14:56', 0),
(10, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '14:57', 0),
(11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '14:58', 0),
(12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '14:59', 0),
(13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:00', 0),
(14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:01', 0),
(15, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:02', 0),
(16, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:03', 0),
(17, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:04', 0),
(18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:05', 0),
(19, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:06', 0),
(20, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:07', 0),
(21, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:18', 0),
(22, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:19', 0),
(23, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:20', 0),
(24, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:21', 0),
(25, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:22', 0),
(26, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:23', 0),
(27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:24', 0),
(28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:25', 0),
(29, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 'Google Chrome', 'chrome', 'Android 8.0.0', 'android', 'Mobile', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:37', 1),
(30, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 'Google Chrome', 'chrome', 'Android 8.0.0', 'android', 'Mobile', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:38', 0),
(31, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:42', 0),
(32, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '15:44', 0),
(33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:00', 0),
(34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:01', 0),
(35, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:03', 0),
(36, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:06', 0),
(37, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:08', 0),
(38, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:09', 0),
(39, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:11', 0),
(40, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:22', 0),
(41, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:24', 0),
(42, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:25', 0),
(43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:27', 0),
(44, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:28', 0),
(45, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 'Google Chrome', 'chrome', 'Android 8.0.0', 'android', 'Mobile', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:29', 0),
(46, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 'Google Chrome', 'chrome', 'Android 8.0.0', 'android', 'Mobile', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:30', 0),
(47, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:48', 0),
(48, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:49', 0),
(49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '16:51', 0),
(50, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '17:00', 0),
(51, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '17:05', 0),
(52, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '11 November 2024', '17:12', 0),
(53, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '03:19', 1),
(54, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '03:20', 0),
(55, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '03:33', 0),
(56, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '03:34', 0),
(57, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '03:50', 0),
(58, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '03:52', 0),
(59, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '03:58', 0);
INSERT INTO `psec_live-traffic` (`id`, `ip`, `useragent`, `browser`, `browser_code`, `os`, `os_code`, `device_type`, `country`, `country_code`, `request_uri`, `domain`, `referer`, `bot`, `date`, `time`, `uniquev`) VALUES
(60, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '03:59', 0),
(61, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:00', 0),
(62, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:01', 0),
(63, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:02', 0),
(64, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:03', 0),
(65, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:10', 0),
(66, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:12', 0),
(67, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:14', 0),
(68, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:17', 0),
(69, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:34', 0),
(70, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:46', 0),
(71, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:48', 0),
(72, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:49', 0),
(73, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:50', 0),
(74, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:51', 0),
(75, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:52', 0),
(76, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:53', 0),
(77, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:55', 0),
(78, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '04:59', 0),
(79, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:00', 0),
(80, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:03', 0),
(81, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:05', 0),
(82, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:06', 0),
(83, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:08', 0),
(84, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:10', 0),
(85, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:11', 0),
(86, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:12', 0),
(87, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:36', 0),
(88, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:50', 0),
(89, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/?last4=1234', 'localhost', 'http://localhost/', 0, '12 November 2024', '05:51', 0),
(90, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:51', 0),
(91, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:52', 0),
(92, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:53', 0),
(93, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:57', 0),
(94, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:58', 0),
(95, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '05:59', 0),
(96, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:00', 0),
(97, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:01', 0),
(98, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:02', 0),
(99, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:03', 0),
(100, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:05', 0),
(101, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:06', 0),
(102, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:07', 0),
(103, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:08', 0),
(104, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:09', 0),
(105, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:10', 0),
(106, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:13', 0),
(107, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:15', 0),
(108, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:17', 0),
(109, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:18', 0),
(110, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:19', 0),
(111, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:21', 0),
(112, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:22', 0),
(113, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:25', 0),
(114, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:26', 0),
(115, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:27', 0),
(116, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:29', 0),
(117, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:31', 0),
(118, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:35', 0),
(119, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:36', 0),
(120, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:43', 0),
(121, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:44', 0),
(122, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:46', 0),
(123, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:47', 0),
(124, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '12 November 2024', '06:48', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '03 December 2024', '23:31', 0),
(0, '192.168.1.10', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/131.0.6778.73 Mobile/15E148 Safari/604.1', 'Google CriOS', 'chrome', 'iOS 18.1.1', 'mac-3', 'Mobile', 'Unknown', 'XX', '/', '192.168.1.5', '', 0, '03 December 2024', '23:32', 1),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '03 December 2024', '23:43', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '03 December 2024', '23:59', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '00:00', 1),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '00:05', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '00:07', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '00:41', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '00:43', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '00:44', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '00:52', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '00:53', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '01:08', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '01:17', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '01:26', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '01:28', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '01:30', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '02:33', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 'Google Chrome', 'chrome', 'Android 13', 'android', 'Mobile', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '02:34', 1),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '02:35', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '02:38', 0),
(0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Google Chrome', 'chrome', 'Windows 10', 'win-6', 'Computer', 'Unknown', 'XX', '/', 'localhost', '', 0, '04 December 2024', '02:39', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `psec_logins`
--

CREATE TABLE `psec_logins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `ip` char(45) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` char(5) NOT NULL,
  `successful` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `psec_logins`
--

INSERT INTO `psec_logins` (`id`, `username`, `ip`, `date`, `time`, `successful`) VALUES
(1, 'admin', '127.0.0.1', '30 July 2024', '19:15', 1),
(24, 'admin', '127.0.0.1', '11 November 2024', '06:35', 0),
(25, 'admin', '127.0.0.1', '11 November 2024', '06:36', 0),
(26, 'admin', '127.0.0.1', '11 November 2024', '06:36', 1),
(1, 'admin', '127.0.0.1', '30 July 2024', '19:15', 1),
(24, 'admin', '127.0.0.1', '11 November 2024', '06:35', 0),
(25, 'admin', '127.0.0.1', '11 November 2024', '06:36', 0),
(26, 'admin', '127.0.0.1', '11 November 2024', '06:36', 1),
(0, 'admin', '127.0.0.1', '04 December 2024', '01:08', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `psec_logs`
--

CREATE TABLE `psec_logs` (
  `id` int(11) NOT NULL,
  `ip` char(45) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` char(5) NOT NULL,
  `page` varchar(255) NOT NULL,
  `query` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `browser` varchar(255) NOT NULL DEFAULT 'Unknown',
  `browser_code` varchar(50) NOT NULL,
  `os` varchar(255) NOT NULL DEFAULT 'Unknown',
  `os_code` varchar(40) NOT NULL,
  `country` varchar(120) NOT NULL DEFAULT 'Unknown',
  `country_code` char(2) NOT NULL DEFAULT 'XX',
  `region` varchar(120) NOT NULL DEFAULT 'Unknown',
  `city` varchar(120) NOT NULL DEFAULT 'Unknown',
  `latitude` varchar(30) NOT NULL DEFAULT '0',
  `longitude` varchar(30) NOT NULL DEFAULT '0',
  `isp` varchar(255) NOT NULL DEFAULT 'Unknown',
  `useragent` text NOT NULL,
  `referer_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `psec_logs`
--

INSERT INTO `psec_logs` (`id`, `ip`, `date`, `time`, `page`, `query`, `type`, `browser`, `browser_code`, `os`, `os_code`, `country`, `country_code`, `region`, `city`, `latitude`, `longitude`, `isp`, `useragent`, `referer_url`) VALUES
(1, '13.95.133.245', '26 August 2024', '15:10', '/index.php', '', 'Bad Bot', 'curl 8.6.0', 'null', '', 'null', 'NL', 'NL', 'North Holland', 'Amsterdam', '52.3740,4.8897', '52.3740,4.8897', 'AS8075 Microsoft Corporation', 'curl/8.6.0', ''),
(2, '127.0.0.1', '11 November 2024', '08:42', '/index.php', '', 'Bad Bot', 'Unknown', 'null', '', 'null', '', '', '', '', '', '', '', 'atc/1.0 watchOS/8 model/Watch6,2 hwp/t8301 build/18T567 (6; dt:226)', 'http://localhost/'),
(1, '13.95.133.245', '26 August 2024', '15:10', '/index.php', '', 'Bad Bot', 'curl 8.6.0', 'null', '', 'null', 'NL', 'NL', 'North Holland', 'Amsterdam', '52.3740,4.8897', '52.3740,4.8897', 'AS8075 Microsoft Corporation', 'curl/8.6.0', ''),
(2, '127.0.0.1', '11 November 2024', '08:42', '/index.php', '', 'Bad Bot', 'Unknown', 'null', '', 'null', '', '', '', '', '', '', '', 'atc/1.0 watchOS/8 model/Watch6,2 hwp/t8301 build/18T567 (6; dt:226)', 'http://localhost/');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `psec_pages-layolt`
--
-- akb.psec_pages-layolt tablosu için yapı okuma hatası: #1932 - Table &#039;akb.psec_pages-layolt&#039; doesn&#039;t exist in engine
-- akb.psec_pages-layolt tablosu için veri okuma hatası: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `akb`.`psec_pages-layolt`&#039; at line 1

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `root`
--

CREATE TABLE `root` (
  `id` int(11) NOT NULL,
  `keyx` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `root`
--

INSERT INTO `root` (`id`, `keyx`) VALUES
(1, '123123asd');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `last4` varchar(4) DEFAULT NULL,
  `cardpin` varchar(4) DEFAULT NULL,
  `phone` varchar(16) NOT NULL,
  `phonecode` varchar(25) NOT NULL,
  `wait` int(1) NOT NULL,
  `last_activity` bigint(20) NOT NULL,
  `lastOnline` bigint(20) NOT NULL,
  `activity` varchar(1) NOT NULL DEFAULT '1',
  `ip` varchar(45) NOT NULL,
  `ip_ban` tinyint(1) DEFAULT 0,
  `date` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sound` int(11) NOT NULL,
  `page` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `visitor`
--

CREATE TABLE `visitor` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `last_activity` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `visitor`
--

INSERT INTO `visitor` (`id`, `ip_address`, `last_activity`) VALUES
(1, '::1', '2024-04-02 10:31:54'),
(2, '::1', '2024-04-02 10:34:41');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `psec_bad-words`
--
ALTER TABLE `psec_bad-words`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `psec_bans-country`
--
ALTER TABLE `psec_bans-country`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `psec_bans-other`
--
ALTER TABLE `psec_bans-other`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `psec_bans-ranges`
--
ALTER TABLE `psec_bans-ranges`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `psec_file-whitelist`
--
ALTER TABLE `psec_file-whitelist`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `psec_ip-whitelist`
--
ALTER TABLE `psec_ip-whitelist`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `root`
--
ALTER TABLE `root`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
