-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2015 at 05:39 AM
-- Server version: 5.6.11
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `project`
--
CREATE DATABASE IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `project`;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `station1`
--

CREATE TABLE IF NOT EXISTS `station1` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `station1`
--

INSERT INTO `station1` (`id`, `time`, `value`) VALUES
(1, '2015-11-23 03:17:10', 20),
(2, '2015-11-23 03:17:11', 20),
(3, '2015-11-23 03:17:12', 20),
(4, '2015-11-23 03:17:13', 20),
(5, '2015-11-23 03:17:14', 20),
(6, '2015-11-23 03:17:15', 20),
(7, '2015-11-23 03:17:16', 20),
(8, '2015-11-23 03:17:17', 20),
(9, '2015-11-23 03:17:18', 20),
(10, '2015-11-23 03:17:19', 20),
(11, '2015-11-23 03:17:20', 20);

-- --------------------------------------------------------

--
-- Table structure for table `station2`
--

CREATE TABLE IF NOT EXISTS `station2` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `station2`
--

INSERT INTO `station2` (`id`, `time`, `value`) VALUES
(1, '2015-11-23 03:17:10', 15),
(2, '2015-11-23 03:17:11', 20),
(3, '2015-11-23 03:17:12', 11),
(4, '2015-11-23 03:17:13', 15),
(5, '2015-11-23 03:17:14', 13),
(6, '2015-11-23 03:17:15', 10),
(7, '2015-11-23 03:17:17', 12),
(8, '2015-11-23 03:17:18', 12),
(9, '2015-11-23 03:17:19', 17),
(10, '2015-11-23 03:17:20', 20),
(11, '2015-11-23 03:17:21', 10),
(12, '2015-11-23 03:17:22', 7),
(13, '2015-11-23 03:17:23', 12);

-- --------------------------------------------------------

--
-- Table structure for table `station3`
--

CREATE TABLE IF NOT EXISTS `station3` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `station3`
--

INSERT INTO `station3` (`id`, `time`, `value`) VALUES
(1, '2015-11-23 03:17:10', 20),
(2, '2015-11-23 03:17:11', 17),
(3, '2015-11-23 03:17:12', 18),
(4, '2015-11-23 03:17:13', 15),
(5, '2015-11-23 03:17:14', 13),
(6, '2015-11-23 03:17:15', 10),
(7, '2015-11-23 03:17:16', 16),
(8, '2015-11-23 03:17:17', 13),
(9, '2015-11-23 03:17:18', 15),
(10, '2015-11-23 03:17:19', 10);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
