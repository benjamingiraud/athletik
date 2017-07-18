-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 18, 2017 at 04:39 PM
-- Server version: 5.7.18-0ubuntu0.17.04.1
-- PHP Version: 7.0.18-0ubuntu0.17.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `athletik`
--

-- --------------------------------------------------------

--
-- Table structure for table `athlete`
--

CREATE TABLE `athlete` (
  `id` int(11) NOT NULL,
  `firstname` varchar(128) NOT NULL,
  `lastname` varchar(128) NOT NULL,
  `birthdate` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `athlete`
--

INSERT INTO `athlete` (`id`, `firstname`, `lastname`, `birthdate`) VALUES
(1, 'Jean Claude', 'Duss', 1985),
(2, 'Bibi', 'Lafrite', 1965),
(3, 'Robert', 'Camembert', 1989),
(4, 'Christine', 'Boutin', 1992),
(5, 'Albert', 'Heinstein', 1995),
(6, 'Marguaret', 'Thatcher', 2003),
(7, 'Jules', 'Cesar', 1991),
(8, 'Momo', 'Ise', 1997),
(9, 'Sidharta', 'gautama', 1991),
(10, 'Adolf', 'Hitler', 2006),
(11, 'Oussama', 'Ben Laden', 2001),
(12, 'Jonnhy', 'Haliday', 1989),
(13, 'Justin', 'Bieber', 1982),
(14, 'Nicky', 'Minaj', 2006),
(15, 'Lionel', 'Duboeuf', 2004),
(16, 'Pika', 'Tchu', 1999);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Masters'),
(2, 'Seniors'),
(3, 'Espoirs'),
(4, 'Juniors'),
(5, 'Cadets'),
(6, 'Minimes'),
(7, 'Benjamins'),
(8, 'Poussins');

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE `meeting` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `img` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meeting`
--

INSERT INTO `meeting` (`id`, `name`, `description`, `date`, `img`) VALUES
(1, 'Peta Ouchnok', '', '2017-07-18', ''),
(2, 'Troufaillon Les oies', 'A Troufaillon Les oies, 5km de courses à travers fôret vous attendent!', '2017-07-28', 'troufaillon.jpg'),
(3, 'Jean-Jacques de compostel', 'Partant de Jean-Jacques de compostel, vous serez amené à courir au bord de la mer, à travers champs!', '2017-10-25', 'jacques.jpg'),
(4, 'Village en pain', 'A village en pain, c\'est sous, on l\'espère, une chaleur ecrasante que vous pourrez découvrir des villages d\'antan.', '2018-01-17', 'pain.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `athlete_id` int(11) NOT NULL,
  `time` float NOT NULL,
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `meeting_id`, `athlete_id`, `time`, `points`) VALUES
(1, 1, 1, 2.48, 404),
(2, 1, 2, 3.45, 392),
(3, 1, 3, 2.39, 419),
(4, 1, 4, 2.45, 409),
(5, 1, 5, 3.2, 341),
(6, 1, 6, 3.56, 380),
(7, 1, 8, 2.56, 391),
(8, 1, 9, 3.25, 308),
(9, 1, 7, 3.12, 321),
(10, 1, 10, 4.2, 358),
(11, 1, 11, 4.3, 282),
(12, 1, 12, 5.2, 193),
(13, 1, 13, 2.3, 435),
(14, 1, 14, 3.12, 481),
(15, 1, 15, 4.59, 310),
(16, 1, 16, 2.53, 467);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `lastname`, `firstname`, `category`) VALUES
(1, 'Benjamin', '$2y$13$lUWnJW0CcT0Q0P8Sevp5M.lZCfrP2YzA3wNncx2aPDLqg9LbUtzMC', 'GIRAUD', 'Benjamin', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `athlete`
--
ALTER TABLE `athlete`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `athlete_id` (`athlete_id`),
  ADD KEY `meeting_id` (`meeting_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_CategoryID` (`category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `athlete`
--
ALTER TABLE `athlete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `meeting`
--
ALTER TABLE `meeting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`id`),
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_CategoryID` FOREIGN KEY (`category`) REFERENCES `category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
