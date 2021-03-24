-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2021 at 01:56 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.5.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-assessment`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_03_22_110814_create_sessions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0OucaLZniqmddQ7e1iQHMwF9syCUfgwz4bUfymJm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWGdPb0YzOUp1SVJwOHpxR1Y3QXBqV3FUYzdtYmxzNEtSS3NZdEZFViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ob21lIjt9fQ==', 1616575932),
('7CvGJejaWowiMteYVnqr6WJF0W0ISCfo6OD1piMN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiajVyOXZzUE9CUzV0RG9US0ExbE5zUk1aVlpoaTdqWlFnVkJ2b3pHVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1616579053),
('9RYbwEQIp6WlZqpABrZdguzFwnAGqICk6xOUUnqg', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSHpIMFhQcUR1VE9Qa3p3dDdDVXM4bXRTYnRHRUkzaHNZVXVMU1lSUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC91c2Vyc2hvbWUiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO30=', 1616586912),
('fEXVCPjhGBC7VbMn8TDTC7OX3beCprYMZ2XdfeAJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUVWNHNHY042Q3JpQW4wRzYyUm9tSEZuM21rMVpkS0NCRkpudVo5OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1616578934),
('gyosioBWBnKX1xQx2MyoQqfrdiEFLU5Tv3uvh3lC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHdnZVgzZHlkSDRycmx4MUd1TlpOenBZaTkwb1ZrZHQ2UEU0RzFubiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1616575576),
('i3FDXYKoYt2e2ETN0nsze4yEYMozn7lP8EDNZIKq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianhxeExwdU96ZFlPckl6OWtxN1gxSVBndTdwcHFHdkVndnpnbEFJRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1616575599),
('ka7z1LuSOEFzy1p8jFnr4yoHjDTHrLiKSjPXjWhr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSkh0cEs5Wm1uZnUzeWRhZjRoQW9zS3BjMHh2M2NFVVpGelp3aFVjMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ob21lIjt9fQ==', 1616575749),
('Kb0P0NuGrcAp4s28m7STwoFPZwNQ0r9I52oYVnKK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkwwZUxIV2tNeXBlejJKWHFLMGxJWkdyZjhlWVVIbmtNQW9qMEtHUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1616575928),
('l81Wo0A6q5G4xw2gDbpamuepmdBlT9cCwlrNwhmB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYnBaOUpMcDZWV2xUMENQZzZPcEZPY1FUVFpKcnhjOWNUZnpmdmpkSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fX0=', 1616586945),
('Lv8uPWAh1Eybd1KpBWgncc9dech63D8NgxD6myRu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQVRuc0Rzc3owYlV2QzlQMkxtazF4bEdvNFhlMTZYTVpPWExUY1MwbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ob21lIjt9fQ==', 1616576055),
('PZzRTtIsSxRoFAlHBNxaEtTlHeFYscQ0o0l4BuMZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3VIc3RJcXlMSGN1cFVEZkRUMGMzaW43OVRLQmpNMEw2T3Z4VE1mSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1616578984),
('Q5Isv6fDv5BnXQ2WJ7zZv6PGo73t9byyAPADBvni', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0FmR0w5Z3AxSEptbDFnVk5MSjV4YmFiZXRGOUxFMmV2TGFURzF6byI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9qcy9wb3BwZXIuanMubWFwIjt9fQ==', 1616579122),
('QXxelBHi0Ux8hQGurBtrWoHgeH0xDPClbsfQmITq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGJhM1Z2SW5mZGNtb0h2NzkzVHFhVnlGMjBmMkw5blk2ME5mZ2RCcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9qcy9wb3BwZXIuanMubWFwIjt9fQ==', 1616577197),
('s4GlGRxZYV34uAYACzHIemDL9FA51u6Ux24bmR3M', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidm1tMzZSSGZIN1E4eGdhNWFzNWpmSzhiaExla1BGdzliRm9Kd29QMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1616575659),
('sPBAZFbE7KKtC9RQ2C1VJHGfYNmbwh7EZuxzo1oI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWlMWnJOWGlVOWhXcUlZYVhmUlV5b3AwOTRkNUFGOTdKUlNRS0lZTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9qcy9wb3BwZXIuanMubWFwIjt9fQ==', 1616578015),
('taqb9b0yswSSBkAiDsOWAgYDfVtwZBwCkeU5dwkV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzVtbVZSc29hdUZ5Mk1pczFzZlI5eVRiTXVQUU5wdHVQS3RkU1hVWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1616575746),
('VvorV01Wfbk8j8sVNYdOY2c1klVxpXeZv6e2rCTX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVWdWTFNRa0lzT2xVNk9KVGU0eEMxaEpyQTVxMVVRVm5TWE9GdzdxZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ob21lIjt9fQ==', 1616575782),
('Y7KohJn5ceFN7s1ZFTEIkZjY2xSyQm4NtRSZXhrA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0ZsQ3ZTTEdsWW5uMGlpRmtlVmNxSjlMM0JNNDhqaHVkRUxEeHhDayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1616575555);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `mailsent` int(11) NOT NULL DEFAULT '0',
  `register_complete` int(11) NOT NULL DEFAULT '0',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `admin`, `status`, `mailsent`, `register_complete`, `image`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'sarbjit', 'sarbjitgrewaltekkiweb@gmail.com', 1, 0, 1, 0, NULL, NULL, '$2y$10$LplOniNu15f9F8KFGmgXEusQ1ktvlGLtioGKZ/mprgG.VBOwG5JO.', NULL, '2021-03-22 04:55:19', '2021-03-23 06:53:58'),
(3, 'sasingh', 'sarbjitsingh@gmail.com', 0, 1, 1, 1, NULL, NULL, '$2y$10$5gleNcrZkx4vwfKUE0QAYeXmzs/uLQh3voiLMq3gzrAca1z0Kz6nS', NULL, '2021-03-22 06:41:53', '2021-03-23 06:54:02'),
(4, 'sarbjitsinghs', 'sarbjisinghs@gmail.com', 0, 0, 1, 1, NULL, NULL, '$2y$10$2A5kBhpZYWqyLruez2.CxOz3iRYCtUjVAMG58PobVXqF83BitBTKu', NULL, '2021-03-22 06:49:48', '2021-03-24 05:15:37'),
(18, NULL, 'hardeeps.tws@gmail.com', 0, 0, 0, 1, NULL, NULL, '$2y$10$sC6ncTCvhdGF.zUCiUfosOECfMgcFckebXfsmTBnS4RAuUnJlhApy', NULL, '2021-03-24 05:54:20', '2021-03-24 06:24:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
