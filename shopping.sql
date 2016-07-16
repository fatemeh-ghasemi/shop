-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 16, 2016 at 04:38 PM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'bracelet'),
(2, 'brooch'),
(3, 'earring'),
(4, 'ring'),
(5, 'necklace');

-- --------------------------------------------------------

--
-- Table structure for table `order1`
--

CREATE TABLE IF NOT EXISTS `order1` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL,
  `date` date NOT NULL,
  `status` enum('waiting','confirmed','preparing','posted') COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE IF NOT EXISTS `order_item` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `order_id` int(20) NOT NULL,
  `count` int(20) NOT NULL,
  `price` double NOT NULL,
  `product_id` int(20) NOT NULL,
  `returned` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL,
  `price` float NOT NULL,
  `situation` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `bank` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `order_id` int(20) NOT NULL,
  `accountnumber` int(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accountnumber` (`accountnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `price` double NOT NULL,
  `quantity` int(20) NOT NULL,
  `serialnumber` int(50) NOT NULL,
  `describtion` text COLLATE utf8_persian_ci NOT NULL,
  `category_id` int(20) NOT NULL,
  `status` set('visible','invisible') COLLATE utf8_persian_ci NOT NULL,
  `visit_count` int(11) NOT NULL,
  PRIMARY KEY (`id`,`serialnumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=56 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `quantity`, `serialnumber`, `describtion`, `category_id`, `status`, `visit_count`) VALUES
(54, 'سنجاق سینه -1', 1000, 3, 2147483647, 'سنجاق سینه طرح طاووس \r\nطلای سفید\r\n3.5گرم\r\n28 عدد نگین اتمی', 2, 'visible', 0),
(55, 'گردنبند_2', 2300, 2, 86357, '13گرم\r\nطلای سفید\r\nنگین اصل', 5, 'visible', 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_comment`
--

CREATE TABLE IF NOT EXISTS `product_comment` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL,
  `product_id` int(20) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` text COLLATE utf8_persian_ci NOT NULL,
  `status` enum('waiting','approved','reject') COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_picture`
--

CREATE TABLE IF NOT EXISTS `product_picture` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_persian_ci NOT NULL,
  `product_id` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=40 ;

--
-- Dumping data for table `product_picture`
--

INSERT INTO `product_picture` (`id`, `name`, `product_id`) VALUES
(38, '1468669145.jpg', 54),
(39, '1468672140.jpg', 55);

-- --------------------------------------------------------

--
-- Table structure for table `product_pin`
--

CREATE TABLE IF NOT EXISTS `product_pin` (
  `product_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_persian_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `role` enum('user','admin') COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`password`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `firstname`, `lastname`, `role`) VALUES
(2, 'maryam@gmail.com', '31a5371f27e0b475c0d967fa82861327908bdbb1', 'maryam', 'zare', 'user'),
(5, 'ali@gmail.com', '604d60eedbc1a1bc8f93cb9365034243937366bf', 'ali', 'ahmadi', 'user'),
(6, 'neda@gmail.com', '4b27cdd4df5a9dbcea0da019bb22aa39b6e58da8', 'neda', 'rangbar', 'user'),
(7, 'amir@gmail.com', 'cf65c72c109ab969c3056beb9ddb2307', 'امیر', 'مهدوی', 'user'),
(8, 'm@gmail.com', 'bc9741b15d519af9b654e15afd437f6d', 'mmm', 'lllll', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE IF NOT EXISTS `user_token` (
  `user_id` int(20) NOT NULL,
  `token` int(40) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`user_id`, `token`, `create_at`) VALUES
(7, 6, '2016-06-30 10:11:10');

-- --------------------------------------------------------

--
-- Table structure for table `view`
--

CREATE TABLE IF NOT EXISTS `view` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `product_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `date` date NOT NULL,
  `body` text COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
