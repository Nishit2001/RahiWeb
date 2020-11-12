-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2020 at 07:43 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `team rahi`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `number` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `tag_line` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` varchar(200) NOT NULL,
  `img_file` varchar(22) NOT NULL,
  `date` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `by` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`number`, `title`, `tag_line`, `slug`, `content`, `img_file`, `date`, `by`) VALUES
(1, 'my first post', 'first post like', 'my-first-pos', 'hello,friends this is my first pos', 'img/about-bg.jpg', '2020-10-07 16:00:58.849698', 'nishit pate'),
(2, 'this is second pos', 'second post be like', 'second-post', 'wdss', 'img/about-bg.jpg', '2020-10-07 17:40:40.870488', 'nishit pate'),
(3, 'this is second post', 'second post be like', 'second-post', 'nicd niciurec', 'img/about-bg.jpg', '2020-10-07 17:40:54.013579', 'my self'),
(5, 'this is third post', 'third post be like', 'third-post', 'nini nhnii', 'img/about-bg.jpg', '2020-10-07 17:42:51.242477', 'my self'),
(6, 'this is third pos', 'third post be like', 'third-post', 'nini nhnii', 'img/about-bg.jpg', '2020-10-07 17:43:43.605750', 'my self'),
(7, 'very la', 'vary last', 'last-one', 'hdbhujs', 'img/about-bg.jpg', '2020-11-06 13:20:11.996572', 'my self'),
(18, 'very last', 'vary last', 'my-firs', 'fgh', 'about-bg.jpg', '2020-11-06 13:49:54.583459', 'nishit pate');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `sno` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `phno` int(10) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`sno`, `Name`, `phno`, `date`, `email`) VALUES
(1, '', 0, '0000-00-00 00:00:00.000000', ''),
(0, 'Nishit Patel', 1234567890, '2020-11-06 12:56:04.563077', 'nishpatel1142@gmail.com'),
(0, 'Nishit Patel', 1234567890, '2020-11-06 12:56:35.639737', 'nishpatel1142@gmail.com'),
(0, 'ASHOKBHAI D PATEL', 1234567890, '2020-11-06 12:59:25.470579', 'nishpatel1142@gmail.com'),
(0, 'ASHOKBHAI D PATEL', 1234567890, '2020-11-06 13:00:46.615650', 'nishpatel1142@gmail.com'),
(0, 'ASHOKBHAI D PATEL', 1234567890, '2020-11-06 13:01:03.438504', 'nishpatel1142@gmail.com'),
(0, 'ASHOKBHAI D PATEL', 1234567890, '2020-11-06 13:04:43.794798', 'nishpatel1142@gmail.com'),
(0, 'ASHOKBHAI D PATEL', 1234567890, '2020-11-06 13:04:46.660164', 'nishpatel1142@gmail.com'),
(0, 'ASHOKBHAI D PATEL', 1234567890, '2020-11-06 13:05:03.320770', 'nishpatel1142@gmail.com'),
(0, 'ASHOKBHAI D PATEL', 1234567890, '2020-11-06 13:06:12.388602', 'nishpatel1142@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
