-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2020 at 03:42 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cams_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE `admin_table` (
  `User_name` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_table`
--

INSERT INTO `admin_table` (`User_name`, `Password`) VALUES
('yashwanth', '1724'),
('Satwik', '1902'),
('Rohan', '1425'),
('Darshini', '8899');

-- --------------------------------------------------------

--
-- Table structure for table `allotment_table`
--

CREATE TABLE `allotment_table` (
  `User_name` varchar(30) NOT NULL,
  `Allotmentapproved` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `applications_tables`
--

CREATE TABLE `applications_tables` (
  `User_name` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Rank` int(10) NOT NULL,
  `Marks` int(10) NOT NULL,
  `College_name` varchar(30) NOT NULL,
  `Status` varchar(10) NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `applications_tables`
--

INSERT INTO `applications_tables` (`User_name`, `Name`, `Rank`, `Marks`, `College_name`, `Status`) VALUES
('yashwanth', 'Yashwanth Chennu', 6845, 975, 'Jntuh', 'Yes'),
('Zoro', 'Zoro', 99, 988, 'Jntuh', 'Yes'),
('yashwanth', 'Yashwanth Chennu', 6845, 975, 'Jntuh', 'Yes'),
('yashwanth', 'Yashwanth Chennu', 6845, 975, 'ACE', 'No'),
('yashwanth', 'Yashwanth Chennu', 6845, 975, 'Mrits', 'No'),
('yashwanth', 'Yashwanth Chennu', 6845, 975, 'KPRIT', 'No'),
('yashwanth', 'Yashwanth Chennu', 6845, 975, 'Jntuh', 'Yes'),
('yashwanth', 'Yashwanth Chennu', 6845, 975, 'ACE', 'No'),
('yashwanth', 'Yashwanth Chennu', 6845, 975, 'Mrits', 'No'),
('yashwanth', 'Yashwanth Chennu', 6845, 975, 'KPRIT', 'No'),
('yashwanth', 'Yashwanth Chennu', 6845, 975, 'Jntuh', 'Yes'),
('yashwanth', 'Yashwanth Chennu', 6845, 975, 'ACE', 'No'),
('yashwanth', 'Yashwanth Chennu', 6845, 975, 'Vbit', 'No'),
('Zoro', 'Zoro', 99, 988, 'Jntuh', 'Yes'),
('Zoro', 'Zoro', 99, 988, 'ACE', 'No'),
('Zoro', 'Zoro', 99, 988, 'Mrits', 'No'),
('Zoro', 'Zoro', 99, 988, 'Vbit', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `approve_table`
--

CREATE TABLE `approve_table` (
  `User_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feepaid_students_tables`
--

CREATE TABLE `feepaid_students_tables` (
  `User_name` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `College_name` varchar(20) NOT NULL,
  `Card_number` varchar(10) NOT NULL,
  `CVV` int(3) NOT NULL,
  `Card_holder_name` varchar(30) NOT NULL,
  `Amount` int(10) NOT NULL,
  `Mobileno` varchar(30) NOT NULL,
  `Approved` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feepaid_students_tables`
--

INSERT INTO `feepaid_students_tables` (`User_name`, `Name`, `College_name`, `Card_number`, `CVV`, `Card_holder_name`, `Amount`, `Mobileno`, `Approved`) VALUES
('yashwanth', 'yashwanth', 'Jntuh', '78888899', 123, 'Yashwanth', 9000, '9090909090', 0),
('Zoro', 'Zoro', 'Jntuh', '9900899898', 123, 'Zoro', 8999, '9888719898', 0);

-- --------------------------------------------------------

--
-- Table structure for table `incharge_tables`
--

CREATE TABLE `incharge_tables` (
  `College_name` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Mobileno` varchar(30) NOT NULL,
  `User_name` varchar(10) NOT NULL,
  `Password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incharge_tables`
--

INSERT INTO `incharge_tables` (`College_name`, `Email`, `Mobileno`, `User_name`, `Password`) VALUES
('Jntuh', 'ramesh@gmail.com', '9088998989', 'ramesh', '1122'),
('ACE', 'ace@gmail.com', '1234567890', 'ace', 'ace'),
('Mrits', 'mrits@gmail.com', '9090909090', 'mritsSai', '1234'),
('Vbit', 'Vbit@gmail.com', '8989898998', 'Suresh', '1234'),
('AURP', 'aurp@gmail.com', '9098989898', 'Mitusha', '12345'),
('GCET', 'gcet@gmailcom', '6756565644', 'Sanji', '9090'),
('Vmtw', 'vmtw@gmail.com', '7878787878', 'Yagami', '1188'),
('KPRIT', 'kprit@gmail.com', '9000889998', 'Kurapika', '345345'),
('CVSR', 'cvsr@gmail.com', '9088667756', 'tessie', '9999'),
('KU', 'KU@gmail.com', '7990099987', 'Garp', '7766');

-- --------------------------------------------------------

--
-- Table structure for table `student_tables`
--

CREATE TABLE `student_tables` (
  `Name` varchar(30) NOT NULL,
  `Father_name` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Mobileno` varchar(10) NOT NULL,
  `Rank` int(11) NOT NULL,
  `Marks` int(11) NOT NULL,
  `User_name` varchar(10) NOT NULL,
  `Password` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_tables`
--

INSERT INTO `student_tables` (`Name`, `Father_name`, `Email`, `Mobileno`, `Rank`, `Marks`, `User_name`, `Password`) VALUES
('Yashwanth Chennu', 'rama', 'chennusuryapavan@gmail.com', '9133221528', 6845, 975, 'yashwanth', 1234),
('Zoro', 'Roronoa', 'Zoro@gmail.com', '8989898994', 99, 988, 'Zoro', 1234),
('Luffy', 'Dragon', 'luffy@gmail.com', '9133221528', 12, 98, 'Luffy', 123),
('Nami', 'Grap', 'Nami@gmail.com', '778878787', 10, 990, 'Nami', 9090),
('Ussop', 'Yassop', 'Ussop@gmail.com', '786756453', 2, 998, 'Ussop', 9090),
('Sathwik', 'Shekher', 'sathwik@gmail.com', '6767676767', 10, 89, 'Sathwik', 9090),
('Dharshini', 'Ramu', 'Dharshini@gmail.com', '676798989', 15, 909, 'Dharshini', 889),
('Rohan', 'Mohan', 'Rohan@gmail.com', '7676756677', 898, 898, 'Rohan', 485),
('Ashwin', 'Sreeeram', 'Ashwin@gmail.com', '899988899', 890, 991, 'Ashwin', 1523),
('vineeth', 'Ramesh', 'vineeth@gmail.com', '7878887765', 98, 900, 'vineeth', 8990),
('Narasimha', 'Rajesh', 'Narasimha@gmail.com', '778877889', 60, 987, 'Narasimha', 876),
('Tarun', 'Suresh', 'Tarun@gmail.com', '7899665879', 786, 995, 'Tarun', 9087),
('Narender', 'Ashok', 'Narender@gmail.com', '9088998989', 990, 898, 'Narender', 8988),
('Aditya', 'Govind', 'aditya@gmail.com', '776677688', 899, 800, 'Aditya', 7788);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
