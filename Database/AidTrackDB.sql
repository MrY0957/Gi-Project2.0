-- SQLBook: Code
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 12, 2026 at 03:56 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `AidTrackDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `Disaster`
--

CREATE TABLE `Disaster` (
  `disaster_id` int(11) NOT NULL,
  `disaster_name` varchar(100) NOT NULL,
  `disaster_type` varchar(50) NOT NULL,
  `laction` varchar(150) NOT NULL,
  `start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Disaster`
--

INSERT INTO `Disaster` (`disaster_id`, `disaster_name`, `disaster_type`, `laction`, `start_date`) VALUES
(1, 'Flood Sylhet', 'Flood', 'Sylhet, Sunamganj', '2026-06-15'),
(2, 'Cyclone Remal', 'Cyclone', 'Shatkhira, Khulna', '2026-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `Donation`
--

CREATE TABLE `Donation` (
  `donation_id` int(11) NOT NULL,
  `donor_type` enum('NGO','Government','UN agencies') NOT NULL,
  `donor_name` varchar(100) NOT NULL,
  `resource_type` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Donation`
--

INSERT INTO `Donation` (`donation_id`, `donor_type`, `donor_name`, `resource_type`, `quantity`, `unit`) VALUES
(301, 'UN agencies', 'WFP (World Food Programme)', 'Food', 5000, 'KG'),
(302, 'NGO', 'BRAC', 'Medicine', 200, 'Boxes'),
(303, 'Government', 'Disaster Management Ministry', 'Cash', 500000, 'BDT');

-- --------------------------------------------------------

--
-- Table structure for table `Relief_Center`
--

CREATE TABLE `Relief_Center` (
  `center_id` int(11) NOT NULL,
  `center_name` varchar(150) NOT NULL,
  `location` varchar(150) NOT NULL,
  `capacity` int(11) NOT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `disaster_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Relief_Center`
--

INSERT INTO `Relief_Center` (`center_id`, `center_name`, `location`, `capacity`, `contact_no`, `disaster_id`) VALUES
(101, 'Sylhet Govt College Shelter', 'Tilagarh, Sylhet', 500, '+8801711111111', 1),
(102, 'Shatkhira Cyclone Shelter', 'Shyamnagar, Shatkhira', 800, '+8801722222222', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Resource_Allocation`
--

CREATE TABLE `Resource_Allocation` (
  `allocation_id` int(11) NOT NULL,
  `disaster_id` int(11) DEFAULT NULL,
  `center_id` int(11) DEFAULT NULL,
  `allocated_resource` varchar(50) NOT NULL,
  `allocated_quantity` int(11) NOT NULL,
  `allocation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Resource_Allocation`
--

INSERT INTO `Resource_Allocation` (`allocation_id`, `disaster_id`, `center_id`, `allocated_resource`, `allocated_quantity`, `allocation_date`) VALUES
(401, 1, 101, 'Food', 1500, '2026-06-16'),
(402, 1, 101, 'Medicine', 50, '2026-06-16'),
(403, 2, 102, 'Food', 2000, '2026-05-21');

-- --------------------------------------------------------

--
-- Table structure for table `Volunteer`
--

CREATE TABLE `Volunteer` (
  `volunteer_id` int(11) NOT NULL,
  `volunteer_name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `skills` varchar(100) DEFAULT NULL,
  `assigned_center_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Volunteer`
--

INSERT INTO `Volunteer` (`volunteer_id`, `volunteer_name`, `phone`, `skills`, `assigned_center_id`) VALUES
(201, 'Arif Ahmed', '+8801999999999', 'First Aid & Rescue', 101),
(202, 'Sadia Rahman', '+8801888888888', 'Logistics & Cooking', 102);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Disaster`
--
ALTER TABLE `Disaster`
  ADD PRIMARY KEY (`disaster_id`);

--
-- Indexes for table `Donation`
--
ALTER TABLE `Donation`
  ADD PRIMARY KEY (`donation_id`);

--
-- Indexes for table `Relief_Center`
--
ALTER TABLE `Relief_Center`
  ADD PRIMARY KEY (`center_id`),
  ADD UNIQUE KEY `contact_no` (`contact_no`),
  ADD KEY `disaster_id` (`disaster_id`);

--
-- Indexes for table `Resource_Allocation`
--
ALTER TABLE `Resource_Allocation`
  ADD PRIMARY KEY (`allocation_id`),
  ADD KEY `disaster_id` (`disaster_id`),
  ADD KEY `center_id` (`center_id`);

--
-- Indexes for table `Volunteer`
--
ALTER TABLE `Volunteer`
  ADD PRIMARY KEY (`volunteer_id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `assigned_center_id` (`assigned_center_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Disaster`
--
ALTER TABLE `Disaster`
  MODIFY `disaster_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Donation`
--
ALTER TABLE `Donation`
  MODIFY `donation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304;

--
-- AUTO_INCREMENT for table `Relief_Center`
--
ALTER TABLE `Relief_Center`
  MODIFY `center_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `Resource_Allocation`
--
ALTER TABLE `Resource_Allocation`
  MODIFY `allocation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;

--
-- AUTO_INCREMENT for table `Volunteer`
--
ALTER TABLE `Volunteer`
  MODIFY `volunteer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Relief_Center`
--
ALTER TABLE `Relief_Center`
  ADD CONSTRAINT `Relief_Center_ibfk_1` FOREIGN KEY (`disaster_id`) REFERENCES `Disaster` (`disaster_id`) ON DELETE SET NULL;

--
-- Constraints for table `Resource_Allocation`
--
ALTER TABLE `Resource_Allocation`
  ADD CONSTRAINT `Resource_Allocation_ibfk_1` FOREIGN KEY (`disaster_id`) REFERENCES `Disaster` (`disaster_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Resource_Allocation_ibfk_2` FOREIGN KEY (`center_id`) REFERENCES `Relief_Center` (`center_id`) ON DELETE CASCADE;

--
-- Constraints for table `Volunteer`
--
ALTER TABLE `Volunteer`
  ADD CONSTRAINT `Volunteer_ibfk_1` FOREIGN KEY (`assigned_center_id`) REFERENCES `Relief_Center` (`center_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- SQLBook: Markup
