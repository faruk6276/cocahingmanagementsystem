-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2021 at 11:56 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cims`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `sid` varchar(15) NOT NULL,
  `date` date NOT NULL,
  `timing` varchar(20) NOT NULL,
  `eid` varchar(14) NOT NULL,
  `batch` varchar(14) NOT NULL,
  `status` varchar(5) NOT NULL,
  `subject` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `sid`, `date`, `timing`, `eid`, `batch`, `status`, `subject`) VALUES
(1, 'ST1000', '2018-06-05', '10:00am-11:00am', 'E10002', '1001', 'p', 'chem'),
(2, 'ST1000', '2018-06-05', '11:00am-12:00pm', 'E10002', '1001', 'a', 'maths'),
(3, 'ST1000', '2018-06-06', '1:30am-2:30pm', 'E10003', '1001', 'p', 'Physics'),
(4, 'ST1000', '2018-06-25', '11:00am-12:00pm', 'E10003', '1001', 'p', 'Physics'),
(32, 'ST1000', '2018-07-01', '10:00am-11:00am', 'E10004', '1001', 'a', 'physics'),
(33, 'ST1001', '2018-07-01', '10:00am-11:00am', 'E10003', '1001', 'p', 'physics'),
(34, 'ST1000', '2021-03-28', '2:00pm-4:00pm', 'E10004', '1001', 'a', 'physics'),
(35, 'ST1001', '2021-03-28', '2:00pm-4:00pm', 'E10004', '1001', 'a', 'physics');

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` int(11) NOT NULL,
  `batch` varchar(30) NOT NULL,
  `timings` varchar(50) NOT NULL,
  `year` varchar(20) NOT NULL DEFAULT '2018',
  `class` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `batch`, `timings`, `year`, `class`) VALUES
(1, '1001', '10:00am-12:00pm', '2021', 6),
(2, '1002', '10:00am-12:00pm', '2021', 7),
(3, '1003', '2:00pm-4:00pm', '2021', 8),
(4, '1004', '2:00am-4:00pm', '2021', 9),
(5, '1005', '4:00am-6:00pm', '2021', 10),
(6, '1010', '2:00pm-4:00pm', '2021', 10);

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL,
  `eid` varchar(20) NOT NULL,
  `teacher_type` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `batch` varchar(20) NOT NULL,
  `subject` varchar(300) NOT NULL,
  `complaint` varchar(1000) NOT NULL,
  `reply` varchar(1000) NOT NULL,
  `dateofcomp` date NOT NULL,
  `dateofreply` date NOT NULL,
  `replyed` varchar(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`id`, `eid`, `teacher_type`, `username`, `batch`, `subject`, `complaint`, `reply`, `dateofcomp`, `dateofreply`, `replyed`) VALUES
(3, 'E10001', 'admin', 'ST1000', '1001', 'sahfkajsf', 'ksfadsflhas', 'kjhn', '2018-06-17', '2018-07-12', '1'),
(4, 'E10001', 'admin', 'P1000', '1001', 'hi', 'hihihi', '', '2018-06-26', '0000-00-00', '0'),
(5, 'E10001', 'admin', 'E10003', '', 'asdgf', 'glfasd', '', '2018-07-01', '0000-00-00', '0'),
(6, 'E10002', 'mentor', 'ST1001', '1001', 'bharat', 'bharat afaewak asda', '', '2018-07-04', '0000-00-00', '0'),
(7, 'E10001', 'admin', 'E10004', '', 'just to test hod', 'just to test hod secton', '', '2018-07-04', '0000-00-00', '0'),
(11, 'E10001', 'admin', 'ST1001', '1001', 'bah', 'sjjhagsjd', '', '2018-07-13', '0000-00-00', '0'),
(14, 'E10001', 'admin', 'E10002', '', 'ddgdf', 'fgf', '', '2021-03-28', '0000-00-00', '0'),
(15, 'E10001', 'admin', 'E10002', '', 'ddgdf', 'fgf', '', '2021-03-28', '0000-00-00', '0'),
(16, 'E10001', 'admin', 'ST1000', '1001', 'ddgdf', 'dfddfg', '', '2021-04-03', '0000-00-00', '0'),
(18, 'E10001', 'admin', 'ST1000', '1001', 'Math', 'uytgtgfdgfhg', '', '2021-04-03', '0000-00-00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `examname` varchar(20) NOT NULL,
  `batch` varchar(10) NOT NULL,
  `dateofexam` date NOT NULL,
  `course` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `examname`, `batch`, `dateofexam`, `course`) VALUES
(1, '1st', '1001', '2018-06-10', 'IIT'),
(2, '2nd', '1001', '2018-06-11', 'IIT'),
(3, 'Mid term', '1001', '2021-03-29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` int(11) NOT NULL,
  `sid` varchar(20) NOT NULL,
  `subject` varchar(20) NOT NULL,
  `examname` varchar(30) NOT NULL,
  `marksobtain` varchar(20) NOT NULL,
  `totalmarks` varchar(20) NOT NULL,
  `eid` varchar(20) NOT NULL,
  `batch` varchar(20) NOT NULL,
  `dateofexam` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`id`, `sid`, `subject`, `examname`, `marksobtain`, `totalmarks`, `eid`, `batch`, `dateofexam`) VALUES
(1, 'ST1000', 'Physics', '1st', '9.5', '10', 'E10003', '1001', '2018-06-10'),
(3, 'ST1000', 'chemistry', '1st', '6', '10', 'E10001', '1001', '2018-06-10'),
(4, 'ST1000', 'Maths', '1st', '4', '10', 'E10002', '1001', '2018-06-10'),
(7, 'ST1001', 'physics', '1st', '0', '10', 'E10003', '1001', '2018-06-10'),
(8, 'ST1000', 'physics', '2nd', '9.6', '10', 'E10003', '1001', '2018-06-11'),
(9, 'ST1001', 'physics', '2nd', '9.0', '10', 'E10003', '1001', '2018-06-11'),
(12, 'ST1001', 'maths', '1st', '10', '10', 'E10002', '1001', '2018-06-10'),
(13, 'ST1000', 'maths', '2nd', '10', '10', 'E10002', '1001', '2018-06-11'),
(14, 'ST1001', 'maths', '2nd', '10', '10', 'E10002', '1001', '2018-06-11');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(11) NOT NULL,
  `batch` varchar(20) NOT NULL,
  `notice` varchar(256) NOT NULL,
  `subject` varchar(20) NOT NULL,
  `notice_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `batch`, `notice`, `subject`, `notice_date`) VALUES
(1, '1001', 'Hi how are you guys', 'physics', '2021-03-29'),
(2, '1001', 'Hi how are you guys', 'physics', '2021-03-29');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `sid` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(500) NOT NULL,
  `district` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `postalcode` varchar(10) NOT NULL,
  `fee` varchar(10) NOT NULL,
  `paidfee` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `batch` varchar(20) NOT NULL,
  `class` varchar(10) NOT NULL,
  `fathername` varchar(50) NOT NULL,
  `fathermob` varchar(15) NOT NULL,
  `fatheroccu` varchar(20) NOT NULL,
  `mothername` varchar(50) NOT NULL,
  `mothermob` varchar(15) NOT NULL,
  `motheroccu` varchar(20) NOT NULL,
  `mentor` varchar(10) NOT NULL,
  `timing` varchar(20) NOT NULL,
  `dateofreg` date NOT NULL,
  `pid` varchar(10) NOT NULL,
  `dateofleft` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `sid`, `fname`, `lname`, `email`, `phone`, `address`, `district`, `state`, `postalcode`, `fee`, `paidfee`, `status`, `batch`, `class`, `fathername`, `fathermob`, `fatheroccu`, `mothername`, `mothermob`, `motheroccu`, `mentor`, `timing`, `dateofreg`, `pid`, `dateofleft`) VALUES
(1, 'ST1000', 'Monirul', 'islam', 'monirul@gmail.com', '9999999999', 'plot no. 300 4s colony', 'bogura', 'rajshahi', '302013', '100002', '10000', 'yes', '1001', '6', 'xxxxx xxxxx', '0000000000', 'businessmen', 'xxxxx xxxxx', '000000000', 'houserwife', 'E10002', '10:00am-2:00pm', '2018-06-05', 'P1000', '0000-00-00'),
(2, 'ST1001', 'Monirul', 'islam', 'monirul@gmail.com', '9999999999', 'plot no. 300 4s colony', 'bogura', 'rajasthanrajshahi', '302013', '100002', '10000', 'yes', '1001', '6', 'xxxxx xxxxx', '0000000000', 'businessmen', 'xxxxx xxxxx', '000000000', 'houserwife', 'E10002', '10:00am-2:00pm', '2018-06-05', 'P1001', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `eid` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `postalcode` varchar(20) NOT NULL,
  `salary` varchar(20) NOT NULL,
  `position` varchar(20) NOT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `dateofjoining` date NOT NULL,
  `experience` varchar(20) NOT NULL,
  `highestqualification` varchar(20) NOT NULL,
  `highestqualificationmarks` varchar(20) NOT NULL,
  `batchmentor` varchar(20) DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `eid`, `fname`, `lname`, `email`, `mobile`, `address`, `city`, `state`, `postalcode`, `salary`, `position`, `subject`, `dateofjoining`, `experience`, `highestqualification`, `highestqualificationmarks`, `batchmentor`, `status`) VALUES
(2, 'E10001', 'Monirul', 'islam', 'monirul@gmail.com', '8888888888', 'bogura', 'bogura', 'rajshahi', '302013', '10000', 'admin', '', '2018-06-07', '3Y', 'B-Tech', '100', '', 'yes'),
(4, 'E10004', 'Monirul', 'islam', 'monirul@gmail.com', '8888888888', 'bogura', 'bogura', 'rajshahi', '302013', '10000', 'teacher', 'physics', '2018-06-07', '2Y', 'B-Tech', '100', '', 'yes'),
(5, 'E10000', 'Monirul', 'islam', 'monirul@gmail.com', '8888888888', 'bogura', 'bogura', 'rajshahi', '302013', '10000', 'sadmin', '', '2018-06-07', '2Y', 'B-Tech', '100', '', 'yes'),
(6, 'E10005', 'asdasd', 'gkhgh', 'jkhghgk@gmail.com', '7777777777', 'gkhg', 'hgk', 'ghk', '9999', '1000', 'admin', '', '2018-07-15', '2Y', 'Bteau', '100', '', 'yes'),
(7, 'E10006', 'Al momin', 'Faruk', 'Hilton627681@gmail.com', '01761172191', 'Bangladesh', 'Dhaka', 'Bangladeshi', '6570', '1000', 'admin', NULL, '2021-03-26', '2yr', 'BSc', '500', NULL, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `tea_attendance`
--

CREATE TABLE `tea_attendance` (
  `id` int(11) NOT NULL,
  `eid` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `timetocome` varchar(20) NOT NULL,
  `timetogo` varchar(20) NOT NULL,
  `bywhom` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tea_attendance`
--

INSERT INTO `tea_attendance` (`id`, `eid`, `date`, `timetocome`, `timetogo`, `bywhom`, `status`) VALUES
(1, 'E10003', '2018-06-27', '10:00am', '8:00pm', 'E10001', 'p'),
(2, 'E10004', '2018-07-04', '10:00am', '8:00pm', 'E10001', 'p'),
(3, 'E10002', '2018-07-12', '10am', '2pm', 'E10001', 'p'),
(5, 'E10003', '2021-03-28', '10', '1', 'E10001', 'p'),
(6, 'E10002', '2021-03-28', '10', '1', 'E10001', 'p');

-- --------------------------------------------------------

--
-- Table structure for table `tea_batche`
--

CREATE TABLE `tea_batche` (
  `id` int(11) NOT NULL,
  `batch` varchar(10) NOT NULL,
  `eid` varchar(10) NOT NULL,
  `subject` varchar(10) NOT NULL,
  `center` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tea_batche`
--

INSERT INTO `tea_batche` (`id`, `batch`, `eid`, `subject`, `center`) VALUES
(1, '1001', 'E10004', 'physics', 'jaipur1'),
(2, '1001', 'E10002', 'maths', 'jaipur1');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `id` int(11) NOT NULL,
  `batch` varchar(20) NOT NULL,
  `subject` varchar(20) NOT NULL,
  `timing` varchar(20) NOT NULL,
  `eid` varchar(20) NOT NULL,
  `day` varchar(20) NOT NULL,
  `year` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`id`, `batch`, `subject`, `timing`, `eid`, `day`, `year`) VALUES
(1, '1001', 'maths', '10:00am-11:00am', 'E10002', 'Thursday', '2018'),
(2, '1001', 'physics', '10:00am-11:00am', 'E10004', 'Thursday', '2018'),
(3, '1001', 'maths', '10:00am-11:00am', 'E10002', 'Friday', '2018'),
(4, '1001', 'physics', '2:00pm-4:00pm', 'E10004', 'Sunday', '2021');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `type` varchar(10) NOT NULL,
  `status` varchar(5) NOT NULL DEFAULT 'Yes'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `type`, `status`) VALUES
(1, 'E10000', 'monirul', 'sadmin', 'Yes'),
(2, 'E10001', 'monirul', 'admin', 'Yes'),
(4, 'ST1000', 'monirul', 'student', 'Yes'),
(5, 'P1000', 'monirul', 'parent', 'Yes'),
(7, 'ST1001', 'monirul', 'student', 'Yes'),
(8, 'E10004', 'monirul', 'teacher', 'Yes'),
(11, 'E10005', 'monirul', 'admin', 'Yes'),
(20, 'E10006', 'E10006', 'admin', 'Yes'),
(22, 'E10007', 'E10007', 'admin', 'No'),
(23, 'E10008', 'E10008', 'admin', 'Yes'),
(24, 'E10009', 'E10009', 'admin', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `name` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `name`) VALUES
(2, 'yt1s.com - Motivational video  This will change your mind  whatsapp 30 sec video _v144P.mp4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `batch` (`batch`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sid` (`sid`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `eid` (`eid`);

--
-- Indexes for table `tea_attendance`
--
ALTER TABLE `tea_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tea_batche`
--
ALTER TABLE `tea_batche`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tea_attendance`
--
ALTER TABLE `tea_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tea_batche`
--
ALTER TABLE `tea_batche`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
