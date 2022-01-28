-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2022 at 03:21 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todolist`
--

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deadline` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `is_done` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `deadline`, `completed_at`, `is_done`, `created_at`, `updated_at`) VALUES
(2, 'Test task 2', NULL, '2022-01-26 18:36:14', 1, '2022-01-26 18:23:35', '2022-01-26 18:36:14'),
(3, 'Test task 2', NULL, NULL, 0, '2022-01-27 19:34:29', '2022-01-27 19:34:29'),
(4, 'Test task for vue', NULL, NULL, 0, '2022-01-28 08:02:25', '2022-01-28 08:02:25'),
(5, 'test vue', NULL, NULL, 0, '2022-01-28 08:06:26', '2022-01-28 08:06:26'),
(6, 'Test task for vue 2', NULL, NULL, 0, '2022-01-28 08:12:46', '2022-01-28 08:12:46'),
(7, 'Test task for vue 3', NULL, '2022-01-28 09:09:48', 1, '2022-01-28 08:12:50', '2022-01-28 09:09:48'),
(8, 'Test task for vue 4', NULL, NULL, 0, '2022-01-28 08:13:02', '2022-01-28 08:13:02'),
(9, 'Test task for vue 6', NULL, '2022-01-28 09:08:53', 1, '2022-01-28 08:13:05', '2022-01-28 09:08:53'),
(10, 'Test task for vue 15', NULL, '2022-01-28 09:08:15', 1, '2022-01-28 08:13:08', '2022-01-28 09:08:15'),
(12, 'Test task for vue 17', NULL, '2022-01-28 09:07:30', 1, '2022-01-28 08:28:14', '2022-01-28 09:07:30'),
(13, 'Test task for vue 18', NULL, '2022-01-28 08:57:35', 1, '2022-01-28 08:28:17', '2022-01-28 08:57:35'),
(14, 'Test task for vue 19', NULL, '2022-01-28 09:07:21', 1, '2022-01-28 08:28:20', '2022-01-28 09:07:21'),
(15, 'New Test From Vue', NULL, NULL, 0, '2022-01-28 09:09:36', '2022-01-28 09:09:36'),
(16, 'Test Deadline', '2022-03-17 13:59:00', NULL, 0, '2022-01-28 10:59:07', '2022-01-28 10:59:07'),
(17, 'Test Deadline Not Past', '2022-04-20 14:06:00', NULL, 0, '2022-01-28 11:06:06', '2022-01-28 11:06:06'),
(18, 'Test Deadline Past Due', '2021-11-04 14:06:00', NULL, 0, '2022-01-28 11:06:22', '2022-01-28 11:06:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
