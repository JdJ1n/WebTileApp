-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 17, 2024 at 12:33 AM
-- Server version: 5.7.24
-- PHP Version: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tp2`
--

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `artist` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`id`, `name`, `artist`, `category_id`, `user_id`, `date`, `description`, `url`) VALUES
(1, 'Thriller', 'Michael Jackson', 1, 3, '1982-11-30', 'Best-selling album of all time.', 'https://example.com/images/thriller.jpg'),
(2, 'Back in Black', 'AC/DC', 2, 3, '1980-07-25', 'Second best-selling album of all time.', 'https://example.com/images/back_in_black.jpg'),
(3, 'The Dark Side of the Moon', 'Pink Floyd', 3, 3, '1973-03-01', 'One of the best-selling albums worldwide.', 'https://example.com/images/dark_side_of_the_moon.jpg'),
(4, 'The Bodyguard', 'Whitney Houston', 4, 3, '1992-11-17', 'Best-selling soundtrack album.', 'https://example.com/images/the_bodyguard.jpg'),
(5, 'Rumours', 'Fleetwood Mac', 5, 3, '1977-02-04', 'Classic rock album.', 'https://example.com/images/rumours.jpg'),
(6, 'Saturday Night Fever', 'Bee Gees', 6, 3, '1977-11-15', 'Best-selling soundtrack.', 'https://example.com/images/saturday_night_fever.jpg'),
(7, 'Hotel California', 'Eagles', 7, 3, '1976-12-08', 'Best-selling album in the US.', 'https://example.com/images/hotel_california.jpg'),
(8, '21', 'Adele', 8, 3, '2011-01-24', 'Best-selling album of the 21st century.', 'https://example.com/images/21.jpg'),
(9, 'Come On Over', 'Shania Twain', 9, 3, '1997-11-04', 'Best-selling country album.', 'https://example.com/images/come_on_over.jpg'),
(10, 'Abbey Road', 'The Beatles', 10, 3, '1969-09-26', 'Classic rock album by The Beatles.', 'https://example.com/images/abbey_road.jpg'),
(11, 'Born in the USA', 'Bruce Springsteen', 11, 3, '1984-06-04', 'One of Springsteen\'s most successful albums.', 'https://example.com/images/born_in_the_usa.jpg'),
(12, 'Bad', 'Michael Jackson', 1, 3, '1987-08-31', 'Follow-up to Thriller.', 'https://example.com/images/bad.jpg'),
(13, 'Jagged Little Pill', 'Alanis Morissette', 12, 3, '1995-06-13', 'Breakthrough album for Morissette.', 'https://example.com/images/jagged_little_pill.jpg'),
(14, 'Nevermind', 'Nirvana', 13, 3, '1991-09-24', 'Defined the grunge era.', 'https://example.com/images/nevermind.jpg'),
(15, 'Appetite for Destruction', 'Guns N\' Roses', 14, 3, '1987-07-21', 'Debut album by Guns N\' Roses.', 'https://example.com/images/appetite_for_destruction.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Pop'),
(2, 'Rock'),
(3, 'Progressive Rock'),
(4, 'Soundtrack'),
(5, 'Classic Rock'),
(6, 'Disco'),
(7, 'Country'),
(8, 'Soul'),
(9, 'Alternative Rock'),
(10, 'Hip Hop'),
(11, 'Jazz'),
(12, 'Blues'),
(13, 'Grunge'),
(14, 'Heavy Metal');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`) VALUES
(3, 'zangyilin1997@gmail.com', 'zangyilin1997@gmail.com', '$2b$10$QsQMU/WReyJx83WFYYeyO.5rAsK9Z6dcBQFAvSFquSAB8T9cJOAYe', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `card_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `card_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
