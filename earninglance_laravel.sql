-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 09, 2024 at 08:23 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `earninglance_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_messages`
--

CREATE TABLE `admin_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_messages`
--

INSERT INTO `admin_messages` (`id`, `message`, `date`, `created_at`, `updated_at`, `username`) VALUES
(1, 'dfdsfsdfsd fsdfd', 'dsfdsf dsfsdfds', NULL, NULL, 'saddasd'),
(2, 'dfdsfsdfsd fsdfd', 'dsfdsf dsfsdfds', NULL, NULL, 'saddasd'),
(3, 'dsfsgdg', 'fdgdf fdsf dsds', NULL, NULL, 'sdsad');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `msg` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(25, '2014_10_12_000000_create_users_table', 1),
(26, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(27, '2019_08_19_000000_create_failed_jobs_table', 1),
(28, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(29, '2023_08_16_224352_create_plans_table', 1),
(30, '2023_08_17_134745_create_contact_table', 1),
(31, '2023_08_17_205715_create_withdrawal_request_table', 1),
(32, '2023_08_18_130901_create_user_payments_table', 1),
(33, '2023_08_18_140624_create_withdrawal_methods_table', 1),
(34, '2023_08_18_140633_create_payment_methods_table', 1),
(35, '2023_08_19_120523_create_user_has_plan_table', 1),
(36, '2023_09_03_091102_create_verify_users_table', 1),
(37, '2023_09_17_143848_create_admin_messages_table', 2),
(38, '2023_09_17_150152_create_username_column', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `account_name`, `account_number`, `created_at`, `updated_at`) VALUES
(1, 'Easypaisa', 'Hassan Jani', '2432424', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `charges` double(10,2) NOT NULL,
  `direct` double(10,2) NOT NULL,
  `indirect` double(10,2) NOT NULL,
  `bonus` double(10,2) NOT NULL,
  `features` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `level`, `charges`, `direct`, `indirect`, `bonus`, `features`, `created_at`, `updated_at`) VALUES
(1, 'Business Plan', 1, 1500.00, 600.00, 200.00, 2000.00, 'Direct commission\n                Indirect commission\n                Team bonus ', NULL, NULL),
(2, 'Silver Plan', 2, 3000.00, 1200.00, 300.00, 5000.00, 'Direct commission\n                Indirect commission\n                Team bonus ', NULL, NULL),
(3, 'Gold Plan', 3, 4500.00, 1100.00, 300.00, 7000.00, 'Direct/indirect commission\n                Assignment ', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `balance` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `referral` varchar(255) DEFAULT NULL,
  `indirect` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `balance`, `name`, `username`, `email`, `phone`, `password`, `referral`, `indirect`, `role`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(1, 14000, 'Ehtisham Farman', 'shami', 'shami@gmail.com', 354324324, '$2y$10$yiUldPbJK6usSr/uCx1ZeON7b1jv/P0Mp8xg9VgQgmfcdjg/vi8tO', 'refri', 'Admin', 2, NULL, NULL, NULL, NULL),
(2, 10, 'sdsa', 'saddasd', 'asdsad@dff', 2423423, '$2y$10$JRuybCNGmLsHiwP5QTw/2umrOB6qyEH8pYwR4OBdeFVJPTe6frqB6', NULL, NULL, 1, NULL, NULL, '2023-09-15 08:26:40', '2023-09-15 11:08:13');

-- --------------------------------------------------------

--
-- Table structure for table `user_has_plan`
--

CREATE TABLE `user_has_plan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_has_plan`
--

INSERT INTO `user_has_plan` (`id`, `username`, `plan_id`, `created_at`, `updated_at`) VALUES
(1, 'saddasd', 1, '2023-09-15 08:27:14', '2023-09-15 08:27:14');

-- --------------------------------------------------------

--
-- Table structure for table `user_payments`
--

CREATE TABLE `user_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `amount` double NOT NULL,
  `method_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_payments`
--

INSERT INTO `user_payments` (`id`, `plan_id`, `username`, `amount`, `method_id`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'saddasd', 1500, 1, 1, '1694784417.png', '2023-09-15 08:26:57', '2023-09-15 08:27:14');

-- --------------------------------------------------------

--
-- Table structure for table `verify_users`
--

CREATE TABLE `verify_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `token` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verify_users`
--

INSERT INTO `verify_users` (`id`, `token`, `created_at`, `updated_at`) VALUES
(1, '688c19043aa486061ac94ee8272a5859d59c2068', '2023-09-15 08:26:40', '2023-09-15 08:26:40');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_methods`
--

CREATE TABLE `withdrawal_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawal_methods`
--

INSERT INTO `withdrawal_methods` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Easypaisa', NULL, NULL),
(2, 'Jazzcash', NULL, NULL),
(3, 'Sada Pay', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_request`
--

CREATE TABLE `withdrawal_request` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `number` bigint(20) NOT NULL,
  `method_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawal_request`
--

INSERT INTO `withdrawal_request` (`id`, `username`, `amount`, `fullname`, `number`, `method_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'saddasd', 22222, 'dsfsdf sdfsdf', 23423423, 1, 1, '2023-09-15 08:33:06', '2023-09-15 08:34:07'),
(2, 'saddasd', 2000, 'sddfdsf dfsdfsd', 223123213, 1, 1, '2023-09-15 11:06:01', '2023-09-15 11:06:01'),
(3, 'saddasd', 2, 'sdfsdf fsdfsd', 24234234, 2, 2, '2023-09-15 11:08:13', '2023-09-15 11:08:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_messages`
--
ALTER TABLE `admin_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_has_plan`
--
ALTER TABLE `user_has_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_payments`
--
ALTER TABLE `user_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verify_users`
--
ALTER TABLE `verify_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_methods`
--
ALTER TABLE `withdrawal_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_request`
--
ALTER TABLE `withdrawal_request`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_messages`
--
ALTER TABLE `admin_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_has_plan`
--
ALTER TABLE `user_has_plan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_payments`
--
ALTER TABLE `user_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `verify_users`
--
ALTER TABLE `verify_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `withdrawal_methods`
--
ALTER TABLE `withdrawal_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `withdrawal_request`
--
ALTER TABLE `withdrawal_request`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
