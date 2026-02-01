-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 31, 2026 at 06:01 PM
-- Server version: 11.8.3-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u230613536_EvanForumProj`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers_table`
--

CREATE TABLE `answers_table` (
  `answerid` int(20) NOT NULL,
  `userid` int(20) NOT NULL,
  `questionid` varchar(100) NOT NULL,
  `answer` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers_table`
--

INSERT INTO `answers_table` (`answerid`, `userid`, `questionid`, `answer`, `created_at`) VALUES
(1, 3, '7ea1be1b-ca72-4a22-8e85-7ea83b5e8aca', 'It has not been deployed yet.', '2026-01-30 01:31:52'),
(2, 3, '7ea1be1b-ca72-4a22-8e85-7ea83b5e8aca', 'It has not been deployed yet.', '2026-01-30 01:57:21'),
(3, 2, '7ea1be1b-ca72-4a22-8e85-7ea83b5e8aca', 'it is remarkable', '2026-01-30 23:15:51'),
(4, 4, '0ab88e14-1ef6-4966-a545-a2c2548fe59d', 'Copilot is the one I recommend.', '2026-01-31 16:38:41');

-- --------------------------------------------------------

--
-- Table structure for table `answer_comments`
--

CREATE TABLE `answer_comments` (
  `commentid` int(20) NOT NULL,
  `answerid` int(20) NOT NULL,
  `userid` int(20) NOT NULL,
  `comment` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answer_comments`
--

INSERT INTO `answer_comments` (`commentid`, `answerid`, `userid`, `comment`, `created_at`) VALUES
(1, 1, 3, 'Great!', '2026-01-30 01:53:45'),
(2, 1, 3, 'Great!', '2026-01-30 01:54:21'),
(3, 1, 3, 'Great!', '2026-01-30 01:56:35'),
(4, 2, 3, 'Ok!', '2026-01-30 01:57:34'),
(5, 2, 2, 'alright!', '2026-01-30 23:15:18'),
(6, 4, 4, 'Alright!', '2026-01-31 16:39:01');

-- --------------------------------------------------------

--
-- Table structure for table `answer_likes`
--

CREATE TABLE `answer_likes` (
  `id` int(20) NOT NULL,
  `answerid` int(20) DEFAULT NULL,
  `userid` int(20) NOT NULL,
  `type` enum('like','comment','dislike') NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions_Table`
--

CREATE TABLE `questions_Table` (
  `id` int(20) NOT NULL,
  `questionid` varchar(100) NOT NULL,
  `userid` int(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `tags` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions_Table`
--

INSERT INTO `questions_Table` (`id`, `questionid`, `userid`, `title`, `description`, `tags`, `created_at`) VALUES
(1, '0ab88e14-1ef6-4966-a545-a2c2548fe59d', 1, 'what is your favorite AI', 'you can prefer from open AI', NULL, '2026-01-29 02:05:36'),
(2, '7ea1be1b-ca72-4a22-8e85-7ea83b5e8aca', 1, 'Feedback', 'How is our feedback for Evan forum project', NULL, '2026-01-30 00:39:02');

-- --------------------------------------------------------

--
-- Table structure for table `users_Table`
--

CREATE TABLE `users_Table` (
  `userid` int(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_Table`
--

INSERT INTO `users_Table` (`userid`, `username`, `firstname`, `lastname`, `email`, `password`, `created_at`) VALUES
(1, 'Wednesday', 'Wed26', 'Jan', 'Wed26@email.com', '$2b$10$jFcIPLRifzwVOwJ9EIWj9.BtNhIC1YqiMMVyto1t68m3ikfLesxAO', '2026-01-29 02:02:11'),
(2, 'ante', 'ante', 'w', 'ante@email.com', '$2b$10$3gk0H5ZiB./v/Av.7/N7pe0ViBIO69L0iL9uyf3tS3NBACYXwu2ha', '2026-01-30 00:43:34'),
(3, 'nu', 'Nu', 'Na', 'nu@example.com', '$2b$10$SguQoX24NQoM.HF4QLejVuy3P4.sDnIQxOM26NTD5K/GFFvfcpt6K', '2026-01-30 01:23:53'),
(4, 'evangadi', 'evan', 'gadi', 'evangadi@email.com', '$2b$10$FPfkmAM4NfGYmY.rrhfmDOQsF/ufy1NzCaFFVFrEGTDHv5oQkcFR2', '2026-01-31 16:37:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers_table`
--
ALTER TABLE `answers_table`
  ADD PRIMARY KEY (`answerid`),
  ADD KEY `questionid` (`questionid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `answer_comments`
--
ALTER TABLE `answer_comments`
  ADD PRIMARY KEY (`commentid`),
  ADD KEY `answerid` (`answerid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `answer_likes`
--
ALTER TABLE `answer_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answerid` (`answerid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `questions_Table`
--
ALTER TABLE `questions_Table`
  ADD PRIMARY KEY (`id`,`questionid`),
  ADD UNIQUE KEY `questionid` (`questionid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `users_Table`
--
ALTER TABLE `users_Table`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers_table`
--
ALTER TABLE `answers_table`
  MODIFY `answerid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `answer_comments`
--
ALTER TABLE `answer_comments`
  MODIFY `commentid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `answer_likes`
--
ALTER TABLE `answer_likes`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions_Table`
--
ALTER TABLE `questions_Table`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_Table`
--
ALTER TABLE `users_Table`
  MODIFY `userid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers_table`
--
ALTER TABLE `answers_table`
  ADD CONSTRAINT `answers_table_ibfk_1` FOREIGN KEY (`questionid`) REFERENCES `questions_Table` (`questionid`),
  ADD CONSTRAINT `answers_table_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users_Table` (`userid`);

--
-- Constraints for table `answer_comments`
--
ALTER TABLE `answer_comments`
  ADD CONSTRAINT `answer_comments_ibfk_1` FOREIGN KEY (`answerid`) REFERENCES `answers_table` (`answerid`) ON DELETE CASCADE,
  ADD CONSTRAINT `answer_comments_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users_Table` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `answer_likes`
--
ALTER TABLE `answer_likes`
  ADD CONSTRAINT `answer_likes_ibfk_1` FOREIGN KEY (`answerid`) REFERENCES `answers_table` (`answerid`) ON DELETE CASCADE,
  ADD CONSTRAINT `answer_likes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users_Table` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `questions_Table`
--
ALTER TABLE `questions_Table`
  ADD CONSTRAINT `questions_Table_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users_Table` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
