-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2017 at 10:23 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `accrevocompany`
--

-- --------------------------------------------------------

--
-- Table structure for table `companykey`
--

CREATE TABLE IF NOT EXISTS `companykey` (
`id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `partner_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companykey`
--

INSERT INTO `companykey` (`id`, `company_id`, `key`, `partner_id`) VALUES
(1, 8, '1234567890', 0),
(2, 7, '0987654321', 0),
(3, 5, '9999988888777776666655555', 0);

-- --------------------------------------------------------

--
-- Table structure for table `companys`
--

CREATE TABLE IF NOT EXISTS `companys` (
`id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id13` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `taxbr` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `comment` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contactperson` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contacttel` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` int(4) NOT NULL,
  `owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `partner` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companys`
--

INSERT INTO `companys` (`id`, `name`, `address`, `id13`, `taxbr`, `type`, `comment`, `contactperson`, `contacttel`, `year`, `owner`, `partner`, `code`, `created_at`, `updated_at`) VALUES
(5, 'AIMS Silom', '111 สีลม', '1111111111111', 'สนญ', 1, NULL, '1', '1', 2559, 'nus_nun_11@hotmail.com', '', 'aims2559', NULL, NULL),
(7, 'BCCFC', '25 สาทร กทม', '9876543210987', 'สนญ', 1, NULL, '1', '1', 2559, 'nus_nun_11@hotmail.com', '', 'bccfc2559', NULL, NULL),
(8, 'Fiveloop', '39 เจริญกรุง กทม', '1234567890987', '1', 1, NULL, '1', '1', 2559, 'fl@gmail.com', 'bbbbbbb', 'fl', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companykey`
--
ALTER TABLE `companykey`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companys`
--
ALTER TABLE `companys`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companykey`
--
ALTER TABLE `companykey`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `companys`
--
ALTER TABLE `companys`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
