-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2018 at 06:18 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bookrent`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_account`
--

CREATE TABLE `tb_account` (
  `id` int(5) UNSIGNED ZEROFILL NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(70) NOT NULL,
  `dattim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_account`
--

INSERT INTO `tb_account` (`id`, `username`, `password`, `dattim`) VALUES
(00001, 'admin', '$2a$10$Cbw53e3bSsWUqNOJtooEeOBwuUbtfx6DyNgqHZi5c7qylc0HlUdGS', '2018-04-18 18:22:48'),
(00002, 'dryst', '$2a$10$NG1cln9RItaR.aSbyx4vUuFGhsLgem72zvwJcwlX/qX0edBBC989u', '2018-05-01 23:31:30'),
(00003, 'Test01', '$2a$10$2NgKutwp1N9CMSe3m7tLMuQzB02cTU8wizWvc6jfIf89fywHCB5YW', '2018-05-01 23:32:17');

-- --------------------------------------------------------

--
-- Table structure for table `tb_bookrent`
--

CREATE TABLE `tb_bookrent` (
  `id` int(4) UNSIGNED ZEROFILL NOT NULL,
  `namebook` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `vol` int(3) NOT NULL,
  `lend` int(3) NOT NULL,
  `ledate` date NOT NULL,
  `redate` date NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'Y',
  `entdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_bookrent`
--

INSERT INTO `tb_bookrent` (`id`, `namebook`, `fullname`, `vol`, `lend`, `ledate`, `redate`, `status`, `entdate`) VALUES
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-07', '2018-05-08', 'N', '2018-05-07 02:04:47'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 2, 5, '2018-05-07', '2018-05-08', 'N', '2018-05-07 02:04:47'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 3, 5, '2018-05-07', '2018-05-08', 'N', '2018-05-07 02:04:47'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 4, 5, '2018-05-07', '2018-05-08', 'N', '2018-05-07 02:04:47'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 5, 5, '2018-05-07', '2018-05-08', 'N', '2018-05-07 02:04:47'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 6, 5, '2018-05-07', '2018-05-08', 'N', '2018-05-07 17:17:00'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 7, 5, '2018-05-08', '2018-05-09', 'N', '2018-05-08 01:29:05'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 8, 5, '2018-05-08', '2018-05-09', 'N', '2018-05-08 01:30:57'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 9, 5, '2018-05-08', '2018-05-09', 'N', '2018-05-08 01:36:18'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 10, 5, '2018-05-08', '2018-05-09', 'N', '2018-05-08 01:42:13'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 11, 5, '2018-05-08', '2018-05-09', 'N', '2018-05-08 01:42:59'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 12, 5, '2018-05-08', '2018-05-09', 'N', '2018-05-08 01:42:59'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 13, 6, '2018-05-08', '2018-05-09', 'N', '2018-05-08 16:47:41'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 14, 6, '2018-05-08', '2018-05-09', 'N', '2018-05-08 16:48:11'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 15, 6, '2018-05-08', '2018-05-09', 'N', '2018-05-08 16:52:57'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 16, 6, '2018-05-08', '2018-05-09', 'N', '2018-05-08 16:52:57'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:34:30'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 2, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:34:30'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 3, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:34:30'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 4, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:35:38'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 5, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:35:38'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 6, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:35:38'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 16, 6, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:36:54'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 15, 6, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:36:54'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 14, 6, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:36:54'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 16, 6, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:37:26'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 15, 6, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:37:26'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 14, 6, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:37:26'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 5, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:37:26'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 4, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:37:26'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:39:47'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 2, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:39:47'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 3, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:39:47'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 4, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:39:47'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 5, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:39:47'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:42:25'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 2, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:42:25'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 3, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:42:25'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 4, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:42:25'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 5, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:42:25'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:44:23'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 2, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:47:53'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 3, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:47:53'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 4, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:50:12'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 5, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:50:12'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 6, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:50:39'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 7, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:50:39'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 8, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:52:12'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 9, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:52:12'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:52:23'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 2, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:52:23'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 3, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:52:23'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:54:18'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 2, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:54:18'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 3, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:54:18'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 4, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:54:29'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 5, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:54:29'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 6, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:54:56'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 7, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:54:56'),
(0001, 'Giant Killing', 'ไพบูรณ์ วิธานธำรง', 1, 4, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:55:22'),
(0001, 'Giant Killing', 'ไพบูรณ์ วิธานธำรง', 2, 4, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:55:22'),
(0001, 'สิงห์สนาม The Knight in The Area', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:55:22'),
(0001, 'สิงห์สนาม The Knight in The Area', 'ไพบูรณ์ วิธานธำรง', 2, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:55:22'),
(0001, 'สิงห์สนาม The Knight in The Area', 'ไพบูรณ์ วิธานธำรง', 3, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:55:22'),
(0002, 'ศึกตำนาน 7 อัศวิน', 'ธวัชชัข ทองอุดม', 1, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:56:09'),
(0001, 'ศึกตำนาน 7 อัศวิน', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:56:47'),
(0001, 'สิงห์สนาม The Knight in The Area', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:58:43'),
(0001, 'สิงห์สนาม The Knight in The Area', 'ไพบูรณ์ วิธานธำรง', 2, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:58:43'),
(0001, 'สิงห์สนาม The Knight in The Area', 'ไพบูรณ์ วิธานธำรง', 3, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 01:58:44'),
(0002, 'Baby Steps', 'ธวัชชัข ทองอุดม', 1, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 13:15:24'),
(0002, 'Baby Steps', 'ธวัชชัข ทองอุดม', 2, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 13:15:24'),
(0002, 'Baby Steps', 'ธวัชชัข ทองอุดม', 3, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 13:15:24'),
(0001, 'Giant Killing', 'ไพบูรณ์ วิธานธำรง', 1, 4, '2018-05-09', '2018-05-10', 'N', '2018-05-09 13:16:49'),
(0001, 'Giant Killing', 'ไพบูรณ์ วิธานธำรง', 2, 4, '2018-05-09', '2018-05-10', 'N', '2018-05-09 13:16:49'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 13:20:34'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 4, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 13:20:34'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 5, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 13:20:34'),
(0001, 'Giant Killing', 'ไพบูรณ์ วิธานธำรง', 2, 4, '2018-05-09', '2018-05-10', 'N', '2018-05-09 13:20:34'),
(0001, 'ศึกตำนาน 7 อัศวิน', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 13:20:34'),
(0001, 'ศึกตำนาน 7 อัศวิน', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-09', '2018-05-10', 'N', '2018-05-09 13:31:39'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-12', '2018-05-13', 'N', '2018-05-12 23:33:32'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-12', '2018-05-13', 'N', '2018-05-12 23:34:37'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-12', '2018-05-13', 'N', '2018-05-12 23:41:46'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-12', '2018-05-13', 'N', '2018-05-12 23:43:57'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-12', '2018-05-13', 'N', '2018-05-12 23:45:38'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-12', '2018-05-13', 'N', '2018-05-12 23:46:23'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 1, 5, '2018-05-12', '2018-05-13', 'Y', '2018-05-12 23:47:03'),
(0001, 'Giant Killing', 'ไพบูรณ์ วิธานธำรง', 1, 4, '2018-05-13', '2018-05-14', 'N', '2018-05-13 15:51:57'),
(0001, 'Giant Killing', 'ไพบูรณ์ วิธานธำรง', 2, 4, '2018-05-13', '2018-05-14', 'N', '2018-05-13 15:51:57'),
(0001, 'Giant Killing', 'ไพบูรณ์ วิธานธำรง', 1, 4, '2018-05-13', '2018-05-14', 'N', '2018-05-13 15:56:46'),
(0001, 'Giant Killing', 'ไพบูรณ์ วิธานธำรง', 2, 4, '2018-05-13', '2018-05-14', 'N', '2018-05-13 15:56:46'),
(0001, 'Giant Killing', 'ไพบูรณ์ วิธานธำรง', 1, 4, '2018-05-13', '2018-05-14', 'N', '2018-05-13 15:57:28'),
(0001, 'Giant Killing', 'ไพบูรณ์ วิธานธำรง', 2, 4, '2018-05-13', '2018-05-14', 'N', '2018-05-13 15:57:28'),
(0001, 'Giant Killing', 'ไพบูรณ์ วิธานธำรง', 1, 4, '2018-05-13', '2018-05-14', 'N', '2018-05-13 15:58:59'),
(0001, 'Giant Killing', 'ไพบูรณ์ วิธานธำรง', 2, 4, '2018-05-13', '2018-05-14', 'N', '2018-05-13 15:58:59'),
(0001, 'Giant Killing', 'ไพบูรณ์ วิธานธำรง', 1, 4, '2018-05-13', '2018-05-14', 'N', '2018-05-13 15:59:56'),
(0001, 'Giant Killing', 'ไพบูรณ์ วิธานธำรง', 2, 4, '2018-05-13', '2018-05-14', 'N', '2018-05-13 15:59:56'),
(0001, 'Giant Killing', 'ไพบูรณ์ วิธานธำรง', 1, 4, '2018-05-13', '2018-05-14', 'N', '2018-05-13 16:00:58'),
(0001, 'Giant Killing', 'ไพบูรณ์ วิธานธำรง', 2, 4, '2018-05-13', '2018-05-14', 'N', '2018-05-13 16:00:58'),
(0002, 'ศึกตำนาน 7 อัศวิน', 'ธวัชชัข ทองอุดม', 2, 5, '2018-05-14', '2018-05-15', 'Y', '2018-05-14 00:05:51'),
(0002, 'ศึกตำนาน 7 อัศวิน', 'ธวัชชัข ทองอุดม', 1, 5, '2018-05-14', '2018-05-15', 'Y', '2018-05-14 00:05:51'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 2, 5, '2018-05-14', '2018-05-15', 'Y', '2018-05-14 01:40:39'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 3, 5, '2018-05-14', '2018-05-15', 'Y', '2018-05-14 01:40:39'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 4, 5, '2018-05-14', '2018-05-15', 'Y', '2018-05-14 01:40:39'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 5, 5, '2018-05-14', '2018-05-15', 'Y', '2018-05-14 01:40:39'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 6, 5, '2018-05-14', '2018-05-15', 'Y', '2018-05-14 01:40:39'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 7, 5, '2018-05-14', '2018-05-15', 'Y', '2018-05-14 01:40:39'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 8, 5, '2018-05-14', '2018-05-15', 'Y', '2018-05-14 01:40:39'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 9, 5, '2018-05-14', '2018-05-15', 'Y', '2018-05-14 01:40:40'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 10, 5, '2018-05-14', '2018-05-15', 'Y', '2018-05-14 01:40:40'),
(0001, 'Baby Steps', 'ไพบูรณ์ วิธานธำรง', 11, 5, '2018-05-14', '2018-05-15', 'Y', '2018-05-14 01:40:40'),
(0002, '30000 ผู้กล้าสงครามวิบัติโลก', 'ธวัชชัข ทองอุดม', 1, 5, '2018-05-14', '2018-05-15', 'Y', '2018-05-14 14:34:39'),
(0002, '30000 ผู้กล้าสงครามวิบัติโลก', 'ธวัชชัข ทองอุดม', 2, 5, '2018-05-14', '2018-05-15', 'Y', '2018-05-14 14:34:39'),
(0002, '30000 ผู้กล้าสงครามวิบัติโลก', 'ธวัชชัข ทองอุดม', 3, 5, '2018-05-14', '2018-05-15', 'Y', '2018-05-14 14:34:39');

-- --------------------------------------------------------

--
-- Table structure for table `tb_customer`
--

CREATE TABLE `tb_customer` (
  `id` int(4) UNSIGNED ZEROFILL NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `idcard` char(13) NOT NULL,
  `mobiletel` int(10) UNSIGNED ZEROFILL DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `subarea` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `zipcode` int(5) UNSIGNED ZEROFILL DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Active',
  `regisdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_customer`
--

INSERT INTO `tb_customer` (`id`, `fullname`, `idcard`, `mobiletel`, `sex`, `email`, `birthday`, `age`, `address`, `subarea`, `area`, `province`, `zipcode`, `status`, `regisdate`) VALUES
(0001, 'ไพบูรณ์ วิธานธำรง', '1100800718027', 0862507512, 'ชาย', 'touchfn@gmail.com', '1991-06-08', 26, '697 ซ.โรงเจ ถ. เทอดไท 19', 'บางยี่เรือ', 'ธนบุรี', 'กรุงเทพมหานคร', 10600, 'Active', '2018-04-28 01:08:42'),
(0002, 'ธวัชชัข ทองอุดม', '1331000289686', 0865144169, 'ชาย', 'test@gmail.com', '1993-06-01', 24, '514', 'จักรวรรดิ', 'สัมพันธวงศ์', 'กรุงเทพมหานคร', 10100, 'Active', '2018-04-28 01:22:38');

-- --------------------------------------------------------

--
-- Table structure for table `tb_listbook`
--

CREATE TABLE `tb_listbook` (
  `id` int(5) UNSIGNED ZEROFILL NOT NULL,
  `namebook` varchar(50) NOT NULL,
  `author` varchar(30) NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `rentcount` int(11) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'ยังไม่จบ',
  `entdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_listbook`
--

INSERT INTO `tb_listbook` (`id`, `namebook`, `author`, `publisher`, `rentcount`, `status`, `entdate`) VALUES
(00001, 'สิงห์สนาม The Knight in The Area', 'HIROAKI IGANO', 'วิบูลย์กิจ', 6, 'ยังไม่จบ', '2018-04-25 23:08:30'),
(00002, 'Giant Killing', 'Tsujitomo / Masaya Tsunamoto', 'สยามอินเตอร์คอมิกส์', 11, 'ยังไม่จบ', '2018-04-25 23:13:53'),
(00003, 'Baby Steps', 'HIKARU KATSUKI', 'วิบูลย์กิจ', 68, 'ยังไม่จบ', '2018-04-27 20:00:05'),
(00004, 'ศึกตำนาน 7 อัศวิน', 'NAKABA SUZUKI', 'วิบูลย์กิจ', 5, 'จบแล้ว', '2018-05-06 22:02:54'),
(00005, '30000 ผู้กล้าสงครามวิบัติโลก', 'G.IX', 'สยามอินเตอร์คอมิกส์', 1, 'ยังไม่จบ', '2018-05-12 22:48:12');

-- --------------------------------------------------------

--
-- Table structure for table `tb_volbook`
--

CREATE TABLE `tb_volbook` (
  `id` int(5) UNSIGNED ZEROFILL NOT NULL,
  `namebook` varchar(50) NOT NULL,
  `vol` int(3) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(4) NOT NULL,
  `pathimg` varchar(100) DEFAULT NULL,
  `rentcount` int(3) NOT NULL DEFAULT '0',
  `entdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_volbook`
--

INSERT INTO `tb_volbook` (`id`, `namebook`, `vol`, `price`, `stock`, `pathimg`, `rentcount`, `entdate`) VALUES
(00001, 'สิงห์สนาม The Knight in The Area', 1, 55, 1, 'images/00001/00001-1.gif', 2, '2018-04-27 18:20:07'),
(00001, 'สิงห์สนาม The Knight in The Area', 2, 55, 1, 'images/00001/00001-2.gif', 2, '2018-04-27 18:45:52'),
(00001, 'สิงห์สนาม The Knight in The Area', 3, 55, 1, 'images/00001/00001-3.gif', 2, '2018-04-27 18:46:37'),
(00001, 'สิงห์สนาม The Knight in The Area', 4, 55, 1, 'images/00001/00001-4.gif', 0, '2018-04-27 18:55:13'),
(00001, 'สิงห์สนาม The Knight in The Area', 5, 55, 1, 'images/00001/00001-5.gif', 0, '2018-04-27 19:02:37'),
(00001, 'สิงห์สนาม The Knight in The Area', 6, 55, 1, 'images/00001/00001-6.gif', 0, '2018-04-27 19:04:39'),
(00001, 'สิงห์สนาม The Knight in The Area', 7, 55, 1, 'images/00001/00001-7.gif', 0, '2018-04-27 19:06:04'),
(00001, 'สิงห์สนาม The Knight in The Area', 8, 55, 1, 'images/00001/00001-8.gif', 0, '2018-04-27 19:06:56'),
(00001, 'สิงห์สนาม The Knight in The Area', 9, 55, 1, 'images/00001/00001-9.gif', 0, '2018-04-27 19:07:38'),
(00001, 'สิงห์สนาม The Knight in The Area', 10, 55, 1, 'images/00001/00001-10.gif', 0, '2018-04-27 19:08:41'),
(00001, 'สิงห์สนาม The Knight in The Area', 11, 55, 1, 'images/00001/00001-11.gif', 0, '2018-04-27 19:08:55'),
(00001, 'สิงห์สนาม The Knight in The Area', 12, 55, 1, 'images/00001/00001-12.gif', 0, '2018-04-27 19:09:33'),
(00001, 'สิงห์สนาม The Knight in The Area', 13, 55, 1, 'images/00001/00001-13.gif', 0, '2018-04-27 19:10:25'),
(00001, 'สิงห์สนาม The Knight in The Area', 14, 55, 1, 'images/00001/00001-14.gif', 0, '2018-04-27 19:12:34'),
(00001, 'สิงห์สนาม The Knight in The Area', 15, 55, 1, 'images/00001/00001-15.gif', 0, '2018-04-27 19:12:53'),
(00001, 'สิงห์สนาม The Knight in The Area', 16, 55, 1, 'images/00001/00001-16.gif', 0, '2018-04-27 19:15:45'),
(00001, 'สิงห์สนาม The Knight in The Area', 17, 55, 1, 'images/00001/00001-17.gif', 0, '2018-04-27 19:17:01'),
(00001, 'สิงห์สนาม The Knight in The Area', 18, 55, 1, 'images/00001/00001-18.gif', 0, '2018-04-27 19:18:08'),
(00001, 'สิงห์สนาม The Knight in The Area', 19, 55, 1, 'images/00001/00001-19.gif', 0, '2018-04-27 19:21:21'),
(00001, 'สิงห์สนาม The Knight in The Area', 20, 55, 1, 'images/00001/00001-20.gif', 0, '2018-04-27 19:22:25'),
(00001, 'สิงห์สนาม The Knight in The Area', 21, 55, 1, 'images/00001/00001-21.gif', 0, '2018-04-27 19:24:15'),
(00001, 'สิงห์สนาม The Knight in The Area', 22, 55, 1, 'images/00001/00001-22.gif', 0, '2018-04-27 19:24:50'),
(00001, 'สิงห์สนาม The Knight in The Area', 23, 55, 1, 'images/00001/00001-23.gif', 0, '2018-04-27 19:25:15'),
(00001, 'สิงห์สนาม The Knight in The Area', 24, 55, 1, 'images/00001/00001-24.gif', 0, '2018-04-27 19:26:15'),
(00001, 'สิงห์สนาม The Knight in The Area', 25, 55, 1, 'images/00001/00001-25.gif', 0, '2018-04-27 19:27:16'),
(00001, 'สิงห์สนาม The Knight in The Area', 26, 55, 1, 'images/00001/00001-26.gif', 0, '2018-04-27 19:28:06'),
(00001, 'สิงห์สนาม The Knight in The Area', 27, 50, 1, 'images/00001/00001-27.gif', 0, '2018-04-27 19:28:42'),
(00001, 'สิงห์สนาม The Knight in The Area', 28, 50, 1, 'images/00001/00001-28.gif', 0, '2018-04-27 19:35:41'),
(00001, 'สิงห์สนาม The Knight in The Area', 29, 55, 1, 'images/00001/00001-29.gif', 0, '2018-04-27 19:36:20'),
(00001, 'สิงห์สนาม The Knight in The Area', 30, 55, 1, 'images/00001/00001-30.gif', 0, '2018-04-27 19:36:46'),
(00001, 'สิงห์สนาม The Knight in The Area', 31, 55, 1, 'images/00001/00001-31.gif', 0, '2018-04-27 19:37:28'),
(00001, 'สิงห์สนาม The Knight in The Area', 32, 55, 1, 'images/00001/00001-32.gif', 0, '2018-04-27 19:37:43'),
(00003, 'Baby Steps', 1, 55, 0, 'images/00003/00003-1.gif', 16, '2018-04-27 20:03:18'),
(00003, 'Baby Steps', 2, 55, 0, 'images/00003/00003-2.gif', 9, '2018-04-27 20:03:38'),
(00003, 'Baby Steps', 3, 55, 0, 'images/00003/00003-3.gif', 9, '2018-04-27 20:03:42'),
(00003, 'Baby Steps', 4, 55, 0, 'images/00003/00003-4.gif', 8, '2018-04-27 20:03:46'),
(00003, 'Baby Steps', 5, 55, 0, 'images/00003/00003-5.gif', 8, '2018-04-27 20:03:48'),
(00003, 'Baby Steps', 6, 55, 0, 'images/00003/00003-6.gif', 5, '2018-04-27 20:03:50'),
(00003, 'Baby Steps', 7, 55, 0, 'images/00003/00003-7.gif', 4, '2018-04-27 20:03:53'),
(00003, 'Baby Steps', 8, 55, 0, 'images/00003/00003-8.gif', 3, '2018-04-27 20:03:55'),
(00003, 'Baby Steps', 9, 55, 0, 'images/00003/00003-9.gif', 3, '2018-04-27 20:03:58'),
(00003, 'Baby Steps', 10, 55, 0, 'images/00003/00003-10.gif', 2, '2018-04-27 20:04:01'),
(00003, 'Baby Steps', 11, 55, 0, 'images/00003/00003-11.gif', 2, '2018-04-27 20:07:38'),
(00003, 'Baby Steps', 12, 55, 1, 'images/00003/00003-12.gif', 1, '2018-04-27 20:07:40'),
(00002, 'Giant Killing', 1, 45, 1, 'images/00002/00002-1.gif', 8, '2018-04-27 20:15:54'),
(00001, 'สิงห์สนาม The Knight in The Area', 33, 55, 1, 'images/00001/00001-33.gif', 0, '2018-04-27 23:34:37'),
(00001, 'สิงห์สนาม The Knight in The Area', 34, 55, 1, 'images/00001/00001-34.gif', 0, '2018-04-27 23:35:42'),
(00001, 'สิงห์สนาม The Knight in The Area', 35, 55, 1, 'images/00001/00001-35.gif', 0, '2018-04-27 23:37:40'),
(00002, 'Giant Killing', 2, 45, 1, 'images/00002/00002-2.gif', 9, '2018-04-28 00:16:48'),
(00003, 'Baby Steps', 13, 65, 1, 'images/00003/00003-13.gif', 1, '2018-04-30 18:27:53'),
(00003, 'Baby Steps', 14, 65, 1, 'images/00003/00003-14.gif', 2, '2018-04-30 18:29:28'),
(00003, 'Baby Steps', 15, 65, 1, 'images/00003/00003-15.gif', 2, '2018-04-30 20:11:40'),
(00001, 'สิงห์สนาม The Knight in The Area', 36, 60, 1, 'images/00001/00001-36.gif', 0, '2018-04-30 20:12:20'),
(00003, 'Baby Steps', 16, 65, 1, 'images/00003/00003-16.gif', 2, '2018-04-30 20:14:27'),
(00004, 'ศึกตำนาน 7 อัศวิน', 1, 55, 0, 'images/00004/00004-1.gif', 5, '2018-05-06 22:03:25'),
(00004, 'ศึกตำนาน 7 อัศวิน', 2, 55, 1, 'images/00004/00004-2.gif', 1, '2018-05-09 13:35:28'),
(00004, 'ศึกตำนาน 7 อัศวิน', 3, 55, 1, 'images/00004/00004-3.gif', 0, '2018-05-12 22:41:39'),
(00004, 'ศึกตำนาน 7 อัศวิน', 4, 55, 1, 'images/00004/00004-4.gif', 0, '2018-05-12 22:41:45'),
(00004, 'ศึกตำนาน 7 อัศวิน', 5, 55, 1, 'images/00004/00004-5.gif', 0, '2018-05-12 22:41:48'),
(00004, 'ศึกตำนาน 7 อัศวิน', 6, 55, 1, 'images/00004/00004-6.gif', 0, '2018-05-12 22:41:50'),
(00004, 'ศึกตำนาน 7 อัศวิน', 7, 55, 1, 'images/00004/00004-7.gif', 0, '2018-05-12 22:41:53'),
(00004, 'ศึกตำนาน 7 อัศวิน', 8, 55, 1, 'images/00004/00004-8.gif', 0, '2018-05-12 22:41:55'),
(00004, 'ศึกตำนาน 7 อัศวิน', 9, 55, 1, 'images/00004/00004-9.gif', 0, '2018-05-12 22:42:03'),
(00004, 'ศึกตำนาน 7 อัศวิน', 10, 55, 1, 'images/00004/00004-10.gif', 0, '2018-05-12 22:42:05'),
(00004, 'ศึกตำนาน 7 อัศวิน', 11, 55, 1, 'images/00004/00004-11.gif', 0, '2018-05-12 22:42:10'),
(00004, 'ศึกตำนาน 7 อัศวิน', 12, 60, 1, 'images/00004/00004-12.gif', 0, '2018-05-12 22:42:18'),
(00005, '30000 ผู้กล้าสงครามวิบัติโลก', 1, 50, 0, 'images/00005/00005-1.gif', 1, '2018-05-12 22:48:29'),
(00005, '30000 ผู้กล้าสงครามวิบัติโลก', 2, 50, 0, 'images/00005/00005-2.gif', 1, '2018-05-12 22:48:36'),
(00005, '30000 ผู้กล้าสงครามวิบัติโลก', 3, 50, 0, 'images/00005/00005-3.gif', 1, '2018-05-12 22:48:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_account`
--
ALTER TABLE `tb_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account01` (`username`);

--
-- Indexes for table `tb_bookrent`
--
ALTER TABLE `tb_bookrent`
  ADD KEY `bookrent01` (`id`,`namebook`,`vol`,`status`) USING BTREE;

--
-- Indexes for table `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer01` (`idcard`,`fullname`,`id`) USING BTREE;

--
-- Indexes for table `tb_listbook`
--
ALTER TABLE `tb_listbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `listbook01` (`namebook`) USING BTREE;

--
-- Indexes for table `tb_volbook`
--
ALTER TABLE `tb_volbook`
  ADD KEY `volbook01` (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_account`
--
ALTER TABLE `tb_account`
  MODIFY `id` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_customer`
--
ALTER TABLE `tb_customer`
  MODIFY `id` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_listbook`
--
ALTER TABLE `tb_listbook`
  MODIFY `id` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
