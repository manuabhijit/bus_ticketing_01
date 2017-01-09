-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2015 at 03:31 PM
-- Server version: 5.6.26
-- PHP Version: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_reg_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `db_bus`
--

CREATE TABLE IF NOT EXISTS `db_bus` (
  `bus_name` varchar(50) NOT NULL,
  `bus_catagorie` varchar(8) NOT NULL,
  `seat_s1` int(11) NOT NULL,
  `seat_s2` int(11) NOT NULL,
  `seat_s3` int(11) NOT NULL,
  `seat_s4` int(11) NOT NULL,
  `bus_time` varchar(20) NOT NULL,
  `bus_cost` varchar(5) NOT NULL DEFAULT '150'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `db_bus`
--

INSERT INTO `db_bus` (`bus_name`, `bus_catagorie`, `seat_s1`, `seat_s2`, `seat_s3`, `seat_s4`, `bus_time`, `bus_cost`) VALUES
('BUS1', 'AC', 12, 13, 14, 14, 'Morning', '150'),
('BUS2', 'NON-AC', 15, 15, 15, 15, 'Afternoon', '150'),
('BUS3', 'SLP', 13, 13, 9, 9, 'Evening', '150'),
('BUS4', 'AC', 15, 13, 15, 15, 'Night', '150');

-- --------------------------------------------------------

--
-- Table structure for table `db_passenger`
--

CREATE TABLE IF NOT EXISTS `db_passenger` (
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Name` varchar(20) NOT NULL,
  `Age` varchar(2) NOT NULL,
  `ID_number` varchar(20) NOT NULL,
  `Source` varchar(10) NOT NULL,
  `Destination` varchar(10) NOT NULL,
  `Count` varchar(2) NOT NULL,
  `Bus` varchar(5) NOT NULL,
  `Cost` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `db_passenger`
--

INSERT INTO `db_passenger` (`TimeStamp`, `Name`, `Age`, `ID_number`, `Source`, `Destination`, `Count`, `Bus`, `Cost`) VALUES
('0000-00-00 00:00:00', 'Rakesh', '18', '131313', 'CHD', 'SHM', '1', '0', ''),
('2015-10-04 02:38:25', 'Abhijit', '1', '131307', '5', '1', '1', 'BUS1', '600'),
('2015-10-04 02:44:54', 'Abhijit', '1', '131307', '5', '1', '1', 'BUS1', '600'),
('2015-10-04 02:45:27', 'Abhijit', '1', '131307', '5', '1', '1', 'BUS1', '600'),
('2015-10-04 02:46:15', 'Abhijit', '1', '131307', '5', '1', '1', 'BUS1', '600'),
('2015-10-04 02:56:57', 'hhh', '2', 'nnn', '2', '3', '1', 'BUS4', '150'),
('2015-10-04 02:58:51', 'hhh', '2', 'nnn', '2', '3', '1', 'BUS4', '150'),
('2015-10-04 14:24:56', 'Parkhi', '3', '131303', '3', '5', '4', 'BUS3', '1200'),
('2015-10-04 16:43:22', 'RE', '3', 'FDF', '1', '5', '2', 'BUS3', '1200');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
