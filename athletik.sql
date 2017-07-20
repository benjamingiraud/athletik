-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 20, 2017 at 10:34 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for table `inscription`
--

CREATE TABLE `inscription` (
  `id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inscription`
--

INSERT INTO `inscription` (`id`, `meeting_id`, `user_id`) VALUES
(5, 8, 1),
(6, 8, 3),
(7, 8, 4),
(8, 8, 5),
(9, 8, 6),
(10, 8, 7),
(11, 8, 8),
(12, 8, 9),
(13, 8, 10),
(14, 8, 11),
(15, 8, 12),
(16, 8, 13),
(17, 8, 14),
(18, 8, 15),
(19, 8, 16),
(20, 8, 17),
(22, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE `meeting` (
  `id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `img` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `meeting`
--

INSERT INTO `meeting` (`id`, `name`, `description`, `date`, `img`) VALUES
(1, 'Peta Ouchnok', '', '2017-07-18', 'jacques.jpg'),
(2, 'Troufaillon Les oies', 'A Troufaillon Les oies, 5km de courses à travers fôret vous attendent!', '2017-07-28', 'troufaillon.jpg'),
(3, 'Jean-Jacques de compostel', 'Partant de Jean-Jacques de compostel, vous serez amené à courir au bord de la mer, à travers champs!', '2017-10-25', 'jacques.jpg'),
(4, 'Village en pain', 'A village en pain, c\'est sous, on l\'espère, une chaleur ecrasante que vous pourrez découvrir des villages d\'antan.', '2018-01-17', 'pain.jpg'),
(7, 'hey', 'hey', '2017-07-25', 'd46be96da19d6315a1554c9fe27b0981.png'),
(8, 'Testi', 'testo', '2017-06-20', '');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `meeting_id` int(11) DEFAULT NULL,
  `time` double NOT NULL,
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `user_id`, `meeting_id`, `time`, `points`) VALUES
(1, 3, 1, 2.48, 404),
(2, 4, 1, 3.45, 392),
(3, 5, 1, 2.39, 419),
(4, 6, 1, 2.45, 409),
(5, 7, 1, 3.2, 341),
(6, 8, 1, 3.56, 380),
(7, 10, 1, 2.56, 391),
(8, 11, 1, 3.25, 308),
(9, 9, 1, 3.12, 321),
(10, 12, 1, 4.2, 358),
(11, 13, 1, 4.3, 282),
(12, 14, 1, 5.2, 193),
(13, 15, 1, 2.3, 435),
(14, 16, 1, 3.12, 481),
(15, 17, 1, 4.59, 310),
(16, 18, 1, 2.53, 467),
(18, 1, 1, 2.2, 495);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ROLE_USER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `category`, `username`, `password`, `lastname`, `firstname`, `role`) VALUES
(1, 3, 'Benjamin', '$2y$13$lUWnJW0CcT0Q0P8Sevp5M.lZCfrP2YzA3wNncx2aPDLqg9LbUtzMC', 'GIRAUD', 'Benjamin', 'ROLE_ADMIN'),
(3, 2, 'JD', '$2y$13$4MvnLWKeIXssbKyQ73UB/ezE75X.WQP8EJh0.OsulIlYO4t3AymHO', 'Duss', 'Jean-Claude', 'ROLE_USER'),
(4, 1, 'BF', '$2y$13$aUdWaLYdORPwVB2XmsapFOj736hymHw/VcLOxC8jBRRM9useVR/Nm', 'Bibi', 'Lafrite', 'ROLE_USER'),
(5, 2, 'RC', '$2y$13$S.IMzEtHOh1XsodizuKyW.X.s.bT0fFpHAz0fcOeF3mU0sO.kGOGe', 'Robert', 'Camembert', 'ROLE_USER'),
(6, 2, 'CB', '$2y$13$ng03V3QxODFMkuqQR0FfDuPApk2MxFE8SigwGQrGVA3M9vbQsiZVi', 'Christine', 'Boutin', 'ROLE_USER'),
(7, 3, 'AH', '$2y$13$fLSgh69KUGfe4K6WvEIHRuD6N9sWyE6YLHvAACuQfSx998QVYYWLO', 'Albert', 'Heinstein', 'ROLE_USER'),
(8, 6, 'MT', '$2y$13$6mTl9ElxCtD.HYPR59wVD.oO73q60B.p68WcQAxo.nKMpwi7/3mOO', 'Marguaret', 'Thatcher', 'ROLE_USER'),
(9, 2, 'JC', '$2y$13$mm./pLKx5EBmWYfex8e4..PV53h9OJdDSlXGB0LSR9QHlzdzRdoee', 'Jules', 'Cesar', 'ROLE_USER'),
(10, 3, 'MI', '$2y$13$7medE/Q6yzFzFm7kq.QxZOGawT19CP8GCO1mhDF/5ypVJofukjZA.', 'Momo', 'Ise', 'ROLE_USER'),
(11, 2, 'SG', '$2y$13$EK0RMia3yKfjbYWo8yG6RucdqBpAGcZJHUOarksdjrhj86/rowmJ2', 'Sidharta', 'gautama', 'ROLE_USER'),
(12, 8, 'AH', '$2y$13$lXongL0YUAl8WcEpyop60OGGax4V49mZTtwvZ.bxjpVILaRmVesL.', 'Adolf', 'Hitler', 'ROLE_USER'),
(13, 5, 'OB', '$2y$13$ZHPv3EwbxEA6d3vzgtT0LemmOUzPro7hvfnP1EUw2whruUqtSlsUi', 'Oussama', 'Ben Laden', 'ROLE_USER'),
(14, 2, 'JH', '$2y$13$6.Fd4EmifInH9mUwHYxKOuzRhbNv6PbgXeQ92hKNy71DKGCnj5M6G', 'Jonnhy', 'Haliday', 'ROLE_USER'),
(15, 2, 'JB', '$2y$13$LQnZ8kAcdgEYeFb0KPu5quAXmZozYBgJLSHn59Q0w6DJchRwXfoQa', 'Justin', 'Bieber', 'ROLE_USER'),
(16, 8, 'NM', '$2y$13$uxMNU0/EUZ3e0T/nEeE4UepSwqIt8kWvdxFs/OyVTCAT8oH8HnSTu', 'Nicky', 'Minaj', 'ROLE_USER'),
(17, 7, 'LD', '$2y$13$6XGE4jSS6MmWC3RwMiYuFeGBQtWVOHmrNyexi6LIyC9gpf05DYE3i', 'Lionel', 'Duboeuf', 'ROLE_USER'),
(18, 4, 'PT', '$2y$13$vO9wfjsdY1yOFp9BSG3.OOLSTStzqLeZBZm8aYqQwuvikA1.LEY8m', 'Pika', 'Tchu', 'ROLE_USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_I_meetingID` (`meeting_id`),
  ADD KEY `FK_I_userID` (`user_id`);

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
  ADD KEY `meeting_id` (`meeting_id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

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
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `meeting`
--
ALTER TABLE `meeting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `FK_I_meetingID` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`),
  ADD CONSTRAINT `FK_I_userID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `FK_136AC11367433D9C` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`),
  ADD CONSTRAINT `FK_R_UserID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D64964C19C1` FOREIGN KEY (`category`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
