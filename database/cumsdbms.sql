-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 08, 2022 at 06:16 PM
-- Server version: 8.0.30-0ubuntu0.20.04.2
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cumsdbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `resetLink` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`, `resetLink`) VALUES
('c0d6bfcb-f6c4-4bb5-a1e8-543acb4356e5', 'Admin', 'admin@gmail.com', '$2a$08$I4AUNPWQadlAQYy225sNVeISYagTThgfWR7ESxLUqJicLNcxHweGq', ''),
('c5b6103d-350d-4d83-8bf8-0cdc40f36d51', 'Juan Delacruz', 'juan@gmail.com', '$2a$08$I4AUNPWQadlAQYy225sNVeISYagTThgfWR7ESxLUqJicLNcxHweGq', '');

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `asg_id` int NOT NULL,
  `name` text NOT NULL,
  `day` datetime DEFAULT CURRENT_TIMESTAMP,
  `deadline` datetime NOT NULL,
  `class_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` (`asg_id`, `name`, `day`, `deadline`, `class_id`) VALUES
(1, 'OS - Assignment1', '2022-08-02 17:49:29', '2022-08-04 11:17:00', 1),
(2, 'OS - Assignment2', '2022-08-02 11:57:57', '2022-08-03 23:53:00', 1),
(4, 'OS - Assignment3', '2022-08-03 12:00:20', '2022-08-04 08:00:00', 1),
(5, 'OS - Assignment4', '2022-08-03 11:39:30', '2022-08-05 12:35:00', 1),
(6, 'OS - Assignment5', '2022-08-05 12:34:39', '2022-08-06 00:34:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `assignment_question`
--

CREATE TABLE `assignment_question` (
  `asg_id` int NOT NULL,
  `q_id` bigint NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `assignment_question`
--

INSERT INTO `assignment_question` (`asg_id`, `q_id`, `status`) VALUES
(1, 5, 1),
(1, 8, 1),
(1, 9, 1),
(1, 10, 0),
(1, 11, 0),
(1, 12, 0),
(1, 16, 1),
(1, 17, 1),
(2, 5, 1),
(2, 8, 1),
(2, 9, 1),
(2, 10, 1),
(2, 11, 0),
(2, 12, 0),
(2, 16, 0),
(2, 17, 0),
(5, 5, 1),
(5, 8, 1),
(5, 9, 0),
(5, 10, 1),
(5, 11, 0),
(5, 12, 0),
(6, 5, 0),
(6, 8, 0),
(6, 9, 0),
(6, 10, 0),
(6, 11, 1),
(6, 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `s_id` varchar(36) NOT NULL,
  `date` date NOT NULL,
  `c_id` varchar(100) NOT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`s_id`, `date`, `c_id`, `status`) VALUES
('00e800bc-319d-4567-b8ba-f3775644630b', '2022-07-27', 'ECE01', 1),
('00e800bc-319d-4567-b8ba-f3775644630b', '2022-08-01', 'ECE01', 1),
('00e800bc-319d-4567-b8ba-f3775644630b', '2022-08-02', 'ECE01', 1),
('00e800bc-319d-4567-b8ba-f3775644630b', '2022-08-03', 'ECE01', 0),
('00e800bc-319d-4567-b8ba-f3775644630b', '2022-08-04', 'ECE01', 1),
('00e800bc-319d-4567-b8ba-f3775644630b', '2022-08-05', 'ECE01', 0),
('0220eeec-e56d-471e-93bd-8feb23b68a82', '2022-07-27', 'ECE01', 1),
('0220eeec-e56d-471e-93bd-8feb23b68a82', '2022-08-01', 'ECE01', 1),
('0220eeec-e56d-471e-93bd-8feb23b68a82', '2022-08-02', 'ECE01', 1),
('0220eeec-e56d-471e-93bd-8feb23b68a82', '2022-08-03', 'ECE01', 0),
('0220eeec-e56d-471e-93bd-8feb23b68a82', '2022-08-04', 'ECE01', 0),
('0220eeec-e56d-471e-93bd-8feb23b68a82', '2022-08-05', 'ECE01', 0),
('0f454fb1-06b2-4561-b975-92e21814f585', '2022-07-27', 'ECE01', 1),
('0f454fb1-06b2-4561-b975-92e21814f585', '2022-08-01', 'ECE01', 1),
('0f454fb1-06b2-4561-b975-92e21814f585', '2022-08-02', 'ECE01', 1),
('0f454fb1-06b2-4561-b975-92e21814f585', '2022-08-03', 'ECE01', 0),
('0f454fb1-06b2-4561-b975-92e21814f585', '2022-08-04', 'ECE01', 0),
('0f454fb1-06b2-4561-b975-92e21814f585', '2022-08-05', 'ECE01', 0),
('19640156-7aa5-46b6-be65-bb9c5577345b', '2022-07-27', 'ECE01', 1),
('19640156-7aa5-46b6-be65-bb9c5577345b', '2022-08-01', 'ECE01', 1),
('19640156-7aa5-46b6-be65-bb9c5577345b', '2022-08-02', 'ECE01', 1),
('19640156-7aa5-46b6-be65-bb9c5577345b', '2022-08-03', 'ECE01', 0),
('19640156-7aa5-46b6-be65-bb9c5577345b', '2022-08-04', 'ECE01', 0),
('19640156-7aa5-46b6-be65-bb9c5577345b', '2022-08-05', 'ECE01', 0),
('1a155b9d-0bf3-4bae-9e14-87675e2374e3', '2022-07-27', 'ECE01', 1),
('1a155b9d-0bf3-4bae-9e14-87675e2374e3', '2022-08-01', 'ECE01', 1),
('1a155b9d-0bf3-4bae-9e14-87675e2374e3', '2022-08-02', 'ECE01', 1),
('1a155b9d-0bf3-4bae-9e14-87675e2374e3', '2022-08-03', 'ECE01', 0),
('1a155b9d-0bf3-4bae-9e14-87675e2374e3', '2022-08-04', 'ECE01', 0),
('1a155b9d-0bf3-4bae-9e14-87675e2374e3', '2022-08-05', 'ECE01', 0),
('3eba95e1-64c5-42fb-837e-911fe6cd38cd', '2022-07-27', 'ECE01', 1),
('3eba95e1-64c5-42fb-837e-911fe6cd38cd', '2022-08-01', 'ECE01', 1),
('3eba95e1-64c5-42fb-837e-911fe6cd38cd', '2022-08-02', 'ECE01', 1),
('3eba95e1-64c5-42fb-837e-911fe6cd38cd', '2022-08-03', 'ECE01', 0),
('3eba95e1-64c5-42fb-837e-911fe6cd38cd', '2022-08-04', 'ECE01', 0),
('3eba95e1-64c5-42fb-837e-911fe6cd38cd', '2022-08-05', 'ECE01', 0),
('56e2becf-e35b-48b4-8323-c3fe375b8ec3', '2022-07-27', 'ECE01', 1),
('56e2becf-e35b-48b4-8323-c3fe375b8ec3', '2022-08-01', 'ECE01', 1),
('56e2becf-e35b-48b4-8323-c3fe375b8ec3', '2022-08-02', 'ECE01', 1),
('56e2becf-e35b-48b4-8323-c3fe375b8ec3', '2022-08-03', 'ECE01', 0),
('56e2becf-e35b-48b4-8323-c3fe375b8ec3', '2022-08-04', 'ECE01', 0),
('56e2becf-e35b-48b4-8323-c3fe375b8ec3', '2022-08-05', 'ECE01', 0),
('647155a6-04c7-4870-b5b5-b1c4686f3abe', '2022-07-27', 'ECE01', 1),
('647155a6-04c7-4870-b5b5-b1c4686f3abe', '2022-08-01', 'ECE01', 1),
('647155a6-04c7-4870-b5b5-b1c4686f3abe', '2022-08-02', 'ECE01', 1),
('647155a6-04c7-4870-b5b5-b1c4686f3abe', '2022-08-03', 'ECE01', 0),
('647155a6-04c7-4870-b5b5-b1c4686f3abe', '2022-08-04', 'ECE01', 0),
('647155a6-04c7-4870-b5b5-b1c4686f3abe', '2022-08-05', 'ECE01', 0),
('64e09463-abd0-4b60-a48a-cfe1fc680585', '2022-07-27', 'ECE01', 1),
('64e09463-abd0-4b60-a48a-cfe1fc680585', '2022-08-01', 'ECE01', 1),
('64e09463-abd0-4b60-a48a-cfe1fc680585', '2022-08-02', 'ECE01', 1),
('64e09463-abd0-4b60-a48a-cfe1fc680585', '2022-08-03', 'ECE01', 0),
('64e09463-abd0-4b60-a48a-cfe1fc680585', '2022-08-04', 'ECE01', 0),
('64e09463-abd0-4b60-a48a-cfe1fc680585', '2022-08-05', 'ECE01', 0),
('78acb82c-3a37-442c-95cb-0173b8ccd42e', '2022-07-27', 'ECE01', 1),
('78acb82c-3a37-442c-95cb-0173b8ccd42e', '2022-08-01', 'ECE01', 1),
('78acb82c-3a37-442c-95cb-0173b8ccd42e', '2022-08-02', 'ECE01', 1),
('78acb82c-3a37-442c-95cb-0173b8ccd42e', '2022-08-03', 'ECE01', 0),
('78acb82c-3a37-442c-95cb-0173b8ccd42e', '2022-08-04', 'ECE01', 0),
('78acb82c-3a37-442c-95cb-0173b8ccd42e', '2022-08-05', 'ECE01', 0),
('a7e78620-665f-4c3d-b007-aec2580d9d26', '2022-07-27', 'ECE01', 1),
('a7e78620-665f-4c3d-b007-aec2580d9d26', '2022-08-01', 'ECE01', 1),
('a7e78620-665f-4c3d-b007-aec2580d9d26', '2022-08-02', 'ECE01', 1),
('a7e78620-665f-4c3d-b007-aec2580d9d26', '2022-08-03', 'ECE01', 0),
('a7e78620-665f-4c3d-b007-aec2580d9d26', '2022-08-04', 'ECE01', 0),
('a7e78620-665f-4c3d-b007-aec2580d9d26', '2022-08-05', 'ECE01', 0),
('acda371e-1b0d-47ea-95b0-ceea3e870666', '2022-07-27', 'ECE01', 1),
('acda371e-1b0d-47ea-95b0-ceea3e870666', '2022-08-01', 'ECE01', 1),
('acda371e-1b0d-47ea-95b0-ceea3e870666', '2022-08-02', 'ECE01', 1),
('acda371e-1b0d-47ea-95b0-ceea3e870666', '2022-08-03', 'ECE01', 0),
('acda371e-1b0d-47ea-95b0-ceea3e870666', '2022-08-04', 'ECE01', 0),
('acda371e-1b0d-47ea-95b0-ceea3e870666', '2022-08-05', 'ECE01', 0),
('b45f768d-27fe-42fa-bd05-19f90cbc94c8', '2022-07-27', 'ECE01', 1),
('b45f768d-27fe-42fa-bd05-19f90cbc94c8', '2022-08-01', 'ECE01', 1),
('b45f768d-27fe-42fa-bd05-19f90cbc94c8', '2022-08-02', 'ECE01', 1),
('b45f768d-27fe-42fa-bd05-19f90cbc94c8', '2022-08-03', 'ECE01', 0),
('b45f768d-27fe-42fa-bd05-19f90cbc94c8', '2022-08-04', 'ECE01', 0),
('b45f768d-27fe-42fa-bd05-19f90cbc94c8', '2022-08-05', 'ECE01', 0),
('c65b56b3-bd38-4ef5-8c63-7f19f45b28f8', '2022-07-27', 'ECE01', 1),
('c65b56b3-bd38-4ef5-8c63-7f19f45b28f8', '2022-08-01', 'ECE01', 1),
('c65b56b3-bd38-4ef5-8c63-7f19f45b28f8', '2022-08-02', 'ECE01', 1),
('c65b56b3-bd38-4ef5-8c63-7f19f45b28f8', '2022-08-03', 'ECE01', 0),
('c65b56b3-bd38-4ef5-8c63-7f19f45b28f8', '2022-08-04', 'ECE01', 0),
('c65b56b3-bd38-4ef5-8c63-7f19f45b28f8', '2022-08-05', 'ECE01', 0),
('d7b80de3-0b8c-4456-83ba-1b0d4cd77e56', '2022-07-27', 'ECE01', 1),
('d7b80de3-0b8c-4456-83ba-1b0d4cd77e56', '2022-08-01', 'ECE01', 1),
('d7b80de3-0b8c-4456-83ba-1b0d4cd77e56', '2022-08-02', 'ECE01', 1),
('d7b80de3-0b8c-4456-83ba-1b0d4cd77e56', '2022-08-03', 'ECE01', 0),
('d7b80de3-0b8c-4456-83ba-1b0d4cd77e56', '2022-08-04', 'ECE01', 0),
('d7b80de3-0b8c-4456-83ba-1b0d4cd77e56', '2022-08-05', 'ECE01', 0),
('e854e9ac-6676-4cfd-8f02-809fadeb9747', '2022-07-27', 'ECE01', 1),
('e854e9ac-6676-4cfd-8f02-809fadeb9747', '2022-08-01', 'ECE01', 1),
('e854e9ac-6676-4cfd-8f02-809fadeb9747', '2022-08-02', 'ECE01', 1),
('e854e9ac-6676-4cfd-8f02-809fadeb9747', '2022-08-03', 'ECE01', 0),
('e854e9ac-6676-4cfd-8f02-809fadeb9747', '2022-08-04', 'ECE01', 0),
('e854e9ac-6676-4cfd-8f02-809fadeb9747', '2022-08-05', 'ECE01', 0),
('f2f13c67-1570-4bcf-8a7b-b155f65b5f27', '2022-07-27', 'ECE01', 1),
('f2f13c67-1570-4bcf-8a7b-b155f65b5f27', '2022-08-01', 'ECE01', 1),
('f2f13c67-1570-4bcf-8a7b-b155f65b5f27', '2022-08-02', 'ECE01', 1),
('f2f13c67-1570-4bcf-8a7b-b155f65b5f27', '2022-08-03', 'ECE01', 0),
('f2f13c67-1570-4bcf-8a7b-b155f65b5f27', '2022-08-04', 'ECE01', 0),
('f2f13c67-1570-4bcf-8a7b-b155f65b5f27', '2022-08-05', 'ECE01', 0),
('f7757fd4-4508-495b-a8b3-acadb84cafdb', '2022-07-27', 'ECE01', 1),
('f7757fd4-4508-495b-a8b3-acadb84cafdb', '2022-08-01', 'ECE01', 1),
('f7757fd4-4508-495b-a8b3-acadb84cafdb', '2022-08-02', 'ECE01', 1),
('f7757fd4-4508-495b-a8b3-acadb84cafdb', '2022-08-03', 'ECE01', 0),
('f7757fd4-4508-495b-a8b3-acadb84cafdb', '2022-08-04', 'ECE01', 0),
('f7757fd4-4508-495b-a8b3-acadb84cafdb', '2022-08-05', 'ECE01', 0),
('f924b62f-6934-4132-a67b-4cdedf3c0589', '2022-07-27', 'ECE01', 1),
('f924b62f-6934-4132-a67b-4cdedf3c0589', '2022-08-01', 'ECE01', 1),
('f924b62f-6934-4132-a67b-4cdedf3c0589', '2022-08-02', 'ECE01', 1),
('f924b62f-6934-4132-a67b-4cdedf3c0589', '2022-08-03', 'ECE01', 0),
('f924b62f-6934-4132-a67b-4cdedf3c0589', '2022-08-04', 'ECE01', 0),
('f924b62f-6934-4132-a67b-4cdedf3c0589', '2022-08-05', 'ECE01', 0),
('f9a1ca7b-bc0d-48ad-ae65-dc5030f3cc3a', '2022-07-27', 'ECE01', 1),
('f9a1ca7b-bc0d-48ad-ae65-dc5030f3cc3a', '2022-08-01', 'ECE01', 0),
('f9a1ca7b-bc0d-48ad-ae65-dc5030f3cc3a', '2022-08-02', 'ECE01', 0),
('f9a1ca7b-bc0d-48ad-ae65-dc5030f3cc3a', '2022-08-03', 'ECE01', 1),
('f9a1ca7b-bc0d-48ad-ae65-dc5030f3cc3a', '2022-08-04', 'ECE01', 0),
('f9a1ca7b-bc0d-48ad-ae65-dc5030f3cc3a', '2022-08-05', 'ECE01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `chapter`
--

CREATE TABLE `chapter` (
  `chapter_id` int NOT NULL,
  `chapter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `chapter_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `pdf` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `exam` varchar(100) DEFAULT NULL,
  `class_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chapter`
--

INSERT INTO `chapter` (`chapter_id`, `chapter_name`, `chapter_description`, `pdf`, `exam`, `class_id`) VALUES
(5, 'Introduction', 'Introduction', './upload/OS-Part-01.pdf', NULL, 1),
(6, 'Processes and Threads', 'Processes and Threads', './upload/OS-Part-02.pdf', NULL, 1),
(7, 'Memory Management', 'Memory Management', './upload/OS-Part-03.pdf', NULL, 1),
(9, 'File systems', 'File systems', './upload/OS-Part-04.pdf', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_id` int NOT NULL,
  `section` int NOT NULL,
  `semester` int NOT NULL,
  `year` date DEFAULT (curdate()),
  `c_id` varchar(100) DEFAULT NULL,
  `st_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `section`, `semester`, `year`, `c_id`, `st_id`) VALUES
(1, 1, 1, '2022-07-27', 'ECE01', '6ce3d2b8-9f0e-455e-ba21-eff16eee41be'),
(3, 2, 1, '2022-07-30', 'IT01', '0438088b-4d4c-4d13-8731-35abb45e77b4'),
(4, 1, 1, '2022-07-30', 'IT01', '0438088b-4d4c-4d13-8731-35abb45e77b4'),
(6, 1, 1, '2022-08-01', 'ECE02', '6ce3d2b8-9f0e-455e-ba21-eff16eee41be');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `c_id` varchar(100) NOT NULL,
  `semester` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `c_type` varchar(255) NOT NULL,
  `credits` int NOT NULL,
  `dept_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`c_id`, `semester`, `name`, `c_type`, `credits`, `dept_id`) VALUES
('BT01', 1, 'Physics of Materials', 'Practical', 4, 'BT'),
('BT02', 1, 'Advance Chemistry', 'Practical', 4, 'BT'),
('BT03', 1, 'Biostatistics', 'Theory', 4, 'BT'),
('BT04', 1, 'Introduction to Biotechnology', 'Theory', 4, 'BT'),
('BT05', 2, 'Biochemistry', 'Practical', 4, 'BT'),
('BT06', 2, 'Microbiology', 'Practical', 4, 'BT'),
('BT07', 2, 'Cell Biology', 'Practical', 4, 'BT'),
('BT08', 2, 'Data Structure and Algorithms', 'Practical', 4, 'BT'),
('BT09', 2, 'Chemical Engg. Principles', 'Theory', 4, 'BT'),
('BT10', 3, 'Methods & Instrumentation in Biotechnology', 'Theory', 4, 'BT'),
('BT11', 3, 'Molecular Biology', 'Practical', 4, 'BT'),
('BT12', 3, 'Immunology', 'Practical', 4, 'BT'),
('BT13', 3, 'Database Management Systems', 'Practical', 4, 'BT'),
('BT14', 3, 'Genetics', 'Practical', 4, 'BT'),
('BT15', 4, 'Recombinant DNA Technology', 'Practical', 4, 'BT'),
('BT16', 4, 'Structural Biology', 'Practical', 4, 'BT'),
('BT17', 4, 'Fundamentals of Biochemical Engineering', 'Practical', 4, 'BT'),
('BT18', 4, 'Enzymology', 'Practical', 4, 'BT'),
('BT19', 5, 'Bioprocess Technology', 'Practical', 4, 'BT'),
('BT20', 5, 'Plant & Animal Biotechnology', 'Practical', 4, 'BT'),
('BT21', 5, 'Downstream Processing', 'Practical', 4, 'BT'),
('CSE01', 1, 'Discrete Structures', 'Theory', 4, 'CSE'),
('CSE02', 1, 'Data Structures', 'Practical', 4, 'CSE'),
('CSE03', 1, 'Digital Logic Design', 'Practical', 4, 'CSE'),
('CSE04', 1, 'Analog and Digital Communication', 'Theory', 4, 'CSE'),
('CSE05', 2, 'Design and Analysis of Algorithms', 'Practical', 4, 'CSE'),
('CSE06', 2, 'Database Management Systems', 'Practical', 4, 'CSE'),
('CSE07', 2, 'Object Orientation', 'Practical', 4, 'CSE'),
('CSE08', 2, 'Computer Architecture and Organization', 'Theory', 4, 'CSE'),
('CSE09', 2, 'Analog Electronics', 'Practical', 4, 'CSE'),
('CSE10', 3, 'Microprocessors', 'Practical', 4, 'CSE'),
('CSE11', 3, 'Software Engineering', 'Practical', 4, 'CSE'),
('CSE12', 3, 'Computer Graphics', 'Practical', 4, 'CSE'),
('CSE13', 3, 'Computer Networking', 'Practical', 4, 'CSE'),
('CSE14', 3, 'Operating Systems', 'Theory', 4, 'CSE'),
('CSE15', 4, 'Theory of Computation', 'Theory', 4, 'CSE'),
('CSE16', 4, 'High Performance Computing', 'Practical', 4, 'CSE'),
('CSE17', 4, 'Compiler Construction', 'Practical', 4, 'CSE'),
('CSE18', 4, 'Modeling and Simulation', 'Practical', 4, 'CSE'),
('CSE19', 5, 'Computer Control Systems', 'Theory', 4, 'CSE'),
('CSE20', 5, 'IT Law and Ethics', 'Theory', 4, 'CSE'),
('CSE21', 5, 'Open Source Technologies', 'Practical', 4, 'CSE'),
('ECE01', 1, 'Electronic Engineering Materials', 'Theory', 4, 'ECE'),
('ECE02', 1, 'Electronics I', 'Practical', 4, 'ECE'),
('ECE03', 1, 'Digital Circuits and Systems', 'Practical', 4, 'ECE'),
('ECE04', 1, 'Electrical Machines', 'Theory', 4, 'ECE'),
('ECE05', 2, 'Mathematics III', 'Theory', 4, 'ECE'),
('ECE06', 2, 'Electronics II', 'Practical', 4, 'ECE'),
('ECE07', 2, 'Network Analysis and Synthesis', 'Theory', 4, 'ECE'),
('ECE08', 2, 'Signals and Systems', 'Theory', 4, 'ECE'),
('ECE09', 2, 'Electromagnetic Field Theory', 'Theory', 4, 'ECE'),
('ECE10', 3, 'Linear Integrated Circuits', 'Practical', 4, 'ECE'),
('ECE11', 3, 'Data Structures', 'Practical', 4, 'ECE'),
('ECE12', 3, 'Transmission Lines and Waveguides', 'Theory', 4, 'ECE'),
('ECE13', 3, 'Probability Theory and Communication', 'Practical', 4, 'ECE'),
('ECE14', 3, 'Control Systems', 'Theory', 4, 'ECE'),
('ECE15', 4, 'Digital Signal Processing', 'Practical', 4, 'ECE'),
('ECE16', 4, 'Digital Communication', 'Practical', 4, 'ECE'),
('ECE17', 4, 'Microprocessor and its Applications', 'Practical', 4, 'ECE'),
('ECE18', 4, 'Antenna and Wave Propagation', 'Practical', 4, 'ECE'),
('ECE19', 5, 'Microwave Engineering', 'Practical', 4, 'ECE'),
('ECE20', 5, 'VLSI', 'Practical', 4, 'ECE'),
('ECE21', 5, 'Computer Networks', 'Theory', 4, 'ECE'),
('ICE01', 1, 'Physics of Materials', 'Practical', 4, 'ICE'),
('ICE02', 1, 'Applied Mechanics', 'Theory', 4, 'ICE'),
('ICE03', 1, 'Signals and Systems', 'Theory', 4, 'ICE'),
('ICE04', 1, 'Power Apparatus', 'Practical', 4, 'ICE'),
('ICE05', 2, 'Electronic Instrumentation', 'Practical', 4, 'ICE'),
('ICE06', 2, 'Electronics', 'Practical', 4, 'ICE'),
('ICE07', 2, 'Engineering Graphics', 'Practical', 4, 'ICE'),
('ICE08', 2, 'Data Structures', 'Theory', 4, 'ICE'),
('ICE09', 2, 'Chemistry', 'Theory', 4, 'ICE'),
('ICE10', 3, 'Mathematics-III', 'Theory', 4, 'ICE'),
('ICE11', 3, 'Control System-I', 'Practical', 4, 'ICE'),
('ICE12', 3, 'Transducer & measurement', 'Theory', 4, 'ICE'),
('ICE13', 3, 'Industrial Electronics', 'Practical', 4, 'ICE'),
('ICE14', 3, 'Digital Circuits and Systems', 'Theory', 4, 'ICE'),
('ICE15', 4, 'Microprocessor and Microcontroller', 'Practical', 4, 'ICE'),
('ICE16', 4, 'Process Dynamics and Control', 'Practical', 4, 'ICE'),
('ICE17', 4, 'Analog and Digital Communication', 'Practical', 4, 'ICE'),
('ICE18', 4, 'Control System-II', 'Practical', 4, 'ICE'),
('ICE19', 5, 'Industrial Instrumentation', 'Practical', 4, 'ICE'),
('ICE20', 5, 'Robotics', 'Practical', 4, 'ICE'),
('ICE21', 5, 'Digital Signal Processing', 'Practical', 4, 'ICE'),
('IT01', 1, 'Chemistry', 'Practical', 4, 'IT'),
('IT02', 1, 'Object Oriented Techniques', 'Practical', 4, 'IT'),
('IT03', 1, 'Analog and Digital Communication', 'Theory', 4, 'IT'),
('IT04', 1, 'Discrete Structure', 'Theory', 4, 'IT'),
('IT05', 2, 'Mathematics-III', 'Theory', 4, 'IT'),
('IT06', 2, 'Data Structure and Algorithm', 'Practical', 4, 'IT'),
('IT07', 2, 'Digital Circuits and Systems', 'Practical', 4, 'IT'),
('IT08', 2, 'Database Management System', 'Practical', 4, 'IT'),
('IT09', 2, 'Computer Graphics', 'Practical', 4, 'IT'),
('IT10', 3, 'Probability and Stochastic Processes', 'Theory', 4, 'IT'),
('IT11', 3, 'Operating Systems', 'Practical', 4, 'IT'),
('IT12', 3, 'Computer System Architecture', 'Theory', 4, 'IT'),
('IT13', 3, 'Computer Networks', 'Practical', 4, 'IT'),
('IT14', 3, 'Software Engineering', 'Practical', 4, 'IT'),
('IT15', 4, 'Multimedia & Applications', 'Practical', 4, 'IT'),
('IT16', 4, 'Theory of Computation', 'Theory', 4, 'IT'),
('IT17', 4, 'Design and Analysis of Algorithm', 'Practical', 4, 'IT'),
('IT18', 4, 'Linux/Unix Lab', 'Practical', 2, 'IT'),
('IT19', 5, 'Internet and Web Engineering', 'Theory', 4, 'IT'),
('IT20', 5, 'Compiler and Translator Design', 'Theory', 4, 'IT'),
('IT21', 5, 'Modeling and Simulation', 'Practical', 4, 'IT'),
('ME01', 1, 'Chemistry', 'Practical', 4, 'ME'),
('ME02', 1, 'Engineering Mechanics', 'Practical', 4, 'ME'),
('ME03', 1, 'Workshop Technology', 'Practical', 4, 'ME'),
('ME04', 1, 'Engineering Graphics', 'Practical', 4, 'ME'),
('ME05', 2, 'Machine Drawing', 'Practical', 4, 'ME'),
('ME06', 2, 'Manufacturing Processes-I', 'Practical', 4, 'ME'),
('ME07', 2, 'Mathematics - III', 'Theory', 4, 'ME'),
('ME08', 2, 'Thermal Engineering', 'Practical', 4, 'ME'),
('ME09', 2, 'Science of Materials', 'Theory', 4, 'ME'),
('ME10', 3, 'Kinematics & Dynamics of Machines', 'Practical', 4, 'ME'),
('ME11', 3, 'Mechanics of Solids', 'Practical', 4, 'ME'),
('ME12', 3, 'Fluid Mechanics', 'Practical', 4, 'ME'),
('ME13', 3, 'Manufacturing Processes-II', 'Practical', 4, 'ME'),
('ME14', 3, 'Management of Manufacturing Systems', 'Theory', 4, 'ME'),
('ME15', 4, 'Industrial Engineering', 'Practical', 4, 'ME'),
('ME16', 4, 'Refrigeration & Air- conditioning', 'Practical', 4, 'ME'),
('ME17', 4, 'Transducer and Measurement', 'Practical', 4, 'ME'),
('ME18', 4, 'Control Systems', 'Practical', 4, 'ME'),
('ME19', 5, 'Heat & Mass Transfer', 'Theory', 4, 'ME'),
('ME20', 5, 'Fluid Systems', 'Practical', 4, 'ME'),
('ME21', 5, 'Machine Element Design', 'Practical', 4, 'ME'),
('ME22', 5, 'Mechanical Vibration', 'Practical', 4, 'ME'),
('MPAE01', 1, 'Chemistry', 'Practical', 4, 'MPAE'),
('MPAE02', 1, 'Engineering Mechanics', 'Practical', 4, 'MPAE'),
('MPAE03', 1, 'Workshop Technology', 'Practical', 4, 'MPAE'),
('MPAE04', 1, 'Engineering Graphics', 'Practical', 4, 'MPAE'),
('MPAE05', 2, 'Machine Drawing', 'Practical', 4, 'MPAE'),
('MPAE06', 2, 'Manufacturing Processes I', 'Practical', 4, 'MPAE'),
('MPAE07', 2, 'Mechanical Sciences', 'Practical', 4, 'MPAE'),
('MPAE08', 2, 'Control System', 'Practical', 4, 'MPAE'),
('MPAE09', 2, 'Mathematics III', 'Theory', 4, 'MPAE'),
('MPAE10', 3, 'Kinematics & Dynamics of Machinery', 'Practical', 4, 'MPAE'),
('MPAE11', 3, 'Mechanics of solids', 'Practical', 4, 'MPAE'),
('MPAE12', 3, 'Transducers and Measurements', 'Practical', 4, 'MPAE'),
('MPAE13', 3, 'Manufacturing Processes II', 'Practical', 4, 'MPAE'),
('MPAE14', 3, 'Science of Materials', 'Theory', 4, 'MPAE'),
('MPAE15', 4, 'Machine Tools, CNC and Automation', 'Practical', 4, 'MPAE'),
('MPAE16', 4, 'Metrology and Quality Control', 'Practical', 4, 'MPAE'),
('MPAE17', 4, 'Tool Design', 'Practical', 4, 'MPAE'),
('MPAE18', 4, 'Operations Research', 'Practical', 4, 'MPAE'),
('MPAE19', 5, 'Geometric Modeling', 'Practical', 4, 'MPAE'),
('MPAE20', 5, 'Applied Plasticity', 'Practical', 4, 'MPAE'),
('MPAE21', 5, 'Mechanical Design', 'Practical', 4, 'MPAE');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` varchar(255) NOT NULL,
  `d_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `d_name`) VALUES
('AI', 'Artificial Intelligence'),
('BT', 'Bio-Technology'),
('CSE', 'Computer Engineering'),
('ECE', 'Electronics and Communications Engineering'),
('IT', 'Information Technology'),
('ICE', 'Instrumentation and Control Engineering'),
('MPAE', 'Manufacturing Processes and Automation'),
('ME', 'Mechanical Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `q_id` bigint NOT NULL,
  `question` text NOT NULL,
  `opt1` text NOT NULL,
  `opt2` text NOT NULL,
  `opt3` text NOT NULL,
  `opt4` text NOT NULL,
  `answer` text NOT NULL,
  `class_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`q_id`, `question`, `opt1`, `opt2`, `opt3`, `opt4`, `answer`, `class_id`) VALUES
(5, 'Phương pháp nhanh nhất để trao đổi dữ liệu giữa các tiến trình là:', 'Vùng nhớ chia sẻ', 'Trao đổi thông điệp ', 'Pipe', 'Sockets', 'a', 1),
(8, 'Hai chức năng chính của hệ điều hành là gì?', 'Quản lý; phân phối tài nguyên đảm bảo đồng nhất dữ liệu', 'Quản lý; chia sẻ tài nguyên', 'Quản lý; chia sẻ tài nguyên; giả lập một máy tính mở rộng', 'Che giấu các chi tiết phần cứng; cung cấp một máy tính mở rộng', 'c', 1),
(9, 'Khi nói về RAID, phát biểu nào sau đây là sai:', 'RAID là việc hệ thống lưu trữ sử dụng nhiều đĩa để tăng độ tin cậy', 'RAID 5 hiện đang được sử dụng rộng rãi nhất', 'Các mức RAID phải được sử dụng riêng lẻ', 'RAID 1 đảm bảo an toàn dữ liệu bằng việc lưu 2 bảng ở 2 khối đĩa', 'c', 1),
(10, 'Một tiến trình đang được cấp phát CPU thuộc trạng thái nào?', 'Block/Waiting ', 'Running', 'New', 'Ready', 'b', 1),
(11, 'phát biểu nào sau đây là không chính sát về tiến trình:', 'Có sự hợp tác hoàn thành tác vụ giữa các tiến trình', 'Các tiến trình có thể liên lạc với nhau một cách trực tiếp, dễ dàng', 'Có nhu cầu chia sẻ thông tin giữa các tiến trình', 'Có nhu cầu chia sẻ thông tin giữa các tiến trình', 'b', 1),
(12, 'Số trang tối thiểu cần cấp cho một tiến trình được quy định bởi:', 'Kiến trúc máy tính ', 'Người lập trình', 'Dung lượng bộ nhớ vật lý có thể sử dụng được', 'Hệ điều hành', 'd', 1),
(16, 'Hệ thống quản lý nhập/xuất bao gồm bao nhiêu lớp?', '2', '5', '4', 'không phân lớp', 'b', 1),
(17, 'Thành phần nào không phải là thành phần của hệ điều hành?', 'Chương trình quản lý truy cập file', 'Chương trình điều khiển thiết bị', 'Chương trình lập lịch cho tiến trình', 'Chương trình quản lý bộ nhớ tự do', 'b', 1);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `result_id` bigint NOT NULL,
  `asg_id` int NOT NULL,
  `s_id` varchar(36) NOT NULL,
  `score` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `class_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`result_id`, `asg_id`, `s_id`, `score`, `createdAt`, `class_id`) VALUES
(2, 5, '00e800bc-319d-4567-b8ba-f3775644630b', 10, '2022-08-05 04:02:14', 1),
(4, 6, '00e800bc-319d-4567-b8ba-f3775644630b', 0, '2022-08-05 04:44:16', 1),
(5, 6, '00e800bc-319d-4567-b8ba-f3775644630b', 5, '2022-08-05 04:45:10', 1),
(6, 5, '00e800bc-319d-4567-b8ba-f3775644630b', 6.67, '2022-08-05 04:45:26', 1),
(7, 5, '00e800bc-319d-4567-b8ba-f3775644630b', 0, '2022-08-05 04:45:45', 1),
(8, 5, '00e800bc-319d-4567-b8ba-f3775644630b', 10, '2022-08-05 10:23:35', 1),
(9, 5, '00e800bc-319d-4567-b8ba-f3775644630b', 6.67, '2022-08-05 10:30:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `st_id` varchar(36) NOT NULL,
  `st_name` varchar(255) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `st_address` varchar(255) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `dept_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `resetLink` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`st_id`, `st_name`, `gender`, `dob`, `email`, `st_address`, `contact`, `dept_id`, `password`, `resetLink`) VALUES
('0438088b-4d4c-4d13-8731-35abb45e77b4', 'staff1', 'Male', '1999-02-09', 'staff1@gmail.com', 'Cau Giay-Ha Noi-142', '0942247229', 'IT', '$2a$08$P0tZmQYCxO5iAgSpXTU4BuejvBQszkCE90rujj3XwFAbX0p0WGdHe', ''),
('6ce3d2b8-9f0e-455e-ba21-eff16eee41be', 'Jude Suares', 'Male', '2000-04-25', 'jude@gmail.com', 'ShangHai City-ShangHai City, China-6108', '509-847-3352', 'ECE', '$2a$08$w4hbV4IhYH/Hyi.zTU44meGfu1k6/rw4OVJhi0yGqorKMRgPnNOLC', ''),
('b5776117-1eff-4dc6-a98e-9f3232cf336d', 'Antarcia Vantica', 'Male', '2000-09-02', 'staff2@gmail.com', 'Shinjuku-Tokyo-3294', '0942247229', 'AI', '$2a$08$ONZkLx8ZnsTN/R/bTc.5/uAFiPqz..5wpr8Wgqhf1EA80hWavZanC', '');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `s_id` varchar(36) NOT NULL,
  `s_name` varchar(255) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `s_address` varchar(255) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `password` varchar(255) NOT NULL,
  `section` int NOT NULL,
  `joining_date` date DEFAULT (curdate()),
  `dept_id` varchar(255) DEFAULT NULL,
  `resetLink` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`s_id`, `s_name`, `gender`, `dob`, `email`, `s_address`, `contact`, `password`, `section`, `joining_date`, `dept_id`, `resetLink`) VALUES
('0032b5e0-b493-4f18-8c0b-3c774610b4a7', 'Avery Steier', 'Female', '2000-08-26', 'avery@cox.net', '93 Redmond Rd #492-Orlando-32803', '407-945-8566', '$2a$08$7yRn5Xfk1ORbIVPlmoC2sutjMUzuf6i0nmIEqRz4D5Q10mc4F4jRm', 3, '2022-07-27', 'IT', ''),
('00e800bc-319d-4567-b8ba-f3775644630b', 'Leota Dilliard', 'Female', '2000-01-09', 'leota@hotmail.com', '7 W Jackson Blvd-San Jose-95111', '408-813-1105', '$2a$08$ewB1.hHEybOCp88Kpeo6iOCFGZPkdqpRgxEyPdVxgeT6a/ZfTKlgC', 1, '2022-07-27', 'ECE', ''),
('01943292-af84-4145-9a50-33e1e68a2b2b', 'Quentin Birkner', 'Male', '2001-03-06', 'qbirkner@aol.com', '7061 N 2nd St-Burnsville-55337', '952-314-5871', '$2a$08$Mxp7aCxSKpMHPX37G1KIlOiZs3fetDRDEnyaoXHl.ZRTJf/IzfVVu', 1, '2022-07-27', 'ME', ''),
('01c3c8c5-7cb4-4e58-a686-1b4e819cbb0e', 'Daron Dinos', 'Male', '2000-09-25', 'daron_dinos@cox.net', '18 Waterloo Geneva Rd-Highland Park-60035', '847-265-6609', '$2a$08$RQd3vZfUBfook8oYJz1u.O8jJVbmT7HJRz4RRHHVi2.QoVpVnDRyS', 1, '2022-07-27', 'BT', ''),
('020b6b1b-625d-42a1-aff6-64376a721f8d', 'Vilma Berlanga', 'Female', '2001-04-17', 'vberlanga@berlanga.com', '79 S Howell Ave-Grand Rapids-49546', '616-568-4113', '$2a$08$LeKwfSQqlMQf5PHs4aadNe0C0b4zskYvfRSOXy2hc9L0wkQRoWEdW', 3, '2022-07-27', 'ME', ''),
('021fcc5b-44bd-4556-a3d9-88557c333a9c', 'Matthew Neither', 'Female', '2000-11-02', 'mneither@yahoo.com', '636 Commerce Dr #42-Shakopee-55379', '952-906-4597', '$2a$08$bptMKnQpO0ySr5wkboT2sOBSvBfDu4Pcg97e98sRCt5GtK4g6lNTG', 3, '2022-07-27', 'BT', ''),
('0220eeec-e56d-471e-93bd-8feb23b68a82', 'Donette Foller', 'Female', '2000-01-06', 'donette.foller@cox.net', '34 Center St-Hamilton-45011', '513-549-4561', '$2a$08$Yp1LphtLs.7JRSY4Lbw8cOu32xj4P0Hyy8tsRp7mUm/k/WRTpF94K', 1, '2022-07-27', 'ECE', ''),
('0259e0dd-fe1d-4b9c-85dc-bf93a4452631', 'Jennifer Fallick', 'Female', '2000-07-04', 'jfallick@yahoo.com', '44 58th St-Wheeling-60090', '847-800-3054', '$2a$08$W.S6Zjq2grXdcYcFIxNGROaec5tGWafZJF82KTgg.J/MNg0/ikOCG', 3, '2022-07-27', 'ICE', ''),
('02c8d2a5-1926-40d4-85ee-602a449d5601', 'Galen Cantres', 'Male', '2001-03-22', 'galen@yahoo.com', '617 Nw 36th Ave-Brook Park-44142', '216-871-6876', '$2a$08$aXMgRtxSVy9v0p6DjUwXtOb3AQjKEpd/FqIFJHHExLbmWD2DhPn.G', 2, '2022-07-27', 'ME', ''),
('040652fa-a762-4c7c-8983-e23472f0f2fa', 'Stephen Emigh', 'Female', '2000-04-06', 'stephen_emigh@hotmail.com', '3777 E Richmond St #900-Akron-44302', '330-700-2312', '$2a$08$pD.rhHaycS3VzWsfq.TSpe2LX8LuS7E8pvqUVcuj/9BxK7ePKkAcK', 2, '2022-07-27', 'CSE', ''),
('0477616d-9c08-4852-8cee-9bb1418d0f53', 'Merissa Tomblin', 'Male', '2001-04-28', 'merissa.tomblin@gmail.com', '34 Raritan Center Pky-Bellflower-90706', '562-719-7922', '$2a$08$VKBreuEk5G8n2weGeiUL1.0dZr34LCDghUyCCGBgMbVCYFhbfo1Su', 3, '2022-07-27', 'ME', ''),
('04d7b742-6f2f-442e-9352-9689d09eb9fa', 'Melissa Wiklund', 'Female', '2000-06-02', 'melissa@cox.net', '61 13 Stoneridge #835-Findlay-45840', '419-254-4591', '$2a$08$suN00ca2QZB8osSnnufCp.nRjZnUl6DJ6onzXUZCeAOo0wZ6daQDm', 2, '2022-07-27', 'ICE', ''),
('0539cf24-0e3b-45b0-a54d-d3c13101791a', 'Karl Klonowski', 'Male', '2000-02-28', 'karl_klonowski@yahoo.com', '76 Brooks St #9-Flemington-8822', '908-470-4661', '$2a$08$r7KB53sVoYan02RjVpzVzuRxLan6Ige4.a7H0.NPWKlNaEmxmrchu', 3, '2022-07-27', 'ECE', ''),
('057912ae-2f42-4034-96a0-f7202216af91', 'Nieves Gotter', 'Male', '2000-05-27', 'nieves_gotter@gmail.com', '4940 Pulaski Park Dr-Portland-97202', '503-455-3094', '$2a$08$..GMz1rtuSqFAoccd0LIIefJSQ3JfSVmNXGE4AF6QrlMLWSd9wB/.', 1, '2022-07-27', 'ICE', ''),
('05923126-ab8f-4a7f-a3cf-51e04f8bf38c', 'Merilyn Bayless', 'Female', '2000-07-20', 'merilyn_bayless@cox.net', '195 13n N-Santa Clara-95054', '408-346-2180', '$2a$08$5P2cvtTF0fkFswNVb.EjJOsaTd18fCIooA/IFzqiqktxRwDty/uSC', 1, '2022-07-27', 'IT', ''),
('059a62a7-3475-48dc-ae0d-215b2ec6b259', 'Shalon Shadrick', 'Male', '2001-02-18', 'shalon@cox.net', '61047 Mayfield Ave-Brooklyn-11223', '718-394-4974', '$2a$08$Y230h3JUQL6Jj8QFxO6KMOz/Yi0FIush.sEsRinjsYmphpSy4v4H.', 3, '2022-07-27', 'MPAE', ''),
('063dcd1b-a074-4899-9200-6206b9cba490', 'Carmela Cookey', 'Male', '2000-07-15', 'ccookey@cookey.org', '9 Murfreesboro Rd-Chicago-60623', '773-297-9391', '$2a$08$pJx4JBR57QVFf/czscz1vutt3c5uJq/9cjvsOXFvLhGHPY/bDj/fy', 1, '2022-07-27', 'IT', ''),
('069ab351-80eb-4661-a0fb-c9f34ecfbe0a', 'Joseph Cryer', 'Female', '2000-10-21', 'joseph_cryer@cox.net', '60 Fillmore Ave-Huntington Beach-92647', '714-698-2170', '$2a$08$8heLs.dZ3cOJmnZHD4lHxOk.atSeXuaIcSpYIOVlqc8/bZw6/6C/W', 2, '2022-07-27', 'BT', ''),
('06e65395-804f-4291-9572-f0f80b745475', 'Paris Wide', 'Female', '2001-03-04', 'paris@hotmail.com', '187 Market St-Atlanta-30342', '404-607-8435', '$2a$08$Tmt82BP8ta.pGfba2h8.Au5ApxR8ZGVxo0dKSgj91mVKG4Fug5hz6', 1, '2022-07-27', 'ME', ''),
('07633500-f681-45d7-9d55-8e5bea75d8e4', 'Detra Coyier', 'Female', '2000-10-26', 'detra@aol.com', '96950 Hidden Ln-Aberdeen-21001', '410-259-2118', '$2a$08$FFu2woXbwuTGxCFEu/uxOOD4gKf5.x47UMPFAEUUMy48kemltDi9m', 2, '2022-07-27', 'BT', ''),
('083c15bc-1612-4c40-bd89-b87a906baa82', 'Teri Ennaco', 'Male', '2000-07-21', 'tennaco@gmail.com', '99 Tank Farm Rd-Hazleton-18201', '570-355-1665', '$2a$08$H6C7uErNVmLQjOMgSCS/qefdOePYea0lDtCU3Hd7naxApL8ySBVnm', 1, '2022-07-27', 'IT', ''),
('0878c9a3-e6c6-46ec-ac53-057ad77853a7', 'Golda Kaniecki', 'Male', '2001-05-01', 'golda_kaniecki@yahoo.com', '6201 S Nevada Ave-Toms River-8755', '732-617-5310', '$2a$08$i61hSt3ggU2zRoLsMNsZSORo3E48VeIiV0UF10kVW.qo1JP2DC.Se', 3, '2022-07-27', 'ME', ''),
('0879d1b6-9b6b-45b8-82cb-bda9d7006f25', 'Dulce Labreche', 'Female', '2001-02-02', 'dulce_labreche@yahoo.com', '9581 E Arapahoe Rd-Rochester-48307', '248-811-5696', '$2a$08$9BAHypQmn3AY8F5h3FYFIOrw7GEabIZXetSe1YPaGnyQDJE5.bIZu', 2, '2022-07-27', 'MPAE', ''),
('08bb67bc-c823-4f0b-b966-68bcdfb10b67', 'Thurman Manno', 'Male', '2000-05-23', 'thurman.manno@yahoo.com', '9387 Charcot Ave-Absecon-8201', '609-234-8376', '$2a$08$TzoZ5vKMmp1ItqEz0dziiOK82wUfvqsjI9MHPp/zAU50jkLVhpo4y', 1, '2022-07-27', 'ICE', ''),
('094cc26c-bc70-4d8e-9de4-af5ff1269bfe', 'Youlanda Schemmer', 'Male', '2000-02-14', 'youlanda@aol.com', '2881 Lewis Rd-Prineville-97754', '541-993-2611', '$2a$08$nwMACVlzsw1B8ICWXXnXYu9/aSU1c9AE8VZQksDOXxyGFcegHZQhy', 3, '2022-07-27', 'ECE', ''),
('0b3e908a-9240-4924-aab1-860dd7043644', 'Micaela Rhymes', 'Male', '2000-03-19', 'micaela_rhymes@gmail.com', '20932 Hedley St-Concord-94520', '925-522-7798', '$2a$08$NECqYKZIJb0gRR42Gu9Xzei3nSKVI/ZQcWgVk0/N5RJwXNvn4wHmG', 1, '2022-07-27', 'CSE', ''),
('0b6d6bd0-f1e7-41fe-b3cd-e062f0fc8c58', 'Cecily Hollack', 'Female', '2000-03-08', 'cecily@hollack.org', '59 N Groesbeck Hwy-Austin-78731', '512-861-3814', '$2a$08$WNtFyE672Do1a.V4DhUHmOGHkM4PLrjugfP/.c/gERn2KKJDEUS8.', 1, '2022-07-27', 'CSE', ''),
('0c311949-47f4-46f2-b8dd-94bda12e0bde', 'Markus Lukasik', 'Male', '2001-03-14', 'markus@yahoo.com', '89 20th St E #779-Sterling Heights-48310', '586-247-1614', '$2a$08$EkqSns.BdQiJmMsz/l9MVuBXghsEsYmTIIZvJo.ZAgQ/X4RBYPDDq', 1, '2022-07-27', 'ME', ''),
('0c4646d0-387f-4a7a-b1f3-f6d10a29343c', 'Corinne Loder', 'Male', '2001-02-01', 'corinne@loder.org', '4 Carroll St-North Attleboro-2760', '508-618-7826', '$2a$08$xK3y3KVEjbcgiEgtPQ8K/OiB/ETe/lL6lDJKQskfZBhGldqnkJA/m', 2, '2022-07-27', 'MPAE', ''),
('0c64bc5f-efc8-45bd-b88c-bc8038556042', 'Valentin Klimek', 'Male', '2000-06-01', 'vklimek@klimek.org', '137 Pioneer Way-Chicago-60604', '312-512-2338', '$2a$08$nt70E2hUHAtQgUEq.8mlS.cXO0C/Xi7XYQv/spTHHcqW7KHUOPHF2', 1, '2022-07-27', 'ICE', ''),
('0c9b0200-28d3-47ea-90c0-2f296895ce43', 'Glenn Berray', 'Male', '2001-03-28', 'gberray@gmail.com', '29 Cherry St #7073-Des Moines-50315', '515-372-1738', '$2a$08$VtCmiKyZzPe4MMyLwSwRpeb.5u5Xr5VTQxp1IeFmkOgELgptVLyU6', 2, '2022-07-27', 'ME', ''),
('0e763eb2-4b01-4a50-b58c-0f1ae6ccd69d', 'Weldon Acuff', 'Male', '2001-02-17', 'wacuff@gmail.com', '73 W Barstow Ave-Arlington Heights-60004', '847-613-5866', '$2a$08$F4fY9FZpx.rx3lmsm2xabeWS/6LCn835gN9L.fSFR2PpXudUK7E/i', 3, '2022-07-27', 'MPAE', ''),
('0e91f612-21fe-4df9-b321-3a742cc6e473', 'Lenna Newville', 'Male', '2001-04-02', 'lnewville@newville.com', '987 Main St-Raleigh-27601', '919-254-5987', '$2a$08$UqJYjEFM3cM7DlKTGGf/gONYhpt9C4/7k7UbsneI4klo6jwKDvhj.', 2, '2022-07-27', 'ME', ''),
('0eefc49d-f6c3-414d-8183-e69316655662', 'Carma Vanheusen', 'Female', '2000-04-13', 'carma@cox.net', '68556 Central Hwy-San Leandro-94577', '510-452-4835', '$2a$08$iAqF9G/Mo4GBzh.fraGtreVzQeHEMXcLaS368ntA7bU.5sgj3mDjy', 2, '2022-07-27', 'CSE', ''),
('0f454fb1-06b2-4561-b975-92e21814f585', 'Sage Wieser', 'Female', '2000-01-10', 'sage_wieser@cox.net', '5 Boston Ave #88-Sioux Falls-57105', '605-794-4895', '$2a$08$rAKc9BLHDvo9SYo7IZVeq.yf1hqGazj0DLt/Ziddkmu670PE.sBA2', 1, '2022-07-27', 'ECE', ''),
('0f834f9a-c4ef-486a-87ed-8f6809d5c543', 'Cory Gibes', 'Female', '2000-04-09', 'cory.gibes@gmail.com', '83649 W Belmont Ave-San Gabriel-91776', '626-696-2777', '$2a$08$DIHQuJtr9klTtL.6MtLsq.AJMUBafT6pBvEDnpN5hhw9hRZBO2JlO', 2, '2022-07-27', 'CSE', ''),
('0fbe725d-a11c-4366-a59e-365777260542', 'Kate Keneipp', 'Male', '2001-02-03', 'kate_keneipp@yahoo.com', '33 N Michigan Ave-Green Bay-54301', '920-355-1610', '$2a$08$N/xfiOE5K2JVWeafCR5/LO35AuLjp5gan6ILjE0fxBAY.UU9dVn7C', 2, '2022-07-27', 'MPAE', ''),
('0fe9f742-c00c-4f99-b2d7-d6f97484cad6', 'Fernanda Jillson', 'Female', '2000-06-07', 'fjillson@aol.com', '60480 Old Us Highway 51-Preston-21655', '410-724-6472', '$2a$08$IEASI7tIyqxAQ0PryWsSxubR5Uy/BFGltgs7N2SVYhFgsqyftvaNS', 2, '2022-07-27', 'ICE', ''),
('10024c2f-bc1b-4bbc-909d-f71653fd067e', 'Theodora Restrepo', 'Female', '2000-11-03', 'theodora.restrepo@restrepo.com', '42744 Hamann Industrial Pky #82-Miami-33136', '305-573-1085', '$2a$08$lxRu29DjZuezf5xs7.GjJuP.cAzAl7fRN4jFUO6O..leVXJqNOicK', 3, '2022-07-27', 'BT', ''),
('102c1bea-09e8-4dfc-9f04-8c83eff3b246', 'Sherita Saras', 'Female', '2001-02-05', 'sherita.saras@cox.net', '8 Us Highway 22-Colorado Springs-80937', '719-547-9543', '$2a$08$FXvMUV1rhtpIKdsXJXM3verDQupZP4mq1IECq..Og69v.TOfkZnZ.', 2, '2022-07-27', 'MPAE', ''),
('1097db20-5091-4ca0-bdb1-00dcba24c435', 'Truman Feichtner', 'Male', '2001-03-23', 'tfeichtner@yahoo.com', '539 Coldwater Canyon Ave-Bloomfield-7003', '973-473-5108', '$2a$08$sboKdHVi/EDGdMV7VIhzUeUb/BAeAIVQ4NVqMTc4AM0qS96NNvRm6', 2, '2022-07-27', 'ME', ''),
('1119695f-64eb-4381-8b31-f796e9ce6d31', 'Carmen Sweigard', 'Female', '2000-11-05', 'csweigard@sweigard.com', '61304 N French Rd-Somerset-8873', '732-445-6940', '$2a$08$4MyxavJpYhaqPOKo5e2u9OcyM.51jnJG0Zngg5OnolnN31b95mSsi', 3, '2022-07-27', 'BT', ''),
('11741872-2d53-4bcc-8f75-3d5d9bd50878', 'Sheridan Zane', 'Male', '2000-06-03', 'sheridan.zane@zane.com', '2409 Alabama Rd-Riverside-92501', '951-248-6822', '$2a$08$.zQTVs8oQ..9YyZ1dAb8teGoPXRPmW4Dmx5fgnB9OUL1EeGPmFdoK', 2, '2022-07-27', 'ICE', ''),
('1245ec51-03f4-4dba-8492-888012b5a0e2', 'Dalene Schoeneck', 'Male', '2001-03-25', 'dalene@schoeneck.org', '910 Rahway Ave-Philadelphia-19102', '215-380-8820', '$2a$08$QkzpmXyEBtpV5rMdD9qMae.T8cVc7Bvbz/m2rIPlZZq7hnYyISg5m', 2, '2022-07-27', 'ME', ''),
('12d7054e-722e-488e-89e6-be5bcba7d5de', 'Herminia Nicolozakes', 'Female', '2000-11-08', 'herminia@nicolozakes.org', '4 58th St #3519-Scottsdale-85254', '602-304-6433', '$2a$08$BWhmPvpfs7o8OiGCNvZCuuQFB3FBssYNrk4vNr0t5Yzzf.RfsN0Oi', 3, '2022-07-27', 'BT', ''),
('130dcd4e-13b8-416b-baf6-9b752c56a278', 'Kasandra Semidey', 'Female', '2001-02-26', 'kasandra_semidey@semidey.com', '369 Latham St #500-Saint Louis-63102', '314-697-3652', '$2a$08$4cJnyo.SpyC8Mv5un/0d2OD63YrWi8YW6oyff.K73hlZq7vGpcQ72', 1, '2022-07-27', 'ME', ''),
('13a90bf1-5be4-4a70-b497-dcc6809cec24', 'Dominque Dickerson', 'Male', '2000-04-01', 'dominque.dickerson@dickerson.org', '69 Marquette Ave-Hayward-94545', '510-901-7640', '$2a$08$NpBngPO.VhuMrwOofZeVF.6zF9WEmGFuFcYOpHyJA2urxpX0iv9Pq', 2, '2022-07-27', 'CSE', ''),
('13b3bffe-0127-4852-a0eb-c99367ac4d6d', 'Van Shire', 'Male', '2000-05-17', 'van.shire@shire.com', '90131 J St-Pittstown-8867', '908-448-1209', '$2a$08$NfamSqMHL2pD4Y1w9IDSR.CL9FCIgir3N82Co4oE6ksA8iGt8Pj1G', 1, '2022-07-27', 'ICE', ''),
('13cb4163-6b58-4eed-81fc-8a287adc7a02', 'Carey Dopico', 'Female', '2000-10-04', 'carey_dopico@dopico.org', '87393 E Highland Rd-Indianapolis-46220', '317-441-5848', '$2a$08$BHXHHvbTkhQYHtq5JFxWT.gGCaYAluJl/eCqc7oGWsu6kAySwEPra', 1, '2022-07-27', 'BT', ''),
('14a62af5-1e86-4aa7-a9ba-f8982761c69c', 'Ilene Eroman', 'Male', '2000-03-14', 'ilene.eroman@hotmail.com', '2853 S Central Expy-Glen Burnie-21061', '410-937-4543', '$2a$08$sl07TY/UEWEoLEFHTl.l6uW3VQVlQ1f2YRdnZGOgaARrA0wc1z/ZO', 1, '2022-07-27', 'CSE', ''),
('1629a5a4-8200-45ea-93fc-2837b993e74f', 'Devorah Chickering', 'Female', '2000-03-26', 'devorah@hotmail.com', '31 Douglas Blvd #950-Clovis-88101', '505-950-1763', '$2a$08$GfafT3BWXjhFIn249RAKHeBdGK982gQVOHPfsDiVXVZxo85idvTte', 2, '2022-07-27', 'CSE', ''),
('172a88b3-fd09-4354-9a64-44b1f9516a47', 'Lashandra Klang', 'Female', '2001-04-01', 'lashandra@yahoo.com', '810 N La Brea Ave-King of Prussia-19406', '610-378-7332', '$2a$08$IWMNQCLfKkro.DmxncWqk.3rI3xwRmnLUSOfIZyPcgPhgqVoF2rFe', 2, '2022-07-27', 'ME', ''),
('18242431-dea5-4623-a6ef-5f6da03b50e9', 'Maile Linahan', 'Male', '2001-02-28', 'mlinahan@yahoo.com', '9 Plainsboro Rd #598-Greensboro-27409', '336-364-6037', '$2a$08$5OBYK7r0goPNwfHbvKjfT.UgwOJ0/rWGPFarrQrckFqYM2p5yzqrS', 1, '2022-07-27', 'ME', ''),
('182a5670-0e90-4021-b5ba-1a7a08905932', 'Mitzie Hudnall', 'Male', '2001-04-20', 'mitzie_hudnall@yahoo.com', '17 Jersey Ave-Englewood-80110', '303-997-7760', '$2a$08$Lg2iINwMzraCg0JC1OQmeexlz38iZE/QIDG8aL5ToYpH2NtQiks8K', 3, '2022-07-27', 'ME', ''),
('182d9042-3ebd-4c1c-8ef7-9f7affeae088', 'Theola Frey', 'Male', '2000-06-10', 'theola_frey@frey.com', '54169 N Main St-Massapequa-11758', '516-357-3362', '$2a$08$4e3T2GCR/zS51CacybCsMuTbPUuINFH1.zjRkkhDjJj9mS/wIwHli', 2, '2022-07-27', 'ICE', ''),
('183f6081-763b-4723-9793-cda4cb4dcfcb', 'Janine Rhoden', 'Male', '2001-04-24', 'jrhoden@yahoo.com', '92 Broadway-Astoria-11103', '718-728-5051', '$2a$08$D6HjQT8ioNzbiwplsxe4WuZfqyPbEgHXmtAvyT2WErI4oOaXSkxYm', 3, '2022-07-27', 'ME', ''),
('19608b83-c476-4284-9384-be2c5aabb72d', 'Mariann Bilden', 'Female', '2001-02-11', 'mariann.bilden@aol.com', '3125 Packer Ave #9851-Austin-78753', '512-742-1149', '$2a$08$JZu7LIDIbgCZiK.GwUgXK.t/dVJ4Futu8LBs8vZ9p4CfGIl.czEbS', 3, '2022-07-27', 'MPAE', ''),
('19640156-7aa5-46b6-be65-bb9c5577345b', 'Josephine Darakjy', 'Male', '2000-01-03', 'josephine_darakjy@darakjy.org', '4 B Blue Ridge Blvd-Brighton-48116', '810-374-9840', '$2a$08$Dos3dcuRwNDwgE/wjIAJiuNenisi9uYluUy.q6N/kcJ6HfPHSD.0a', 1, '2022-07-27', 'ECE', ''),
('1a155b9d-0bf3-4bae-9e14-87675e2374e3', 'Lenna Paprocki', 'Female', '2000-01-05', 'lpaprocki@hotmail.com', '639 Main St-Anchorage-99501', '907-921-2010', '$2a$08$9I7UeY/hTjwC8UNaPyDzk.rbgeX5j4R4nb9R.OGbJwfem3YwwLZ52', 1, '2022-07-27', 'ECE', ''),
('1a485aee-7520-46bd-a14c-44497ad67860', 'Heike Berganza', 'Male', '2000-10-03', 'heike@gmail.com', '3 Railway Ave #75-Little Falls-7424', '973-822-8827', '$2a$08$oqB0.EZv6vO7W0xLCUFShugsaz0CofJNyqxK.5asWUJQH6d77d6je', 1, '2022-07-27', 'BT', ''),
('1a93d630-f72d-4b08-8684-9568396890e0', 'Vincent Meinerding', 'Female', '2000-08-23', 'vincent.meinerding@hotmail.com', '4441 Point Term Mkt-Philadelphia-19143', '215-829-4221', '$2a$08$ycc3Wwa3nBPmFRs640xrZOa2Hqk6AmByy5YQf6yjEsFYoj6jhlqmu', 2, '2022-07-27', 'IT', ''),
('1ab99e35-1747-47fd-b6c6-f9f770c0b8b2', 'Carmelina Lindall', 'Male', '2000-03-09', 'carmelina_lindall@lindall.com', '2664 Lewis Rd-Littleton-80126', '303-874-5160', '$2a$08$7ZI3R5ZzJqnjcNWaq2iqmOTBaNzCp2TTre//hmSypcR4w4YdzeK.q', 1, '2022-07-27', 'CSE', ''),
('1bc063aa-7410-40f7-bf1c-92e735e37f49', 'Tawna Buvens', 'Male', '2000-03-11', 'tawna@gmail.com', '3305 Nabell Ave #679-New York-10009', '212-462-9157', '$2a$08$kzCMvVbs.CgapbD9mzE0QuviY/bP4bmLq2PZ/WNa0sMMZIpUWwOda', 1, '2022-07-27', 'CSE', ''),
('1c05ed35-9211-4381-800f-2e599809e63a', 'Earleen Mai', 'Male', '2000-09-05', 'earleen_mai@cox.net', '75684 S Withlapopka Dr #32-Dallas-75227', '214-785-6750', '$2a$08$7jLMeW08etLHspMd3/dXDelM2zxzyJV2NDwLq6kB8s3p5O32nGqaW', 3, '2022-07-27', 'IT', ''),
('1c1930bb-9b3c-4325-be4d-dbacd5bd1dae', 'Gayla Schnitzler', 'Female', '2001-03-17', 'gschnitzler@gmail.com', '38 Pleasant Hill Rd-Hayward-94545', '510-441-4055', '$2a$08$ner7Q/N8LC6w8roGSwQRR.lNNVDnLsZ9GZSzfT8sKEUk/Oe0jZjXy', 1, '2022-07-27', 'ME', ''),
('1c37b907-d91e-48b7-8e63-e9c4beb482b0', 'Myra Munns', 'Female', '2000-04-03', 'mmunns@cox.net', '461 Prospect Pl #316-Euless-76040', '817-451-3518', '$2a$08$xDmqG8hrwOgeVfsa0H7hbeoCN1Zlh1nX.3.4Ixz.FYurnJgAc5Ggi', 2, '2022-07-27', 'CSE', ''),
('1e49cb90-c2fb-4a96-8725-563a3c90be9b', 'Jerry Dallen', 'Male', '2001-01-21', 'jerry.dallen@yahoo.com', '393 Lafayette Ave-Richmond-23219', '804-808-9574', '$2a$08$ucm0EyFleGGtPnSsgqW92.7.69bPbp2ohWHv7YGkEraaiijH42FLG', 2, '2022-07-27', 'MPAE', ''),
('1fb1521a-1184-4ac0-b009-4eb046dbfb52', 'Willard Kolmetz', 'Male', '2000-01-24', 'willard@hotmail.com', '618 W Yakima Ave-Irving-75062', '972-896-4882', '$2a$08$CntcWiAs//fujQS8bht/n.EG3Rnobi00BMbEjsG/knqGt9QSClEFS', 2, '2022-07-27', 'ECE', ''),
('1fb3d47d-ce53-42b5-a825-0a5cb61a5bae', 'Xochitl Discipio', 'Female', '2001-02-27', 'xdiscipio@gmail.com', '3158 Runamuck Pl-Round Rock-78664', '512-942-3411', '$2a$08$X.8kapkLDZoTy4/qTJAc1.sQxrgDBzodu2dlDnaPw6cRHeEyWBPHi', 1, '2022-07-27', 'ME', ''),
('20aeea46-4fc2-4139-aa09-9d3d39494ba6', 'Nicolette Brossart', 'Male', '2000-08-28', 'nicolette_brossart@brossart.com', '1 Midway Rd-Westborough-1581', '508-504-6388', '$2a$08$7A0QDyEjpxQIIi/Z5Gr0yObmbDxVQFIzB8lzwG7FVyC.fNnh2DGby', 3, '2022-07-27', 'IT', ''),
('2290e430-b596-4e51-80af-53b830fc430a', 'Eun Coody', 'Female', '2000-07-06', 'eun@yahoo.com', '84 Bloomfield Ave-Spartanburg-29301', '864-594-4578', '$2a$08$X50N1aikuIKL1n/urezS3OFzNSm9QSSj5zsSqbCJCM1pKijiS.FKi', 3, '2022-07-27', 'ICE', ''),
('22c7e7d7-9bbf-42dc-b488-dc349183873f', 'Jennie Drymon', 'Male', '2001-03-19', 'jennie@cox.net', '63728 Poway Rd #1-Scranton-18509', '570-868-8688', '$2a$08$0HMjARYj5CkFfZ.OdEPLOep4RZIcdMiOHeyoaFiZikVGtaAAMRy7C', 2, '2022-07-27', 'ME', ''),
('2324dd96-57de-49dd-a20b-42bf3d29144b', 'Tiera Frankel', 'Male', '2000-09-03', 'tfrankel@aol.com', '87 Sierra Rd-El Monte-91731', '626-638-4241', '$2a$08$9eScd6RgaMaSzBaV5caEquekSUj8sE353gJ.4B3E8uv9POMKF31zO', 3, '2022-07-27', 'IT', ''),
('23b80d53-643a-4ec4-9778-c33d2304544d', 'Denise Patak', 'Male', '2001-02-19', 'denise@patak.org', '2139 Santa Rosa Ave-Orlando-32801', '407-808-3254', '$2a$08$m2v.IOOewwORkgjOlLzJy.WDI1/SRR5Yiq.Fgd9u3oUse3adArg3m', 3, '2022-07-27', 'MPAE', ''),
('264d2013-1f75-4776-ad35-fe74cd8d4a53', 'Haydee Denooyer', 'Female', '2000-10-20', 'hdenooyer@denooyer.org', '25346 New Rd-New York-10016', '212-782-3493', '$2a$08$PYwc5siwz9L7PohQwODFnuJZ.5RsyVJZeODE9oMMDjGuHAaBgv2cq', 2, '2022-07-27', 'BT', ''),
('267d7b7b-1c78-4eaa-8299-f09e9f765e57', 'Elvera Benimadho', 'Male', '2000-04-12', 'elvera.benimadho@cox.net', '99385 Charity St #840-San Jose-95110', '408-440-8447', '$2a$08$EQ2/bdLPJ81klCOPML9YYuMz4jLugWogLBoIXJb2TLRHcLMvVBvZe', 2, '2022-07-27', 'CSE', ''),
('268116d7-1a81-4744-8e0c-8fbac07bb8c5', 'Shenika Seewald', 'Female', '2000-03-03', 'shenika@gmail.com', '4 Otis St-Van Nuys-91405', '818-749-8650', '$2a$08$Iyby70RpAVgh3CtfBMEc8.sAmnks..u3XMz.ZQJYEeGvZnDOfDZXK', 3, '2022-07-27', 'ECE', ''),
('26a05ff9-446d-4c39-9164-b4c5d5a03e20', 'Moon Parlato', 'Male', '2000-03-21', 'moon@yahoo.com', '74989 Brandon St-Wellsville-14895', '585-498-4278', '$2a$08$clKFZQbRX7.DOBv43TVx8OUmeAr0LskFq/s0C65Fh6v49SjdiiW7q', 1, '2022-07-27', 'CSE', ''),
('2767d036-5eeb-4fff-921d-e9432aed6e2f', 'Tiffiny Steffensmeier', 'Male', '2000-04-27', 'tiffiny_steffensmeier@cox.net', '32860 Sierra Rd-Miami-33133', '305-304-6573', '$2a$08$LlOL5v2BoBYXeY8zN3x89O66aeoLBuKgIxDwxOQHgMz96eQZP6/Gu', 3, '2022-07-27', 'CSE', ''),
('27b95814-02a7-4646-8820-829828576729', 'Samira Heintzman', 'Female', '2001-02-14', 'sheintzman@hotmail.com', '8772 Old County Rd #5410-Kent-98032', '206-923-6042', '$2a$08$2hD3ExSbCTE9ayugDT/ePupTv6N8g50ew9Hb62FKvuEVuwEfFAZuS', 3, '2022-07-27', 'MPAE', ''),
('27c022a4-b1fb-4dde-859f-e7ac12501bb7', 'Salena Karpel', 'Male', '2000-09-12', 'skarpel@cox.net', '1 Garfield Ave #7-Canton-44707', '330-618-2579', '$2a$08$RX1SzhuACKN8v62xGwYrNe2OeElJwanyvFvn5n3WmwAvugKv7wUtG', 3, '2022-07-27', 'IT', ''),
('2820bb45-b96c-4fb0-a66c-4c345ff452c8', 'Albina Glick', 'Female', '2000-02-07', 'albina@glick.com', '4 Ralph Ct-Dunellen-8812', '732-782-6701', '$2a$08$n5GjNJh9bdryCvCX7wRh3.0HHqF3sZC0wqoJwy29wBd8EpA.Dt.tC', 2, '2022-07-27', 'ECE', ''),
('2837dfd5-fb3e-42b1-8735-a55ff5becbbb', 'Estrella Samu', 'Male', '2000-04-25', 'estrella@aol.com', '64 Lakeview Ave-Beloit-53511', '608-942-8836', '$2a$08$a13pZGyBJc7wIYwkiL/us.MVmjtZZQmcRYXGIWro6E4ukOu7584cK', 3, '2022-07-27', 'CSE', ''),
('28ad1204-e51f-49a1-bb1c-4626f5daa4e8', 'Judy Aquas', 'Male', '2000-11-17', 'jaquas@aquas.com', '8977 Connecticut Ave Nw #3-Niles-49120', '269-431-9464', '$2a$08$BDNhKg8pl1ieX9W69em5GeKg0F4I3rzYhtgObsFxqy1dHfwCkjUjO', 3, '2022-07-27', 'BT', ''),
('28d05f6c-eb41-41be-b9af-c6e9a1876536', 'Kayleigh Lace', 'Female', '2000-11-19', 'kayleigh.lace@yahoo.com', '43 Huey P Long Ave-Lafayette-70508', '337-751-2326', '$2a$08$etC6Tjej26mFpezwPGabqeXaJUZZ6rALkApAHT9fKwW1in3ZaTN.S', 3, '2022-07-27', 'BT', ''),
('2a8041f6-10c2-4feb-98b2-692c17611df4', 'Kattie Vonasek', 'Female', '2001-01-07', 'kattie@vonasek.org', '2845 Boulder Crescent St-Cleveland-44103', '216-270-9653', '$2a$08$bFdgZNQbxL96wZ3qBoB7cOHmCwcmURJ1Ud98XTiuq70sSbstu4T6K', 1, '2022-07-27', 'MPAE', ''),
('2b961549-b6d5-4c6a-94e5-85fe226c0a08', 'Ernie Stenseth', 'Female', '2000-02-06', 'ernie_stenseth@aol.com', '45 E Liberty St-Ridgefield Park-7660', '201-387-9093', '$2a$08$rWAmu6U0/L7o87I6dLijN.DxXGivaUwt8ih5sUGSfvLbte8W3jOBu', 2, '2022-07-27', 'ECE', ''),
('2e103ec3-06b0-4022-8a7f-ecf927483dc1', 'Erick Ferencz', 'Male', '2000-02-18', 'erick.ferencz@aol.com', '20 S Babcock St-Fairbanks-99712', '907-227-6777', '$2a$08$3T7uZXXulyV4ZkALddldnerwyOPjIFtluiu0GmBfqFcGmwU.0zDcO', 3, '2022-07-27', 'ECE', ''),
('2e3c3c68-bafd-430b-9973-8fb9de02e635', 'Lashaunda Lizama', 'Female', '2001-02-10', 'llizama@cox.net', '3387 Ryan Dr-Hanover-21076', '410-912-6032', '$2a$08$Powcp4ONmoH.bZCxqBj8OeFxI965MASnqRiK1I9r6/fb4czrcyJEG', 3, '2022-07-27', 'MPAE', ''),
('305a4b11-e9bb-4169-a9e7-e67455762685', 'Noah Kalafatis', 'Female', '2000-11-04', 'noah.kalafatis@aol.com', '1950 5th Ave-Milwaukee-53209', '414-660-9766', '$2a$08$/kbsqy2OlL.YMd50ih0zTuM1e0bER0FHUcc9hhr./2H/EGyr8gTQa', 3, '2022-07-27', 'BT', ''),
('30cdc3f6-4914-40c8-ac49-b27243036e55', 'Kristofer Bennick', 'Male', '2001-02-16', 'kristofer.bennick@yahoo.com', '772 W River Dr-Bloomington-47404', '812-442-8544', '$2a$08$o4fzCmIRCTQ2Tw2zrQBmkeawuI0b4bxvafIIHoEaas5Zg.ZHBBXDm', 3, '2022-07-27', 'MPAE', ''),
('315914ad-d50d-4cd8-b27f-76bbab091090', 'Nelida Sawchuk', 'Female', '2000-07-13', 'nelida@gmail.com', '3 State Route 35 S-Paramus-7652', '201-247-8925', '$2a$08$u7G9TadFwF8.pShk6hjzLusHQvltUhTnRaJvMxlYlqrxjVgC11MyC', 3, '2022-07-27', 'ICE', ''),
('31f31639-cf14-42db-85a9-e47382e7300f', 'Yoko Fishburne', 'Female', '2000-09-13', 'yoko@fishburne.com', '9122 Carpenter Ave-New Haven-6511', '203-840-8634', '$2a$08$JI5YuITTrThARk2i5WNQeODPn6mgjPB0KY9LHtvyLFebboyOig/rC', 3, '2022-07-27', 'IT', ''),
('321ca012-535e-4f97-aa97-78fd90202caa', 'Teddy Pedrozo', 'Female', '2001-04-13', 'teddy_pedrozo@aol.com', '46314 Route 130-Bridgeport-6610', '203-918-3939', '$2a$08$ZsuwkZG4o70VcIr8mVkTvOhQ9D7naDK3DE4SuGGvn10918fuDvOsO', 3, '2022-07-27', 'ME', ''),
('32262594-73f1-493b-b504-b79d98335de2', 'Annelle Tagala', 'Male', '2001-04-05', 'annelle@yahoo.com', '5 W 7th St-Parkville-21234', '410-234-2267', '$2a$08$YwLx4lTQr5fkNA2WYYRl9.fMy6suAFwvs/n0SqxTJ7/bQfWHJSvO2', 2, '2022-07-27', 'ME', ''),
('333499f1-8fbe-4952-9c7e-93932290dc53', 'Jamal Vanausdal', 'Male', '2000-03-07', 'jamal@vanausdal.org', '53075 Sw 152nd Ter #615-Monroe Township-8831', '732-904-2931', '$2a$08$dAwmIthCP5JAnTp7brJUieGzQQVCprdnuKIFxhTCyT/sQ0WZfc7Ja', 1, '2022-07-27', 'CSE', ''),
('33da36e0-bf7b-4281-869e-d17d38ad4c06', 'Devora Perez', 'Male', '2000-05-13', 'devora_perez@perez.org', '72868 Blackington Ave-Oakland-94606', '510-755-9274', '$2a$08$oSHOJR4UQv1/BpjtmXsLluoLRHpWiP9Cj3shlONRX7TKovH5ocjDi', 1, '2022-07-27', 'ICE', ''),
('34d0a9d5-40e0-42bf-b6e5-d776a667f03b', 'Garry Keetch', 'Male', '2000-11-01', 'garry_keetch@hotmail.com', '5 Green Pond Rd #4-Southampton-18966', '215-846-9046', '$2a$08$7c.56CiUUKY.5Kij3CdBVO/oFTF/yNIe/G6geKtCVhLDMeLmeX6z.', 2, '2022-07-27', 'BT', ''),
('35db9745-2781-48fe-957a-fe622a86e6b4', 'Staci Schmaltz', 'Male', '2001-04-22', 'staci_schmaltz@aol.com', '18 Coronado Ave #563-Pasadena-91106', '626-293-7678', '$2a$08$pKN/xAO4Lx.LB1wJBZFx8OCTZMZROFXheeKW7TI7vrZOPRW/wb8YK', 3, '2022-07-27', 'ME', ''),
('36c1d857-2bfa-4e35-97ee-464f02e6c765', 'Ciara Ventura', 'Male', '2001-03-21', 'cventura@yahoo.com', '53 W Carey St-Port Jervis-12771', '845-694-7919', '$2a$08$ke4QzORwEiQVdEY56dDzKOgey6k8d4bHqlvIo30IBhcNwDYdT4RXK', 2, '2022-07-27', 'ME', ''),
('3716659a-5691-4bf2-b5f4-ed3ed92aed37', 'Sheron Louissant', 'Male', '2001-03-08', 'sheron@aol.com', '97 E 3rd St #9-Long Island City-11101', '718-613-9994', '$2a$08$/1xu.3B6JAY2Tw5WejmhEulMsjjeOcBHv2uKT87d6B3MuGUT6dmeK', 1, '2022-07-27', 'ME', ''),
('384e0e56-a1ef-45d7-b9ee-ac51f42075d0', 'Wynell Dorshorst', 'Male', '2001-03-05', 'wynell_dorshorst@dorshorst.org', '94290 S Buchanan St-Pacifica-94044', '650-749-9879', '$2a$08$6ao3VMUwV42DaM.OWoHTgus1zgAd7a1qjM6Fef/0eQIbplponlzly', 1, '2022-07-27', 'ME', ''),
('39d27203-c5d5-4c6a-aa7d-6abc23cef675', 'Mireya Frerking', 'Male', '2001-04-04', 'mireya.frerking@hotmail.com', '8429 Miller Rd-Pelham-10803', '914-883-3061', '$2a$08$tga53Kv08ckfn6cPMPtLu.IfQtGK9kyfGNp6uVuOn6ef49agzk.YK', 2, '2022-07-27', 'ME', ''),
('39e8cffe-b4f8-40dc-bf3a-3ecdb0e1e8f1', 'Deeanna Juhas', 'Male', '2000-03-05', 'deeanna_juhas@gmail.com', '14302 Pennsylvania Ave-Huntingdon Valley-19006', '215-417-9563', '$2a$08$kGxc.bWbY5ZModTSHzXTLeGzo0TrigKTafPb4NX7.n.LApmx5GbgK', 3, '2022-07-27', 'ECE', ''),
('3a3dd36e-e70f-4c93-8ccf-5eb1df81e597', 'Martina Staback', 'Male', '2000-10-08', 'martina_staback@staback.com', '7 W Wabansia Ave #227-Orlando-32822', '407-429-2145', '$2a$08$uf4sJgTB6vZ2g0L/j1S.UOi/HIoWUwJkiG/R.PtaVClqGnyrdXkce', 1, '2022-07-27', 'BT', ''),
('3a8d9845-bc0c-4848-a6c0-9b4677925dcd', 'Candida Corbley', 'Male', '2000-07-27', 'candida_corbley@hotmail.com', '406 Main St-Somerville-8876', '908-943-6103', '$2a$08$BkRI1IMW6pLb/8BRHKHl3Oo5BVzMGf/paTilNXxSlzV7twxkdzToe', 1, '2022-07-27', 'IT', ''),
('3aac8db6-c61c-47b2-a9c1-b02705eb3c03', 'Rhea Aredondo', 'Female', '2000-09-28', 'rhea_aredondo@cox.net', '25657 Live Oak St-Brooklyn-11226', '718-280-4183', '$2a$08$aL5T5DWQcDIoY9EeNdE.aef5GjlEwMcVOzhCcqisSq4lgYXq0kyR2', 1, '2022-07-27', 'BT', ''),
('3bbab417-266b-4f31-8010-d2d8781c38f7', 'Glendora Sarbacher', 'Male', '2000-08-25', 'gsarbacher@gmail.com', '2140 Diamond Blvd-Rohnert Park-94928', '707-881-3154', '$2a$08$9IQuJF0plojE.f87qkkIL.Od40oFu/xECoJal5bGgJG5ue72Y0eli', 2, '2022-07-27', 'IT', ''),
('3da3dd7d-a0ac-440a-aea3-5972811e0732', 'Helaine Halter', 'Male', '2001-01-15', 'hhalter@yahoo.com', '8 Sheridan Rd-Jersey City-7304', '201-412-3040', '$2a$08$mpqIcpF.bL2ZZd9f5et/h.YKOmVYh5UZ7TMIXe1vWK8REa2wQ7uvO', 2, '2022-07-27', 'MPAE', ''),
('3eba95e1-64c5-42fb-837e-911fe6cd38cd', 'Yuki Whobrey', 'Female', '2000-01-20', 'yuki_whobrey@aol.com', '1 State Route 27-Taylor-48180', '313-341-4470', '$2a$08$xqc/4Bd701D2j4w3M/dZT.anrqG0DAT7CoBBAO4b5qk.OeUpCNJP2', 1, '2022-07-27', 'ECE', ''),
('3f9ccdff-a486-46c7-81a8-384366cc8b20', 'Gracia Melnyk', 'Male', '2000-08-04', 'gracia@melnyk.com', '97 Airport Loop Dr-Jacksonville-32216', '904-627-4341', '$2a$08$7uTcvRfE0Hsv2HbbwT8paeD8BRDfkK0wL1BHsbIyPJx5Pl8bCe1Uu', 1, '2022-07-27', 'IT', ''),
('403281d2-f998-4648-bc43-7241a551a958', 'Blair Malet', 'Female', '2000-02-23', 'bmalet@yahoo.com', '209 Decker Dr-Philadelphia-19132', '215-794-4519', '$2a$08$YFjkwVVzVy7uqR5iXxal9OZdkE4pGCMmfAXCIsOyy0OuobICeX6lK', 3, '2022-07-27', 'ECE', ''),
('4102008d-e379-4ec8-8fb9-f32886afdc5e', 'Solange Shinko', 'Female', '2000-02-09', 'solange@shinko.com', '426 Wolf St-Metairie-70002', '504-265-8174', '$2a$08$SSj.5waF7v.P9led5tobf.tAUiUb1C5hO8AsaFWTO6L3YzqVx3csO', 2, '2022-07-27', 'ECE', ''),
('41340b47-4abd-461f-9c40-9c38fe25e72d', 'Layla Springe', 'Male', '2000-07-09', 'layla.springe@cox.net', '229 N Forty Driv-New York-10011', '212-253-7448', '$2a$08$Lhn/2Oihzj5EfoUBa993Tert8HbRN42f9TO3HlLZOtmylZeKwHOyy', 3, '2022-07-27', 'ICE', ''),
('43449a17-5965-43a6-93e9-089d3c2c73b7', 'Rory Papasergi', 'Female', '2000-05-15', 'rpapasergi@cox.net', '83 County Road 437 #8581-Clarks Summit-18411', '570-469-8401', '$2a$08$sv5n8T./mhCOrE35faetou8/nUIDpz6l/ZZE6DF1hqtpEbeFbnPMq', 1, '2022-07-27', 'ICE', ''),
('4347e3a0-7111-4fd5-a6b3-4d1accebc307', 'Willow Kusko', 'Male', '2000-02-02', 'wkusko@yahoo.com', '90991 Thorburn Ave-New York-10011', '212-934-5167', '$2a$08$R1zUS2Nmiku5ps2jW0HK8OzI/h4aeG9yQmh65wqqzgTzQLEWMJPf2', 2, '2022-07-27', 'ECE', ''),
('4746abf4-65c3-451f-b986-a2d992e55d55', 'Caitlin Julia', 'Male', '2001-01-13', 'caitlin.julia@julia.org', '5 Williams St-Johnston-2919', '401-552-9059', '$2a$08$i2baFUPcS64LdNeWfIg8guX6cwB3WR513Ipdf7jFPnm5NApyfCwWO', 1, '2022-07-27', 'MPAE', ''),
('4831da76-5b2f-4a26-8d7d-4d027f62e80e', 'Buddy Cloney', 'Male', '2000-10-17', 'buddy.cloney@yahoo.com', '944 Gaither Dr-Strongsville-44136', '440-327-2093', '$2a$08$9whrj.zKbbR60O3znv1.7eR.n42UAHWAGsyL9ki4QG4R7.SXZ/Dvm', 2, '2022-07-27', 'BT', ''),
('48a09dc2-a853-4de3-b60e-42becb2f0d12', 'Alex Loader', 'Male', '2000-09-17', 'alex@loader.com', '37 N Elm St #916-Tacoma-98409', '253-875-9222', '$2a$08$/D4z1bFyfMEpk0kzDqaN/eSg1UnGVGQUuUW5dnUg5HFa3R4AZCTVy', 3, '2022-07-27', 'IT', ''),
('49bfb061-1b15-4414-b310-aa0b609b3d21', 'Natalie Fern', 'Female', '2000-04-15', 'natalie.fern@hotmail.com', '7140 University Ave-Rock Springs-82901', '307-279-3793', '$2a$08$hD1oZnr82ecQTSHwEonNtuaYRinXeofFxhvkaz1YSy5yUy707nzOq', 2, '2022-07-27', 'CSE', ''),
('49fe5843-384d-4d31-94fa-25a7196851d6', 'Alease Buemi', 'Female', '2000-04-18', 'alease@buemi.com', '4 Webbs Chapel Rd-Boulder-80303', '303-521-9860', '$2a$08$hYmJ2VMbGl5lDPwUcorXyuSCEHfj0DewUcNOE5XKQ9mfv44XNkMz2', 3, '2022-07-27', 'CSE', ''),
('4b9c62b3-78b9-479d-ab9b-be56c0019420', 'Leonora Mauson', 'Female', '2001-01-26', 'leonora@yahoo.com', '3381 E 40th Ave-Passaic-7055', '973-355-2120', '$2a$08$l0qhh9jdw.rJzlcJbJZvM./PC9We.W5oKlATJmaT5i.PN4pFVOPX6', 2, '2022-07-27', 'MPAE', ''),
('4c9fa190-ac5d-4068-a311-7670ec0cc5ea', 'Erick Nievas', 'Female', '2001-03-18', 'erick_nievas@aol.com', '45 E Acacia Ct-Chicago-60624', '773-359-6109', '$2a$08$VZGkT/.mqDlzseORYa3Ku.Zxr2TkpSttxO70PXoVsh/CsMxAiTEiq', 2, '2022-07-27', 'ME', ''),
('4e7498ad-4b39-414c-a160-47950b8c3b44', 'Regenia Kannady', 'Female', '2001-03-07', 'regenia.kannady@cox.net', '10759 Main St-Scottsdale-85260', '480-205-5121', '$2a$08$v5dVtu3mnDV.gSAwmEMg7Oeq3cPZk5HeZwjue76BZZqOdkKqMWmcu', 1, '2022-07-27', 'ME', ''),
('4e846f6f-fb91-4638-bc69-3e5cd827af16', 'Venita Maillard', 'Male', '2001-02-25', 'venita_maillard@gmail.com', '72119 S Walker Ave #63-Anaheim-92801', '714-663-9740', '$2a$08$8axzywPj1XZLNAC0uzAdNudKX5QeL57U9QlCwa4F8ji34Lu.SErPm', 3, '2022-07-27', 'MPAE', ''),
('5074add8-5156-4029-9a60-a445ca7ce089', 'Nana Wrinkles', 'Female', '2000-07-08', 'nana@aol.com', '6 Van Buren St-Mount Vernon-10553', '914-796-3775', '$2a$08$ebV2CoINVOcJASBz2FJWE.lfOBGLCZxzQApwQ0IzfB32e5U.7wF9y', 3, '2022-07-27', 'ICE', ''),
('5229ed59-4c7d-42c8-96c7-0620ae0da3a7', 'Lemuel Latzke', 'Female', '2000-07-25', 'lemuel.latzke@gmail.com', '70 Euclid Ave #722-Bohemia-11716', '631-291-4976', '$2a$08$cpbVnNvwV7zhat0USD8GOus5bYqlklF9mT89NVvi8dQvHCiOXk.e2', 1, '2022-07-27', 'IT', ''),
('548f9108-2128-483d-9c23-39da8637c4c4', 'Ashlyn Pinilla', 'Male', '2000-08-08', 'apinilla@cox.net', '703 Beville Rd-Opa Locka-33054', '305-857-5489', '$2a$08$rpOjGt9/AKS8h5ErwRUsE.V5cbJrm/b4QpMz0g.JSkKKJPrQlAM9a', 2, '2022-07-27', 'IT', ''),
('550f5c52-43e6-4ca4-b149-9f05cb6ba8a3', 'Beckie Silvestrini', 'Male', '2000-08-18', 'beckie.silvestrini@silvestrini.com', '7116 Western Ave-Dearborn-48126', '313-390-7855', '$2a$08$JY6Lo/TvI0UCxKog84GwZuWDtg93F2vzDmZftrMBR5yv5mthcQn.i', 2, '2022-07-27', 'IT', ''),
('56e2becf-e35b-48b4-8323-c3fe375b8ec3', 'Meaghan Garufi', 'Female', '2000-01-18', 'meaghan@hotmail.com', '69734 E Carrillo St-Mc Minnville-37110', '931-235-7959', '$2a$08$g1NLinBz7P.eYG8.GiCFN.Ovg/NMiAaYTSrMNR8Icv2SFAbtC1zN.', 1, '2022-07-27', 'ECE', ''),
('56f79614-6f53-4230-9cdf-863db50dfd94', 'Adelina Nabours', 'Female', '2001-01-19', 'adelina_nabours@gmail.com', '80 Pittsford Victor Rd #9-Cleveland-44103', '216-937-5320', '$2a$08$yxof6.VlL8immBMNGdEanOxuY/W/NBjmO0OSGI8HNawqgDDsLj8L2', 2, '2022-07-27', 'MPAE', ''),
('577e7f87-0fe0-45a3-a8ab-35deafc51733', 'Jade Farrar', 'Female', '2000-10-10', 'jade.farrar@yahoo.com', '6882 Torresdale Ave-Columbia-29201', '803-975-3405', '$2a$08$sj1fH/8.HHIEC6I5JYS.ZO32vLUWy6/t/v.P9aLB7kGGoQAMCU4xi', 2, '2022-07-27', 'BT', ''),
('57bc5b5e-7521-4fb1-b46f-97356470f8a6', 'Malinda Hochard', 'Female', '2000-04-14', 'malinda.hochard@yahoo.com', '55 Riverside Ave-Indianapolis-46202', '317-472-2412', '$2a$08$mGUASKT9M5kZ768XK0gnkutCNI91rMV1isDQAsluSQM7PZBzVt.0.', 2, '2022-07-27', 'CSE', ''),
('588547ea-1f7c-4760-8d02-57ac83999707', 'Elly Morocco', 'Female', '2000-03-13', 'elly_morocco@gmail.com', '7 W 32nd St-Erie-16502', '814-420-3553', '$2a$08$DU.j1mnZB1UIRLN3Ixyi7eFrk7Xk1Fb1kFoHYszbmlcnuIuhR/k7y', 1, '2022-07-27', 'CSE', ''),
('599dbfe8-1f7f-4c02-9a89-d76858b82167', 'Jolanda Hanafan', 'Female', '2000-08-05', 'jhanafan@gmail.com', '37855 Nolan Rd-Bangor-4401', '207-233-6185', '$2a$08$u2hXNEPFgRGrNCwtZd2MHutd5BpQhuJpiB5oZcsRh4S30pQbC8bEi', 1, '2022-07-27', 'IT', ''),
('5bccf55c-5237-41ec-8110-2e4d69029233', 'Emerson Bowley', 'Female', '2000-02-22', 'emerson.bowley@bowley.org', '762 S Main St-Madison-53711', '608-658-7940', '$2a$08$ZcCQE3V1AbHPtvLy/Eh06.lOJzK6KRv3Qa9TmvEosNLdYzukKnVMG', 3, '2022-07-27', 'ECE', ''),
('5c9857f2-acaa-4799-8edd-8758db87f778', 'Evangelina Radde', 'Male', '2000-07-01', 'evangelina@aol.com', '992 Civic Center Dr-Philadelphia-19123', '215-417-5612', '$2a$08$JCOIjHxnx8YohS7caKKLc.g/agwrv/mLr7pzPpBqj9lIiNoGo9D0i', 3, '2022-07-27', 'ICE', ''),
('5e300b8d-c80e-47fd-a9f7-360f835af17b', 'Audry Yaw', 'Female', '2001-02-21', 'audry.yaw@yaw.org', '70295 Pioneer Ct-Brandon-33511', '813-744-7100', '$2a$08$8vimbAIWCoAZK4fcvL5eIeD/4nrfBxn53XPzvNA2KSN0elUvCFl4C', 3, '2022-07-27', 'MPAE', ''),
('5e4e22e5-45a2-4160-9f7a-d0ffa59af7c0', 'Rozella Ostrosky', 'Female', '2000-02-11', 'rozella.ostrosky@ostrosky.com', '17 Morena Blvd-Camarillo-93012', '805-609-1531', '$2a$08$02noj1F9TfgK6YSg20baG.v2IZDedJ9j46ab5nS9R45pbthuAEbKu', 2, '2022-07-27', 'ECE', ''),
('5fda1de6-22fd-4bf6-af33-f5f37993f976', 'Chanel Caudy', 'Female', '2000-01-28', 'chanel.caudy@caudy.org', '86 Nw 66th St #8673-Shawnee-66218', '913-899-1103', '$2a$08$4S6iB6oF08ZLV40iBVkyx.J80ZKcpROxGIDrQcnLxJy4l9wzHPQu6', 2, '2022-07-27', 'ECE', ''),
('60ed0a2e-7793-4e4d-a771-baeb83b8bf0e', 'Scarlet Cartan', 'Female', '2000-05-08', 'scarlet.cartan@yahoo.com', '9390 S Howell Ave-Albany-31701', '229-365-9658', '$2a$08$BHi.jUp.ISdOE8RIPyA6s.HBYD1axd2yAuIWDLYpgOCqgOsrK3nT6', 3, '2022-07-27', 'CSE', ''),
('61483a20-0add-45d1-9947-a72daf6a90d0', 'Xuan Rochin', 'Male', '2000-05-11', 'xuan@gmail.com', '2 Monroe St-San Mateo-94403', '650-247-2625', '$2a$08$Mqr/drtqjgUEWlbiggAH2OIWrmhaCMH5175PpmhAJigouumqxuGB2', 1, '2022-07-27', 'ICE', ''),
('61db2b83-173e-4273-9368-6029bb1eaee4', 'Lavonda Hengel', 'Male', '2000-11-06', 'lavonda@cox.net', '87 Imperial Ct #79-Fargo-58102', '701-421-7080', '$2a$08$CDwei3UXA4ExAVPvQBUBROr7E2IzoyMxndY15iqSm62qiZ1PIv7ge', 3, '2022-07-27', 'BT', ''),
('61f42b8f-d4b3-41d3-b12f-9708524a70ab', 'Gwenn Suffield', 'Female', '2000-09-11', 'gwenn_suffield@suffield.org', '3270 Dequindre Rd-Deer Park-11729', '631-295-9879', '$2a$08$P1Nf.fnVG1OrnSWDGSwtP.OSU8CgZoM7aI401IduB4AG51ev.9LIy', 3, '2022-07-27', 'IT', ''),
('6228365d-b35c-42f6-9574-ec9235a80789', 'Jerry Zurcher', 'Female', '2000-10-19', 'jzurcher@zurcher.org', '77 Massillon Rd #822-Satellite Beach-32937', '321-597-2159', '$2a$08$CD7tLNcTlffhjKT1w7jz1uPVHStwW1DQ/zHxXV8MWY1uyOsEzXITG', 2, '2022-07-27', 'BT', ''),
('634c6c6d-707b-4073-92f3-b2fe2fe9af19', 'Leatha Hagele', 'Male', '2000-05-28', 'lhagele@cox.net', '627 Walford Ave-Dallas-75227', '214-225-5850', '$2a$08$1UWQZpMurberJ6F1cg1iGepla8ICCbSRJzQYz4zdlMAigNoOMsM3C', 1, '2022-07-27', 'ICE', ''),
('6371632f-bf2f-4a99-ad6f-113c24868a6a', 'Charlene Hamilton', 'Female', '2000-10-11', 'charlene.hamilton@hotmail.com', '985 E 6th Ave-Santa Rosa-95407', '707-821-8037', '$2a$08$LBYzSTZ7wpaqLxUMGzWGieBjcORLy3HE4DFBnq0auDBD.1nc0Lqxe', 2, '2022-07-27', 'BT', ''),
('6435e6e0-991b-405b-b37d-7c3d13ebda10', 'Nichelle Meteer', 'Female', '2001-04-23', 'nichelle_meteer@meteer.com', '72 Beechwood Ter-Chicago-60657', '773-857-2231', '$2a$08$Uf.QSLPVT0U4AJJyWkf4YuWN7Q4phvuO7nPauor5hXKP9u6iKxORa', 3, '2022-07-27', 'ME', ''),
('64582c16-e28d-445a-bb72-514e47c393ad', 'Novella Degroot', 'Female', '2000-07-02', 'novella_degroot@degroot.org', '303 N Radcliffe St-Hilo-96720', '808-746-1865', '$2a$08$mkGj7CqvVzMkw/gVmz2j0e7o6hswQieWTB3ugthKw6adhJNEOnec.', 3, '2022-07-27', 'ICE', ''),
('647155a6-04c7-4870-b5b5-b1c4686f3abe', 'Graciela Ruta', 'Female', '2000-01-15', 'gruta@cox.net', '98 Connecticut Ave Nw-Chagrin Falls-44023', '440-579-7763', '$2a$08$XNtjCM7BgmuUpItJbFR6ceFrh6lmQxTNuNo3.by6hFIPn7YCMLUpi', 1, '2022-07-27', 'ECE', ''),
('64e09463-abd0-4b60-a48a-cfe1fc680585', 'Mattie Poquette', 'Male', '2000-01-17', 'mattie@aol.com', '73 State Road 434 E-Phoenix-85013', '602-953-6360', '$2a$08$aD8GdumyawMJn2qxzk5MsuAw2y9AI4TFVJP.7We0wGbR1QUbk8b/e', 1, '2022-07-27', 'ECE', ''),
('65127381-3d10-40f3-ae61-8aa913142d11', 'Twana Felger', 'Female', '2000-04-24', 'twana.felger@felger.org', '1 Commerce Way-Portland-97224', '503-909-7167', '$2a$08$73VD6jEsliQLZRhhpmeMS.TINpV3V7IfrYBd/Q7NcMqysoMdlHGma', 3, '2022-07-27', 'CSE', ''),
('6543bbec-658b-49f5-945e-055ee08f76ca', 'Andra Scheyer', 'Male', '2000-08-01', 'andra@gmail.com', '9 Church St-Salem-97302', '503-950-3068', '$2a$08$exWBhVPspAL9V2scnqkMKO4RCpNdI4a6AiozKC8ztiElvBE0UHA.2', 1, '2022-07-27', 'IT', ''),
('6600db97-f58f-4c7e-8421-e205d4c284ce', 'Arminda Parvis', 'Female', '2000-06-16', 'arminda@parvis.com', '1 Huntwood Ave-Phoenix-85017', '602-277-3025', '$2a$08$a34YMsjVNJRfPJHUAK24DOhJjgWg8q/aecu7yq0s/UAl/cbOtapM.', 2, '2022-07-27', 'ICE', ''),
('67009ee7-68d6-42dd-a3b0-c2e87f8371f3', 'Linn Paa', 'Male', '2001-03-03', 'linn_paa@paa.com', '1 S Pine St-Memphis-38112', '901-573-9024', '$2a$08$c0oPR3176oVFwTpcij4D3uzcvxB7AJgGbTO1w3IGKOwPWpYoKAJJ.', 1, '2022-07-27', 'ME', ''),
('67b09bfb-b32d-492d-a6bf-c20a3cdb598e', 'Jina Briddick', 'Male', '2000-02-20', 'jina_briddick@briddick.com', '38938 Park Blvd-Boston-2128', '617-997-5771', '$2a$08$y2tJPoS1yPZBRWC18eerAu8Xud4dlP.L7lZcl3MIQGIT3Gd8kA6cO', 3, '2022-07-27', 'ECE', ''),
('68ff26ab-8961-44c2-a21c-b6288565bfec', 'Annabelle Boord', 'Male', '2000-07-11', 'annabelle.boord@cox.net', '523 Marquette Ave-Concord-1742', '978-289-7717', '$2a$08$j3PsLY/l9tCbc8DSP05sAu1OgN/YHdMIDXBPpXHShhm6jhh/dQcpK', 3, '2022-07-27', 'ICE', ''),
('6a4026db-8614-4696-94f8-43fdf983f105', 'Skye Fillingim', 'Female', '2000-10-09', 'skye_fillingim@yahoo.com', '25 Minters Chapel Rd #9-Minneapolis-55401', '612-664-6304', '$2a$08$0wnN0.Pl3efWrLPQx1hAZe1Qn9eLVfRPxRl0GBIzkLCJNXwaIj.G6', 1, '2022-07-27', 'BT', ''),
('6ac1d8b9-f672-44d1-9c36-329c22eb4f84', 'Viva Toelkes', 'Male', '2000-03-24', 'viva.toelkes@gmail.com', '4284 Dorigo Ln-Chicago-60647', '773-352-3437', '$2a$08$7tq1umhSFhswyS7mczUSsOxN8LokEYfLCopAnoNHp75w3o/ZKKVH.', 1, '2022-07-27', 'CSE', ''),
('6b010904-88d6-422f-9766-cb857ee90414', 'Jesusa Shin', 'Male', '2000-05-02', 'jshin@shin.com', '2239 Shawnee Mission Pky-Tullahoma-37388', '931-739-1551', '$2a$08$ln4.jE2aCnNivFKaGIXNuOR6ySDmGTPK.NKpnEDJZ/aKsa07esDte', 3, '2022-07-27', 'CSE', ''),
('6b16bdb9-235a-4195-aeaa-29fbd14125c1', 'Gearldine Gellinger', 'Male', '2000-06-08', 'gearldine_gellinger@gellinger.com', '4 Bloomfield Ave-Irving-75061', '972-821-7118', '$2a$08$xB9tAoJ/fvKeGBx54fEheO8ixAlagVqXvxCcpFfLMTr7JRpT/t9M2', 2, '2022-07-27', 'ICE', ''),
('6bba9000-014f-4254-92c4-b3d990b143d0', 'Sharee Maile', 'Female', '2001-04-09', 'sharee_maile@aol.com', '2094 Montour Blvd-Muskegon-49442', '231-265-6940', '$2a$08$cZKCSN2SOsVl4J5P9DjEueH.aVPBrPXVFh38ZeB6RW86KjQkAHZJu', 2, '2022-07-27', 'ME', ''),
('6bbb610b-7284-49db-b474-05fd5b09dd0a', 'Marti Maybury', 'Male', '2000-05-26', 'marti.maybury@yahoo.com', '4 Warehouse Point Rd #7-Chicago-60638', '773-539-1058', '$2a$08$RFVe0/hGI0BVLneU/c1FDOjCQXJ4qHp7B9zKt3t5dvYIl6cRRDgAS', 1, '2022-07-27', 'ICE', ''),
('6cc89aaf-abf8-4f36-b09b-f0a8bafa3d6d', 'Belen Strassner', 'Female', '2000-08-03', 'belen_strassner@aol.com', '5384 Southwyck Blvd-Douglasville-30135', '770-802-4003', '$2a$08$koFRDjH4VIS3ivc0Ai9pNer17Wz2ceu9vVopHexjUi4NeYGE6xhsa', 1, '2022-07-27', 'IT', ''),
('6d83339b-7774-4ed5-b50d-629ecf07c4b4', 'Rickie Plumer', 'Male', '2000-09-16', 'rickie.plumer@aol.com', '3 N Groesbeck Hwy-Toledo-43613', '419-313-5571', '$2a$08$aKd23xhWbVuFNn7LgT.8fuHrEwMnN.xpKWLgkUoZXXrP47WKAyzp.', 3, '2022-07-27', 'IT', ''),
('6db5f982-5fc4-4da2-9854-c30769f10721', 'Barbra Adkin', 'Male', '2001-01-10', 'badkin@hotmail.com', '4 Kohler Memorial Dr-Brooklyn-11230', '718-732-9475', '$2a$08$C8R41.cp8TouLI9VDHq6ouYhdTWAYRPjhFp0ZT.zvtRra.4JCz/6W', 1, '2022-07-27', 'MPAE', ''),
('6df68f2f-d91f-43ab-a7bb-4fcbc8435098', 'Rodolfo Butzen', 'Male', '2001-03-10', 'rodolfo@hotmail.com', '41 Steel Ct-Northfield-55057', '507-590-5237', '$2a$08$KelozVE/FIg7ODhiJzvTKO7U6tq4tV7G68Dj/VTXwPkFu6X7Ho0Qa', 1, '2022-07-27', 'ME', ''),
('6e5094b7-64a1-40c2-9b0d-4666a44baa9a', 'Lucy Treston', 'Male', '2000-11-16', 'lucy@cox.net', '57254 Brickell Ave #372-Worcester-1602', '508-502-5634', '$2a$08$vrFuSu27CmlcHDKRRkWWSeKAS4oK7h/n/hW4ZaxN4rLSnXEYXsQ2C', 3, '2022-07-27', 'BT', ''),
('707c859b-e667-4e93-a93f-ca2df9449191', 'Bobbye Rhym', 'Female', '2000-03-18', 'brhym@rhym.com', '30 W 80th St #1995-San Carlos-94070', '650-811-9032', '$2a$08$jtAK3DxOfXYAklW/GXxPo.2sGO7B1WAB3Uw.9Ek4k4.BGHJ1sh2IS', 1, '2022-07-27', 'CSE', ''),
('714db6da-34a5-4c95-8312-ee82ec92a125', 'Taryn Moyd', 'Female', '2000-09-14', 'taryn.moyd@hotmail.com', '48 Lenox St-Fairfax-22030', '703-938-7939', '$2a$08$xqRMwkQYlVQT2O6ICkBAneJsQhMoWtPttPeXbLoaaw5AOrbSSVSq6', 3, '2022-07-27', 'IT', ''),
('7152f54c-adc6-4414-8b0c-f863b3b08394', 'Merlyn Lawler', 'Male', '2000-07-22', 'merlyn_lawler@hotmail.com', '4671 Alemany Blvd-Jersey City-7304', '201-858-9960', '$2a$08$ebBRNO6ms/KVSKP5d3btue8uXIxNZEbms.fvzEDpq1RZPoOn7PMDW', 1, '2022-07-27', 'IT', ''),
('716c7366-3739-4a7a-8743-e127499cad33', 'Vallie Mondella', 'Female', '2000-03-15', 'vmondella@mondella.com', '74 W College St-Boise-83707', '208-737-8439', '$2a$08$rup31OymWOTNMud4/04dOOOvUCWYPNmboXJX4RNuA8dhLaDs8DmdC', 1, '2022-07-27', 'CSE', ''),
('719bad10-3045-4c34-8ffa-a06976135f2d', 'Krissy Rauser', 'Female', '2001-03-01', 'krauser@cox.net', '8728 S Broad St-Coram-11727', '631-288-2866', '$2a$08$X1GQZGlyr0/bPx9LE5cfUu7Hc6b8YKjnEyYeR77U/Q0dBcl2wd.oy', 1, '2022-07-27', 'ME', ''),
('7251de43-b5e7-4cd8-b548-cc08676144a9', 'Levi Munis', 'Male', '2001-04-07', 'levi.munis@gmail.com', '2094 Ne 36th Ave-Worcester-1603', '508-658-7802', '$2a$08$1trLXFYC38R5YDNKpkgqYuWf.wl9T7hSSRKfugXVu/v7A2vgadFQ2', 2, '2022-07-27', 'ME', ''),
('72ce646e-a6fd-4eee-8b1f-736e0fa51e0a', 'Tonette Wenner', 'Male', '2000-03-01', 'twenner@aol.com', '4545 Courthouse Rd-Westbury-11590', '516-333-4861', '$2a$08$rNB12eXyfE5pKW.pa0Jh3O7R3AlcW0wUAEhUCoRHGsBEiZ1w0SUfK', 3, '2022-07-27', 'ECE', ''),
('732d4ac1-d885-44f1-95f5-f03df25b9a9a', 'Ozell Shealy', 'Female', '2000-06-15', 'oshealy@hotmail.com', '8 Industry Ln-New York-10002', '212-880-8865', '$2a$08$V7dKcAiYHMSPlsIMrPTtK.Ckpjh4AeZwZ2mA6msqP2xDn98wLvdyi', 2, '2022-07-27', 'ICE', ''),
('7349c408-0938-4db9-a5ae-c638fbde2c03', 'Gertude Witten', 'Female', '2001-03-26', 'gertude.witten@gmail.com', '7 Tarrytown Rd-Cincinnati-45217', '513-863-9471', '$2a$08$lRUFpMZZ7Ta.QRoRtkcBvu0TzCDL6WernC3Yl9aOtNOMRLfx3e3.m', 2, '2022-07-27', 'ME', ''),
('73d1d1c0-7e32-45b4-97ec-3d1d114458c8', 'Timothy Mulqueen', 'Female', '2000-03-27', 'timothy_mulqueen@mulqueen.org', '44 W 4th St-Staten Island-10309', '718-654-7063', '$2a$08$FKJW.9P5mnZ9S/kcl17Jn.TLCvPJXrhdpJw.9/RCTKALkEu4FkVIS', 2, '2022-07-27', 'CSE', ''),
('74138453-abe2-4a36-99a3-1af8c3faba2b', 'Alecia Bubash', 'Male', '2000-10-24', 'alecia@aol.com', '6535 Joyce St-Wichita Falls-76301', '940-302-3036', '$2a$08$ZxBoL1e5nalBgYEEImTdCe6PMgJMJyL3K0ox70fbjkDdEdWnx487C', 2, '2022-07-27', 'BT', ''),
('748c3b51-ada5-450a-abd7-d6b3cc9dbba0', 'Tammara Wardrip', 'Female', '2000-04-08', 'twardrip@cox.net', '4800 Black Horse Pike-Burlingame-94010', '650-216-5075', '$2a$08$c/K0tANk5zRQCWQo61KjneXiF7GaJEd.vVkl1Elv912W7kT5G9SOe', 2, '2022-07-27', 'CSE', ''),
('7508be32-6a20-4325-957e-fba4a975b5c7', 'Maryann Royster', 'Male', '2000-01-25', 'mroyster@royster.com', '74 S Westgate St-Albany-12204', '518-448-8982', '$2a$08$ni6MLlmzot21wJq0rNlLf.DDvnLCKi4Dyn9BOZAl3ZJ4.Dc6OTQpa', 2, '2022-07-27', 'ECE', ''),
('751fe9bd-dbf6-4662-b632-4527360fe8d4', 'Pete Dubaldi', 'Male', '2001-03-02', 'pdubaldi@hotmail.com', '2215 Prosperity Dr-Lyndhurst-7071', '201-749-8866', '$2a$08$TjMtRpOVoyyNjfzR13zOV.yjtG5Ij1387lq3J.ThVAYRw7bhATvpW', 1, '2022-07-27', 'ME', ''),
('755fb1d3-8432-49cb-836b-8495e8f04c59', 'Glen Bartolet', 'Female', '2000-08-21', 'glen_bartolet@hotmail.com', '8739 Hudson St-Vashon-98070', '206-389-1482', '$2a$08$vJMxXo2WRgL25j2hyzgKLOzC3ebuu8Ya/wwZKvnuNKBVQG5b561/2', 2, '2022-07-27', 'IT', ''),
('75a68e0e-8bf1-4567-9e1c-7620c1a6c842', 'Yvonne Tjepkema', 'Male', '2000-11-18', 'yvonne.tjepkema@hotmail.com', '9 Waydell St-Fairfield-7004', '973-976-8627', '$2a$08$wP8UFvENSjovf9R2Bquzz.FUxGeka56obdkw8xMzoGO9Cs5Om1Ry.', 3, '2022-07-27', 'BT', ''),
('768e9cf4-da96-4395-b95c-b2cfbfe21a82', 'Alisha Slusarski', 'Male', '2000-01-26', 'alisha@slusarski.com', '3273 State St-Middlesex-8846', '732-635-3453', '$2a$08$H1vepatdcE9.qQu7Db7Vx.gb3cRFnolR5.uxwFqi75B5mKgXO8Ine', 2, '2022-07-27', 'ECE', ''),
('76bbbf2b-ffe0-4e12-a948-10616541ba86', 'Virgina Tegarden', 'Male', '2000-09-02', 'virgina_tegarden@tegarden.com', '755 Harbor Way-Milwaukee-53226', '414-411-5744', '$2a$08$nT5do7CYK9XcqX2zitJL3.ugFHdilpV9RPz/tYXdTDzHK/7riq45.', 3, '2022-07-27', 'IT', ''),
('76f7799c-7e23-4718-989e-042caa2604f2', 'Raina Brachle', 'Male', '2001-01-04', 'raina.brachle@brachle.org', '3829 Ventura Blvd-Butte-59701', '406-374-7752', '$2a$08$kjTbRfJ47ysV61a1LHO2OOCe6oYR6MQxtxEitTi86dKsl63Uey04m', 1, '2022-07-27', 'MPAE', ''),
('77c13463-2c7d-4cd9-bafc-31326041b6bd', 'Reita Leto', 'Female', '2000-06-17', 'reita.leto@gmail.com', '55262 N French Rd-Indianapolis-46240', '317-787-5514', '$2a$08$O5Q3bHa7SBVQX7mdniVQGuh6CKaUZpE/Tj8lTiUs2X/DF9CgnF8PW', 2, '2022-07-27', 'ICE', ''),
('77ce247f-ff5b-4756-8876-7b20c1dfc4bb', 'Bernardo Figeroa', 'Male', '2000-02-03', 'bfigeroa@aol.com', '386 9th Ave N-Conroe-77301', '936-597-3614', '$2a$08$Sv/IONuLRMQCbHkLOgKufOqo4xs7wx.TVQD7nUk9O0SiaUSmWADBa', 2, '2022-07-27', 'ECE', ''),
('789c2a95-ad6a-42e4-b3e9-c720b292fe50', 'Bulah Padilla', 'Male', '2000-06-04', 'bulah_padilla@hotmail.com', '8927 Vandever Ave-Waco-76707', '254-816-8417', '$2a$08$E9QgQrD/HFOFhxt.n5MOg.0Rdgz2Jlw7O3tqMeaEsuF3N2v9sIu6.', 2, '2022-07-27', 'ICE', ''),
('78acb82c-3a37-442c-95cb-0173b8ccd42e', 'Kiley Caldarera', 'Female', '2000-01-14', 'kiley.caldarera@aol.com', '25 E 75th St #69-Los Angeles-90034', '310-254-3084', '$2a$08$Knj6she5T8cz73RfvsUm/.b.VPYWHJgzwfgkNb5fqAZ6N5k6z9iqO', 1, '2022-07-27', 'ECE', ''),
('790cf736-7d03-4e04-84fe-ae7f1c76557f', 'Tresa Sweely', 'Male', '2000-11-21', 'tresa_sweely@hotmail.com', '22 Bridle Ln-Valley Park-63088', '314-231-3514', '$2a$08$0H3uQUB7fOwhAKAknksPWu8sMO6f5mRNaaxHELkBb.gF0UKrzAYXa', 3, '2022-07-27', 'BT', ''),
('7988d626-7c1f-485a-a2c3-7460ba709f7a', 'Kirk Herritt', 'Female', '2001-01-25', 'kirk.herritt@aol.com', '88 15th Ave Ne-Vestal-13850', '607-350-7690', '$2a$08$MS5qPva98i8DbUNbaDbAfuzd6QuYQ8UTuljCgKDxRAcfevstC9rn6', 2, '2022-07-27', 'MPAE', ''),
('7b3bc988-3289-47af-94b3-17a92a05516a', 'Jutta Amyot', 'Female', '2001-01-23', 'jamyot@hotmail.com', '49 N Mays St-Broussard-70518', '337-991-8070', '$2a$08$JZoWZliImk8POyeoHcDE8uvRcyVkrvJl1oaV9p/RK7o0PS22YJxpK', 2, '2022-07-27', 'MPAE', ''),
('7d084fff-6cc3-41e8-b76f-30dd351120d3', 'Freeman Gochal', 'Male', '2000-08-22', 'freeman_gochal@aol.com', '383 Gunderman Rd #197-Coatesville-19320', '610-752-2683', '$2a$08$J6f97Iay4n1nuW/rQa.tHOPM6UIoo.yoLLpMqCh3BbqeDh/WJThsq', 2, '2022-07-27', 'IT', ''),
('7d380dca-af47-4780-b8af-90fc330872a1', 'Ammie Corrio', 'Female', '2000-02-04', 'ammie@corrio.com', '74874 Atlantic Ave-Columbus-43215', '614-648-3265', '$2a$08$yubfpV2CloOQAfc5KCjyH.9eKeAXs.RCsJ63YZ4byubdx9jDTCizW', 2, '2022-07-27', 'ECE', ''),
('7d611cac-e4e4-40a4-aef0-0b518f06477c', 'Hermila Thyberg', 'Female', '2001-01-11', 'hermila_thyberg@hotmail.com', '1 Rancho Del Mar Shopping C-Providence-2903', '401-885-7681', '$2a$08$rMNHFz.KoETe8pcW8Xpvz.G9dKhXmINlSOSFN3UpTd3ED8BlT7Xsi', 1, '2022-07-27', 'MPAE', ''),
('7d64c1e4-ecdc-4fc5-bf7b-133ecb4449c8', 'Sylvia Cousey', 'Female', '2000-07-07', 'sylvia_cousey@cousey.org', '287 Youngstown Warren Rd-Hampstead-21074', '410-863-8263', '$2a$08$ZcgRAFlZ1/EGLPXGGnoKSO5tire.kumqVHYMVYmU.Dpf.r1jvQ5fi', 3, '2022-07-27', 'ICE', ''),
('7e4223a4-6cd2-49c4-8185-7a79197bf34a', 'Sue Kownacki', 'Female', '2000-05-01', 'sue@aol.com', '2 Se 3rd Ave-Mesquite-75149', '972-742-4000', '$2a$08$s1OZ.ORXrlr7VASi.bJTzeqZOgTUordur8hw5f38VMXidDEcQxdrK', 3, '2022-07-27', 'CSE', ''),
('7ee8f75f-924a-4444-a0e6-531e9599e34e', 'Fabiola Hauenstein', 'Female', '2001-01-02', 'fabiola.hauenstein@hauenstein.org', '8573 Lincoln Blvd-York-17404', '717-344-2804', '$2a$08$kWc.0qJmn3DfBThnc9P27eud75W/l0.f91JgLVdoNAGI773zEvwke', 1, '2022-07-27', 'MPAE', '');
INSERT INTO `student` (`s_id`, `s_name`, `gender`, `dob`, `email`, `s_address`, `contact`, `password`, `section`, `joining_date`, `dept_id`, `resetLink`) VALUES
('7ee9964c-b224-49b3-b04c-b622cd63849b', 'Donte Kines', 'Male', '2000-04-26', 'dkines@hotmail.com', '3 Aspen St-Worcester-1602', '508-843-1426', '$2a$08$QYa54e4f7n8vm4MamSGQquLDRaUNE5dh0ERY8ZO0AdP9qySGjf/cG', 3, '2022-07-27', 'CSE', ''),
('7f4d7f1a-8486-4b9d-94e7-154600ba2168', 'Clay Hoa', 'Female', '2000-07-03', 'choa@hoa.org', '73 Saint Ann St #86-Reno-89502', '775-848-9135', '$2a$08$QMV77lUHKqGSWSy.YG1rzuFCKRoaHT4U42nROapV3wpKyV3LuHsyO', 3, '2022-07-27', 'ICE', ''),
('7f56f96e-d1aa-49fb-9f64-7e6274b519ac', 'Justine Mugnolo', 'Male', '2000-09-08', 'jmugnolo@yahoo.com', '38062 E Main St-New York-10048', '212-311-6377', '$2a$08$6Fd7pwuHEeAci.SXtFYpi.U14ZBoBIonevgUh.HKxk3REapoW7kuW', 3, '2022-07-27', 'IT', ''),
('7f5ac215-1071-4060-b614-8408aedd8fb4', 'Glenna Slayton', 'Male', '2001-04-19', 'glenna_slayton@cox.net', '2759 Livingston Ave-Memphis-38118', '901-869-4314', '$2a$08$c35t6YdbCGcCMUM6HdPLs.ITR/7DR.7s3KRDnjMm38YfjgeuYJHE6', 3, '2022-07-27', 'ME', ''),
('7fa0e6aa-78dc-4d7f-997c-e4ba3cdca248', 'Sylvie Ryser', 'Female', '2001-04-08', 'sylvie@aol.com', '649 Tulane Ave-Tulsa-74105', '918-565-1706', '$2a$08$qEbzh5cqXf93ZfiR5b91DOLog2MC7O4CAG3Yz0FXx7ZG/bFntV4oS', 2, '2022-07-27', 'ME', ''),
('80507829-c6ac-4bf2-bd8c-4b555de54204', 'Carissa Batman', 'Female', '2000-06-13', 'carissa.batman@yahoo.com', '12270 Caton Center Dr-Eugene-97401', '541-801-5717', '$2a$08$Ym5JviP1gaYyiawFvAbJXeJLYsZsEeA3p5q3WKJRwCHQOgYRRmLuS', 2, '2022-07-27', 'ICE', ''),
('809ddca4-fbda-48d5-97d5-9579e57e6a5a', 'Roselle Estell', 'Female', '2001-02-13', 'roselle.estell@hotmail.com', '8116 Mount Vernon Ave-Bucyrus-44820', '419-488-6648', '$2a$08$0ka5X01EVqnWr/CkoZik8Ojgfu4o2pFN3yiHf4YQnvrDHt8isyUJ6', 3, '2022-07-27', 'MPAE', ''),
('80cd6e28-a10e-4877-8bfe-2e8832631dbe', 'Dorthy Hidvegi', 'Male', '2000-06-27', 'dhidvegi@yahoo.com', '9635 S Main St-Boise-83704', '208-690-3315', '$2a$08$2mIRl6x.wDI5Wf3X6y/nr.qz.VLuWVG9YnxT3FoqmPxVBrkkeAscy', 3, '2022-07-27', 'ICE', ''),
('815f46ff-1750-4522-9344-ebf72a88159b', 'Louvenia Beech', 'Male', '2001-02-20', 'louvenia.beech@beech.com', '598 43rd St-Beverly Hills-90210', '310-652-2379', '$2a$08$342HUg10YU6b40fcSGMpLeoNm.lHlBy1z6nqAEK5qTlOnNgOSwBjq', 3, '2022-07-27', 'MPAE', ''),
('82b59011-c9a8-4335-878a-a9febd264a31', 'Glory Kulzer', 'Male', '2000-05-05', 'gkulzer@kulzer.org', '55892 Jacksonville Rd-Owings Mills-21117', '410-916-8015', '$2a$08$TEHwGpT64fcQ6FlOsQEBjuiTFm8WJvKMnREt4QZYKK4qojXBNqrGS', 3, '2022-07-27', 'CSE', ''),
('83ceef88-efab-4bbb-9923-587a73e58cfa', 'Fausto Agramonte', 'Female', '2000-08-09', 'fausto_agramonte@yahoo.com', '5 Harrison Rd-New York-10038', '212-778-3063', '$2a$08$lEBdO446sZuwagwPm0aPt.VbQw0Xj8sgouRslSjRxNuKTZhcsiCO2', 2, '2022-07-27', 'IT', ''),
('84ba2c8e-79bc-4cd0-a6a1-1caefe740845', 'Dalene Riden', 'Female', '2000-10-18', 'dalene.riden@aol.com', '66552 Malone Rd-Plaistow-3865', '603-745-7497', '$2a$08$Jvvm3EqNWbgVEgDEXA/CC.1mPBYZw6mybN3I7eYMp7jiPFIfdMEr6', 2, '2022-07-27', 'BT', ''),
('84cd2be6-3fba-4eb2-9cec-dc61c10fed98', 'Lezlie Craghead', 'Male', '2000-06-14', 'lezlie.craghead@craghead.org', '749 W 18th St #45-Smithfield-27577', '919-885-2453', '$2a$08$tepRNjsm8Ln5mm6hvL67Nu2P13.I9arhA/ptAvIekCMH0qNbueACa', 2, '2022-07-27', 'ICE', ''),
('85b475ad-7ed4-4cd3-afa8-1c4c9523ca31', 'Kristeen Turinetti', 'Male', '2000-11-22', 'kristeen@gmail.com', '70099 E North Ave-Arlington-76013', '817-947-9480', '$2a$08$SQO07KqBWeEPIFjBEQmf1eeZYfENWwE3913/6tepiGOeKDZSwclKa', 1, '2022-07-27', 'MPAE', ''),
('85b567a4-c499-46ad-8f66-e4de06617052', 'Billye Miro', 'Male', '2001-04-18', 'billye_miro@cox.net', '36 Lancaster Dr Se-Pearl-39208', '601-637-5479', '$2a$08$5WgjB8AZGefJoQrh4XKZmuDIqi6coqqp1PDxy2YzTNHKiv9gkm9gy', 3, '2022-07-27', 'ME', ''),
('85c3002b-f1b1-44e5-878f-fc15da0efed2', 'Fatima Saylors', 'Female', '2000-02-19', 'fsaylors@saylors.org', '2 Lighthouse Ave-Hopkins-55343', '952-479-2375', '$2a$08$/91q/buU07Thwnt7U7SUBetIhRhfezlaZv2jPqlysxUhjbNMj57y6', 3, '2022-07-27', 'ECE', ''),
('86acf6a5-1bcb-4ccd-8d9a-e945f33d18da', 'Margart Meisel', 'Male', '2001-02-15', 'margart_meisel@yahoo.com', '868 State St #38-Cincinnati-45251', '513-747-9603', '$2a$08$VzDKvFARs6vG/UEf6K7pm.zfACBBM9e3jkjPeyseJ.YyE/KUPC.JW', 3, '2022-07-27', 'MPAE', ''),
('86dd8f8b-9990-440f-804b-eda3067afbe4', 'Peggie Sturiale', 'Female', '2000-09-23', 'peggie@cox.net', '9 N 14th St-El Cajon-92020', '619-695-8086', '$2a$08$n7ZLaK/7ODPZK885jPiyG.UXkrJTRoVS8VJZoZgQ.WZ3Eu6i3nA/2', 1, '2022-07-27', 'BT', ''),
('87d08a9a-ff55-4d62-8887-117dedac4c66', 'Aliza Baltimore', 'Male', '2000-08-13', 'aliza@aol.com', '1128 Delaware St-San Jose-95132', '408-425-1994', '$2a$08$KR89exSKNbMUWoc31THVqeXy7J8YGoth/9N9N6Uwn9.sDq4Du.pPm', 2, '2022-07-27', 'IT', ''),
('88887add-c7e9-4e00-979b-576ae728fd75', 'Rolland Francescon', 'Male', '2000-05-03', 'rolland@cox.net', '2726 Charcot Ave-Paterson-7501', '973-284-4048', '$2a$08$CqUKCUQNGsa54AJN.ZfeUucHB6bHgKw.FyfoZOthQB0oEr.EXYuJG', 3, '2022-07-27', 'CSE', ''),
('8909917f-37a6-4e35-b39b-34d5760063f6', 'Stephaine Barfield', 'Female', '2000-04-04', 'stephaine@barfield.com', '47154 Whipple Ave Nw-Gardena-90247', '310-968-1219', '$2a$08$OvrKyASurLuM3ftT2MzaQu67HvFWPynBJssPK534G8Z1Mqaga2GSi', 2, '2022-07-27', 'CSE', ''),
('8acf9d7e-4fbb-407e-a80d-04b5ab273ae0', 'Talia Riopelle', 'Female', '2000-05-16', 'talia_riopelle@aol.com', '1 N Harlem Ave #9-Orange-7050', '973-818-9788', '$2a$08$.tpnAt1yQ46cSv3syM6u6OL6X0GV1oNFAPXoElthWdlGNYm99Fsja', 1, '2022-07-27', 'ICE', ''),
('8bfcc733-4306-4780-9058-643b4ef13393', 'Mitsue Scipione', 'Male', '2001-03-20', 'mscipione@scipione.com', '77 222 Dr-Oroville-95965', '530-399-3254', '$2a$08$nZJAsjj27MD5hoLZ3CvPpe/kqWXJ6QawxxABppkNwJox4m10JNUGu', 2, '2022-07-27', 'ME', ''),
('8c768fc0-8ebf-47c2-bce7-a7937c118289', 'Lorrine Worlds', 'Female', '2000-09-22', 'lorrine.worlds@worlds.com', '8 Fair Lawn Ave-Tampa-33614', '813-863-6467', '$2a$08$WBB5BGFaHATXEsDdzZ18jOQelBeXa9ZTENm.LQyT9sadtm43LYjri', 1, '2022-07-27', 'BT', ''),
('8ce8294d-652d-44d4-b736-5b7972c4f975', 'Johnetta Abdallah', 'Male', '2000-03-17', 'johnetta_abdallah@aol.com', '1088 Pinehurst St-Chapel Hill-27514', '919-715-3791', '$2a$08$WU8QlaoDIuziOYdd5eabFePWv7Ji/hbeX1z7Z9aPRa41TsgrNnX.i', 1, '2022-07-27', 'CSE', ''),
('8d000748-7a04-480c-bd9c-1390b6764676', 'Gail Kitty', 'Male', '2001-03-24', 'gail@kitty.com', '735 Crawford Dr-Anchorage-99501', '907-770-3542', '$2a$08$rU.zdbCcZzbC.zIjR9M7ge7CHALKWWhebNZmdNdXpAtMohWuuXrp2', 2, '2022-07-27', 'ME', ''),
('8d623685-5790-47f6-ae3c-d283b3f5417d', 'Marguerita Hiatt', 'Male', '2000-07-14', 'marguerita.hiatt@gmail.com', '82 N Highway 67-Oakley-94561', '925-541-8521', '$2a$08$Xd5.q2ADR2eDk/tB5p2ZKeWoq9AST/I.s/QTxDQuxbASoPcKsF122', 1, '2022-07-27', 'IT', ''),
('8d703a77-d5ca-48cd-920f-bb5cd0f66915', 'Lizette Stem', 'Male', '2000-06-19', 'lizette.stem@aol.com', '501 N 19th Ave-Cherry Hill-8002', '856-702-3676', '$2a$08$wvn10w.2/Y5XfzfQFtEPw.eZ0fc4bH8.twrZEiFvmAM/fQ5BsHHyu', 2, '2022-07-27', 'ICE', ''),
('8da2591c-6f05-4bfa-8b2c-d378e8d349a5', 'Oretha Menter', 'Female', '2000-05-09', 'oretha_menter@yahoo.com', '8 County Center Dr #647-Boston-2210', '617-697-6024', '$2a$08$zmeuL8Xt2ZqZtY5BFY.DzeFqj7CIKdccAZ.FuuiHXd1tTpE3C7tly', 3, '2022-07-27', 'CSE', ''),
('8da96913-8547-4c59-b087-1b076c35ae4d', 'Filiberto Tawil', 'Male', '2000-11-13', 'ftawil@hotmail.com', '3882 W Congress St #799-Los Angeles-90016', '323-842-8226', '$2a$08$ZwSZxgOlPmzAvJxkWk5RDOV/c6JQnU4y7hQ8Ivv2oqsBYh7M4XAra', 3, '2022-07-27', 'BT', ''),
('8e0ab344-d254-4b9e-820c-68e6c3d6b031', 'Benedict Sama', 'Male', '2000-10-01', 'bsama@cox.net', '4923 Carey Ave-Saint Louis-63104', '314-858-4832', '$2a$08$dxjl6UyhWUmTar3zHOgTk.EVHVHX8GzO4rIOc38C4JYGiNwaV9NXy', 1, '2022-07-27', 'BT', ''),
('8eae3a0e-04c9-4e43-ba50-9b798b1a1357', 'Helene Rodenberger', 'Female', '2001-02-12', 'helene@aol.com', '347 Chestnut St-Peoria-85381', '623-426-4907', '$2a$08$.z7rb7u0n3hGE5y0nO3BgukKUk.jJxGtC/LrRZBxA2JKCE3zL7Uqi', 3, '2022-07-27', 'MPAE', ''),
('8f41955e-ba4e-4b96-af35-019a61c7952c', 'Karan Karpin', 'Male', '2000-07-28', 'karan_karpin@gmail.com', '3 Elmwood Dr-Beaverton-97005', '503-707-5812', '$2a$08$4iirKBNX/10kbnn1zxUC8u/TF30aoguUXM.iIuYXThzfM/zq/hkUK', 1, '2022-07-27', 'IT', ''),
('8fc42b08-57a2-445a-a943-36629cf473d2', 'Deonna Kippley', 'Male', '2000-10-22', 'deonna_kippley@hotmail.com', '57 Haven Ave #90-Southfield-48075', '248-793-4966', '$2a$08$evQOghoL0dEYGlHAT94NkOByka3ll8I7WrbEjxaeBFdK3ztasl4tK', 2, '2022-07-27', 'BT', ''),
('8fda0888-c64c-4346-9413-13feb7199171', 'Izetta Funnell', 'Male', '2001-03-09', 'izetta.funnell@hotmail.com', '82 Winsor St #54-Atlanta-30340', '770-584-4119', '$2a$08$md4OWI4S8u0NXjomWxT5se6Onra8eJ5NQmH.hTU8L3mnMFXI3CeRG', 1, '2022-07-27', 'ME', ''),
('9051c287-b719-49d3-bc0a-34ef59506155', 'Frederica Blunk', 'Male', '2000-08-20', 'frederica_blunk@gmail.com', '99586 Main St-Dallas-75207', '214-529-1949', '$2a$08$gp52tXQC8/bZTckulxpgaOHVsKDowKfB5h6hR08b6tM75h.GC38GK', 2, '2022-07-27', 'IT', ''),
('914be265-086a-4ace-b7cf-7a3efa8030b3', 'Ligia Reiber', 'Female', '2000-11-26', 'lreiber@cox.net', '206 Main St #2804-Lansing-48933', '517-747-7664', '$2a$08$VxC1wCGD.X7uzUCruV3dQ.PfP0q43g1L70ZoVHauVB7aqPn/GsJn.', 1, '2022-07-27', 'MPAE', ''),
('9166dd3d-c177-421a-9aaf-92edf6d9608b', 'Kimbery Madarang', 'Male', '2000-05-22', 'kimbery_madarang@cox.net', '798 Lund Farm Way-Rockaway-7866', '973-225-6259', '$2a$08$Uo98u7T80K7JK4alYO15TOsivjXazfxifpEArnfvzzsTV4lDG0/NK', 1, '2022-07-27', 'ICE', ''),
('927f026d-fac3-422e-b3f0-16171bb57d1e', 'Mollie Mcdoniel', 'Female', '2001-04-11', 'mollie_mcdoniel@yahoo.com', '8590 Lake Lizzie Dr-Bowling Green-43402', '419-417-4674', '$2a$08$ZTLHr3kVpY9Hth1nTPCqO.rTCxNL2Vv71xnkOi4e1BHerErja9wTG', 3, '2022-07-27', 'ME', ''),
('93acdc50-7b64-4b68-8232-b5afb129e8eb', 'Jose Stockham', 'Male', '2000-02-10', 'jose@yahoo.com', '128 Bransten Rd-New York-10011', '212-569-4233', '$2a$08$0.7GjjipdhSl983ywqlG9OeL/fBJxPOLAG9hoK.tj/e4QRsvSRJ6C', 2, '2022-07-27', 'ECE', ''),
('957e6d78-7910-401d-be3c-44a225a46590', 'Dottie Hellickson', 'Male', '2000-10-05', 'dottie@hellickson.org', '67 E Chestnut Hill Rd-Seattle-98133', '206-295-5631', '$2a$08$l2PHWdlqAhmW3Rg3rdT8Zu07kO/5Jj.q5Zst7XCPDoBKKI0wH3O7K', 1, '2022-07-27', 'BT', ''),
('95b1f15e-9cec-46dc-b4c8-593acfa3d507', 'Derick Dhamer', 'Female', '2001-01-20', 'ddhamer@cox.net', '87163 N Main Ave-New York-10013', '212-225-9676', '$2a$08$.U38er1Y8l.on1.MgnhX5.HXAq5MXy/bhog6XGE8S8q.FFDr5MgK6', 2, '2022-07-27', 'MPAE', ''),
('95ee3458-f713-4ad8-bcb3-a41797909691', 'Roxane Campain', 'Male', '2000-02-16', 'roxane@hotmail.com', '1048 Main St-Fairbanks-99708', '907-335-6568', '$2a$08$479kypfn07UMTuCJ3Mf6Q.ZEE2GyLvvqaa/WLQr54HWWqelK4LgcG', 3, '2022-07-27', 'ECE', ''),
('9662c211-ba38-4b4d-abed-ba56e598f09e', 'Bette Nicka', 'Male', '2000-01-22', 'bette_nicka@cox.net', '6 S 33rd St-Aston-19014', '610-492-4643', '$2a$08$zfcjBO9DM8Hn09BMLjiJqeHPWZJsX2dso5sN.I27YXDJrDuag/rG2', 2, '2022-07-27', 'ECE', ''),
('98d325cb-0b80-4ea0-beb8-3851c3f1b6f5', 'Junita Brideau', 'Female', '2000-07-16', 'jbrideau@aol.com', '6 S Broadway St-Cedar Grove-7009', '973-582-5469', '$2a$08$8KhLAwioE6qqWpGNaG5q0OfaalKGEZI05SXiSXQEBxKwAMEFDU1bm', 1, '2022-07-27', 'IT', ''),
('98eb78e1-8e02-4748-b06b-6d7185ed7326', 'Raul Upthegrove', 'Female', '2000-11-14', 'rupthegrove@yahoo.com', '4 E Colonial Dr-La Mesa-91942', '619-666-4765', '$2a$08$iFRdCY0.URf207kc2uCINODYpghHMVdH0EwL68Vs47v72JacDiHWS', 3, '2022-07-27', 'BT', ''),
('9958f9cd-3040-4a26-8f3c-81e8a1e7236d', 'Dyan Oldroyd', 'Male', '2000-02-15', 'doldroyd@aol.com', '7219 Woodfield Rd-Overland Park-66204', '913-645-8918', '$2a$08$qXHWKVSmE2s78ZWzdIsvYuBRppMxSmT01vdDOPfuPXfVQIVgDDwOq', 3, '2022-07-27', 'ECE', ''),
('999d425a-4948-402a-82d2-a200133ac8fc', 'Vincenza Zepp', 'Female', '2001-02-23', 'vzepp@gmail.com', '395 S 6th St #2-El Cajon-92020', '619-935-6661', '$2a$08$FAjOzK4MY07UoV8BZiRbfOvCifwZ/rdavF0BEcoVJ48uiToS7MuIC', 3, '2022-07-27', 'MPAE', ''),
('99c56194-e9c3-4345-a7dd-756e8a0dc3e0', 'Hubert Walthall', 'Male', '2001-04-15', 'hubert@walthall.org', '95 Main Ave #2-Barberton-44203', '330-566-8898', '$2a$08$1qWlCv/sPLtFm3cEVuj6pe4X5Mq7yv3o54sdtsBdceP4AvoR7pACK', 3, '2022-07-27', 'ME', ''),
('99d78a98-0870-41b9-9018-b63f42211291', 'Ressie Auffrey', 'Male', '2000-09-07', 'ressie.auffrey@yahoo.com', '23 Palo Alto Sq-Miami-33134', '305-287-4743', '$2a$08$hT9eRdn2tbmCyH4rgEDgQO2/7HX4gesDFfw/7A5gH88wx3.LxHqPq', 3, '2022-07-27', 'IT', ''),
('9a72b1eb-2081-4039-b4ba-b824ed73d7bf', 'Geoffrey Acey', 'Male', '2000-10-12', 'geoffrey@gmail.com', '7 West Ave #1-Palatine-60067', '847-556-2909', '$2a$08$ElHSpOPLtq9IfqGaedP2quB.ro5pmVqVrqdG/TM8fTygLVYt6Qivm', 2, '2022-07-27', 'BT', ''),
('9beed1c0-8662-43a1-87d0-a2c2f09ffb8c', 'Brett Mccullan', 'Male', '2001-04-12', 'brett.mccullan@mccullan.com', '87895 Concord Rd-La Mesa-91942', '619-727-3892', '$2a$08$NTnaa9ofeFhpHef5kbLTYOy08S7J0YIk36FD9PMP4aiGVSegKA4w.', 3, '2022-07-27', 'ME', ''),
('9cb92215-d6bd-4de7-9f2a-11995f3aee7b', 'Goldie Schirpke', 'Female', '2000-11-28', 'goldie.schirpke@yahoo.com', '34 Saint George Ave #2-Bangor-4401', '207-748-3722', '$2a$08$dZhc.BPSE6RNh4aLvr6YwOJoLQsFXWCqFncwGvuy1Y5AyGUqhaTSi', 1, '2022-07-27', 'MPAE', ''),
('9d59ee47-c45e-485e-96e2-d1ae8449250e', 'Chantell Maynerich', 'Male', '2000-06-22', 'chantell@yahoo.com', '2023 Greg St-Saint Paul-55101', '651-776-9688', '$2a$08$VjwGE1JPYLS/c4gYUDlMEO3reW2e6hQZtQhHA2TxB/rMDAzLCsQFO', 3, '2022-07-27', 'ICE', ''),
('9da8028b-0d15-4776-b471-1aa1ee994e21', 'Cordelia Storment', 'Male', '2001-04-10', 'cordelia_storment@aol.com', '393 Hammond Dr-Lafayette-70506', '337-255-3427', '$2a$08$SgETjB6xEAcD8XRHSVqEieLUExWMxUDiEV.a/0CYpoqyLDetxt/iS', 3, '2022-07-27', 'ME', ''),
('9e76d1bb-652f-48b6-86ba-f141c8353690', 'Whitley Tomasulo', 'Male', '2001-01-09', 'whitley.tomasulo@aol.com', '2 S 15th St-Fort Worth-76107', '817-819-7799', '$2a$08$7HT9avPh1uzZYuqYfVm0S.2.X1nbVAGtxeFF03pkrmnFJG8L.R4iO', 1, '2022-07-27', 'MPAE', ''),
('9ea1c646-d4b9-45d6-a234-cf2c6d75a580', 'Marvel Raymo', 'Male', '2000-09-24', 'mraymo@yahoo.com', '9 Vanowen St-College Station-77840', '979-809-5770', '$2a$08$IaTAxY8UuZlH9vXYwcH59em56g6.M7SKcjDecZZuo2qeICZKj3la6', 1, '2022-07-27', 'BT', ''),
('9f615bee-8ce9-4ac0-8931-9e84b104340f', 'Helga Fredicks', 'Female', '2000-08-07', 'helga_fredicks@yahoo.com', '42754 S Ash Ave-Buffalo-14228', '716-854-9845', '$2a$08$Cu0.9Uc/3aOhKG2WpYEjVu5EQmKOUSnvLUXf/Zh7RxPUZ4VBRJ2M6', 2, '2022-07-27', 'IT', ''),
('9f6a8102-e23e-4804-a222-137ef0e3e4d9', 'Laurel Reitler', 'Male', '2000-03-22', 'laurel_reitler@reitler.com', '6 Kains Ave-Baltimore-21215', '410-957-6903', '$2a$08$Qw02.oDBErtCEeN0WskTgOB8NPlWeb7Q7Pz/y8cEtKlEVq99wAEYG', 1, '2022-07-27', 'CSE', ''),
('a03f97ea-fa75-4045-93e8-c68ca7323c74', 'Stevie Westerbeck', 'Male', '2000-10-13', 'stevie.westerbeck@yahoo.com', '26659 N 13th St-Costa Mesa-92626', '949-903-3898', '$2a$08$XxoIi9U4Pt1IYGU35p/XF.j3NtshvocL2Fo8Vdp8g4NJTZCrveobm', 2, '2022-07-27', 'BT', ''),
('a178c3b6-5caa-4886-b7e6-3091e9e5539f', 'Audra Kohnert', 'Male', '2000-06-05', 'audra@kohnert.com', '134 Lewis Rd-Nashville-37211', '615-448-9249', '$2a$08$/QlRSS3FPrdmUyVrej/SAOYD0iuU1hDU5CF1RHCcQrFlveh3ZrNj6', 2, '2022-07-27', 'ICE', ''),
('a3a870b6-eceb-4ac3-9040-106033f63c59', 'Ty Smith', 'Female', '2000-05-10', 'tsmith@aol.com', '4646 Kaahumanu St-Hackensack-7601', '201-995-3149', '$2a$08$aKhnEqvxtBadCCF3fkt4quu.0duNMdjqDyIWl3ipS5JMBl6dx3Vea', 1, '2022-07-27', 'ICE', ''),
('a42d80aa-5159-40ee-bf65-f4b23e6a832f', 'Terrilyn Rodeigues', 'Male', '2000-10-27', 'terrilyn.rodeigues@cox.net', '3718 S Main St-New Orleans-70130', '504-635-8518', '$2a$08$CDglxBQ40a64KZtgBJ2jn.MGgWplc/k0A4/A63pxpAHSe41rVUJ8G', 2, '2022-07-27', 'BT', ''),
('a4b807a6-8c22-4e39-9ecf-a8839bc53693', 'Rima Bevelacqua', 'Female', '2000-08-24', 'rima@cox.net', '2972 Lafayette Ave-Gardena-90248', '310-499-4200', '$2a$08$Ra7eu1wRW3Bd9GaoW7YrhuF9D8ZcPYCP8NznTrSayrRcq0LRUKQoq', 2, '2022-07-27', 'IT', ''),
('a570b4b5-e378-4c0e-bd8d-25ede96c528e', 'Melodie Knipp', 'Male', '2000-07-26', 'mknipp@gmail.com', '326 E Main St #6496-Thousand Oaks-91362', '805-810-8964', '$2a$08$cgY2Q9bWoxjeOAB4/DsuSeljfzuFcv.1gIFzpEXaGr7yYi7uugt/2', 1, '2022-07-27', 'IT', ''),
('a6a5468a-8b23-4b6d-9f17-17df0182625d', 'Georgene Montezuma', 'Male', '2000-07-23', 'gmontezuma@cox.net', '98 University Dr-San Ramon-94583', '925-943-3449', '$2a$08$iFaUefW840mqRZTDKSb7i.l4j9TNeyCE1sl6V0pSTIdrO7cVJXSxi', 1, '2022-07-27', 'IT', ''),
('a7981725-402f-46fc-a6ca-c44e51794a69', 'Cyril Daufeldt', 'Male', '2001-03-16', 'cyril_daufeldt@daufeldt.com', '3 Lawton St-New York-10013', '212-422-5427', '$2a$08$HGJ9Y0A5qKG7ZLVX0pLi3.dzsUpa47xkuOvNelE8prdfhx3TlL0OG', 1, '2022-07-27', 'ME', ''),
('a7af2afd-9e47-46e5-a2bc-f6c752d2a5cb', 'Lavera Perin', 'Female', '2000-02-17', 'lperin@perin.org', '678 3rd Ave-Miami-33196', '305-995-2078', '$2a$08$I4Udh0mNI5.rjpeg4f6tSeGuOJCg9Pwy8FaJXAZ0L6QJyJS9Z89rS', 3, '2022-07-27', 'ECE', ''),
('a7e78620-665f-4c3d-b007-aec2580d9d26', 'Simona Morasca', 'Female', '2000-01-07', 'simona@morasca.com', '3 Mcauley Dr-Ashland-44805', '419-800-6759', '$2a$08$3A7B9mRt/cPa2s.IpkdksO4P5sMWNDL/wI3xwDEIZ9I2q9XxWunJW', 1, '2022-07-27', 'ECE', ''),
('a8ec3fd7-6638-4bd7-b4ee-6133ee0c2e06', 'Dierdre Yum', 'Male', '2000-06-23', 'dyum@yahoo.com', '63381 Jenks Ave-Philadelphia-19134', '215-346-4666', '$2a$08$q.JM2P4H.U3rHTRCSY/U1uirfrftmobrfT5qh.c/74QwC8chqFz9O', 3, '2022-07-27', 'ICE', ''),
('a95c1cde-c683-49ad-b35a-05b872fa75e3', 'Lavonna Wolny', 'Male', '2001-02-09', 'lavonna.wolny@hotmail.com', '5 Cabot Rd-Mc Lean-22102', '703-892-2914', '$2a$08$TRfsnzK5QL7d/g4FdgpCi.GnejVhHM/tG3XOIpozVn0RKNNoKHniK', 3, '2022-07-27', 'MPAE', ''),
('aaf19636-b03e-40c2-9eea-0230b47e32da', 'Junita Stoltzman', 'Female', '2000-11-07', 'junita@aol.com', '94 W Dodge Rd-Carson City-89701', '775-578-1214', '$2a$08$1VUznowhg/yYn3WBYsAZxubjMLqTjYXWIor4anqPYXMENSbhC4L.6', 3, '2022-07-27', 'BT', ''),
('aca8b639-19bc-420c-9fde-ba061781580c', 'France Buzick', 'Male', '2001-01-17', 'france.buzick@yahoo.com', '64 Newman Springs Rd E-Brooklyn-11219', '718-853-3740', '$2a$08$/r3Nbi7UiWvbhOsBnJNYfefjW38MVpQAK2EUfom.xgEmj9wv7cYlm', 2, '2022-07-27', 'MPAE', ''),
('acda371e-1b0d-47ea-95b0-ceea3e870666', 'Fletcher Flosi', 'Female', '2000-01-21', 'fletcher.flosi@yahoo.com', '394 Manchester Blvd-Rockford-61109', '815-426-5657', '$2a$08$UGFfGnlc6z8FN33KSQBRUuD7gr.vgar24/ws384FKrm77vWV9I9Vy', 1, '2022-07-27', 'ECE', ''),
('ace29e72-d89b-4d1c-b779-760e6bf610a2', 'Cyndy Goldammer', 'Female', '2000-04-21', 'cgoldammer@cox.net', '170 Wyoming Ave-Burnsville-55337', '952-938-9457', '$2a$08$.ZwWh08ziKZA3DAAqoG7qeLLavxu.nQQ.gOHuerAKd0W5beWyhHLa', 3, '2022-07-27', 'CSE', ''),
('ad207e8f-7092-4dc7-b041-1962c9aca104', 'Leonida Gobern', 'Male', '2000-09-06', 'leonida@gobern.org', '5 Elmwood Park Blvd-Biloxi-39530', '228-432-4635', '$2a$08$7iEA6jlquNracUkzobh.Le4e1aFxK/n8YEQYRbO922fmroz6nUj86', 3, '2022-07-27', 'IT', ''),
('ad8482da-1005-4395-8b57-b5f2c6db1ccf', 'Raymon Calvaresi', 'Male', '2000-10-23', 'raymon.calvaresi@gmail.com', '6538 E Pomona St #60-Indianapolis-46222', '317-342-1532', '$2a$08$49WKrUDFDdaUDeFDfgNDdeICj.aM1YLdnG6ymW0SzW/mdk03AfIHi', 2, '2022-07-27', 'BT', ''),
('afb950c3-74a8-4b5f-8e8c-e92aaa6c28c8', 'Felix Hirpara', 'Female', '2000-11-20', 'felix_hirpara@cox.net', '7563 Cornwall Rd #4462-Denver-17517', '717-583-1497', '$2a$08$znM1JHEvso2XcMTnX6Yv0.aK3lFzg7VatWSqB5HckxHYiRXj7flti', 3, '2022-07-27', 'BT', ''),
('b0c348c3-63da-4435-a2e0-533ac77458cb', 'Harrison Haufler', 'Male', '2000-10-15', 'hhaufler@hotmail.com', '759 Eldora St-New Haven-6515', '203-801-8497', '$2a$08$iAmEHaD7Dp6HUq6.CG4/sODfnJzFXWpDGUSjPHgem0IRYzASwWh1O', 2, '2022-07-27', 'BT', ''),
('b0f91176-b85c-40ff-b791-eab39cb8143c', 'Kerry Theodorov', 'Female', '2000-06-26', 'kerry.theodorov@gmail.com', '6916 W Main St-Sacramento-95827', '916-770-7448', '$2a$08$wMSJwFVSPzZnvre8dgIMUuq8HMaHTXcz7iOQ2GgAWSOFF79sYp9BC', 3, '2022-07-27', 'ICE', ''),
('b0ff5c4e-8cf9-4318-a63b-3d9bdfb85ddb', 'Kristel Ehmann', 'Female', '2001-02-22', 'kristel.ehmann@aol.com', '92899 Kalakaua Ave-El Paso-79925', '915-300-6100', '$2a$08$DBsE2BGGgf22n4QKitGTAOjPjjf1z6nr3b5s3d1i5W7FNYmeIVG1a', 3, '2022-07-27', 'MPAE', ''),
('b105992f-5fe4-490f-8473-d8a1532b2b34', 'Marjory Mastella', 'Female', '2000-02-27', 'mmastella@mastella.com', '71 San Mateo Ave-Wayne-19087', '610-379-7125', '$2a$08$WLUlikjs5vI7b2PMOQkhy.9.Sdr3HNsHfGbRwAN6mi0F69e6zVFb6', 3, '2022-07-27', 'ECE', ''),
('b156a8ec-96b4-4321-a232-7a25c02a4331', 'Stephaine Vinning', 'Female', '2000-07-12', 'stephaine@cox.net', '3717 Hamann Industrial Pky-San Francisco-94104', '415-712-9530', '$2a$08$Ws1RhNdZ/EH9LvNYFzR6wesEs.fugahcGE3S9T9DVUTBu05jqmkrO', 3, '2022-07-27', 'ICE', ''),
('b15be7d1-3f40-4a0a-949b-c84c05aaa5fe', 'Erinn Canlas', 'Male', '2001-01-05', 'erinn.canlas@canlas.com', '13 S Hacienda Dr-Livingston-7039', '973-563-9502', '$2a$08$PKTKSanEHTfv55M.WSuCM.xPWuhgFEl5Xa0qVLnaOC/O1FrGOvAfG', 1, '2022-07-27', 'MPAE', ''),
('b1eeb654-5aab-44c5-99b9-e85e01c2d0c1', 'Winfred Brucato', 'Female', '2001-01-27', 'winfred_brucato@hotmail.com', '201 Ridgewood Rd-Moscow-83843', '208-793-4108', '$2a$08$VuCb8KPUaMJtYYNQ037L.eEFdzyNUep0a8ADEt89oEPKylsQxRohW', 2, '2022-07-27', 'MPAE', ''),
('b211fe90-6938-4004-94f1-cb4c16d418f2', 'Kimberlie Duenas', 'Female', '2000-10-07', 'kimberlie_duenas@yahoo.com', '8100 Jacksonville Rd #7-Hays-67601', '785-616-1685', '$2a$08$LYyNLgWiFVfQXE41ugFaLOtrlInkt3JQFpKVjx7i/puP4RpPyVOii', 1, '2022-07-27', 'BT', ''),
('b28674fb-945d-4735-9367-92e17e4ea62b', 'Lorean Martabano', 'Female', '2001-01-16', 'lorean.martabano@hotmail.com', '85092 Southern Blvd-San Antonio-78204', '210-634-2447', '$2a$08$vIGsXlgfREebEU4bOwAmIuSx.qDRXYXE4kExzLISAqsvj3d/3lj9O', 2, '2022-07-27', 'MPAE', ''),
('b2a779eb-e202-4941-98f4-4f0c00391c42', 'Kati Rulapaugh', 'Female', '2000-02-13', 'kati.rulapaugh@hotmail.com', '6980 Dorsett Rd-Abilene-67410', '785-219-7724', '$2a$08$uJKUnkpPOlA/IbrF9oOJvOtMQSYRTe.XjhjfGef2mmwemvV7Cuq6G', 2, '2022-07-27', 'ECE', ''),
('b2d03d0c-7c97-41a5-8490-e8c711dbce16', 'Rolande Spickerman', 'Male', '2000-05-20', 'rolande.spickerman@spickerman.com', '65 W Maple Ave-Pearl City-96782', '808-526-5863', '$2a$08$eXYWcJMa2Gx1uPEIIooQs.wRgPU1RZPixuCLA99IMVXfeg4VJBpFq', 1, '2022-07-27', 'ICE', ''),
('b36a67b7-06ad-46f4-af46-40067d2437d5', 'Pamella Fortino', 'Male', '2000-10-14', 'pamella@fortino.com', '669 Packerland Dr #1438-Denver-80212', '303-794-1341', '$2a$08$NvDrJxP7dHEXznI1BLSB4O57qcHF30r/4IrEhIsUUP9kyAyIL750i', 2, '2022-07-27', 'BT', ''),
('b37d9abf-3ba8-493a-9649-6d41b16b8667', 'Claribel Varriano', 'Male', '2000-07-17', 'claribel_varriano@cox.net', '6 Harry L Dr #6327-Perrysburg-43551', '419-573-2033', '$2a$08$y6wDUAK5KOHmjogcOWeJve0emnxr.GABP2iNGCrOxXSvlb0h0J0N2', 1, '2022-07-27', 'IT', ''),
('b45f768d-27fe-42fa-bd05-19f90cbc94c8', 'Art Venere', 'Male', '2000-01-04', 'art@venere.org', '8 W Cerritos Ave #54-Bridgeport-8014', '856-264-4130', '$2a$08$Yl9Rj6qh8OLctres2ifM4O6E9uRq2BzHTt/.3kK7X5YA33I.x1Lse', 1, '2022-07-27', 'ECE', ''),
('b7458a85-b074-40ab-b250-60f32b9b4dfb', 'Felicidad Poullion', 'Female', '2000-08-02', 'fpoullion@poullion.com', '9939 N 14th St-Riverton-8077', '856-828-6021', '$2a$08$agncIu9S7t/CTsj.8z5qv.tapEMzGPjF4/Sxwv.iC82YvtQrRkAAm', 1, '2022-07-27', 'IT', ''),
('b7d8da72-d7c7-4567-944d-0a203a3a5193', 'Lauran Burnard', 'Female', '2000-09-19', 'lburnard@burnard.com', '66697 Park Pl #3224-Riverton-82501', '307-453-7589', '$2a$08$tK6WBUNzGiWxgm6E5PWYweVbb43eL.X0Xl.T8MrTN.DCnD5y7Umw2', 1, '2022-07-27', 'BT', ''),
('b852ad33-3751-4083-bb06-2702b66acbc5', 'Lai Gato', 'Male', '2000-04-05', 'lai.gato@gato.org', '37 Alabama Ave-Evanston-60201', '847-957-4614', '$2a$08$jcqR2RP3t0Ba65.s2aeiJezIorSBe2Sw/LOEVKSmva0jN8M8FsI7.', 2, '2022-07-27', 'CSE', ''),
('b875a8d5-81e6-4234-85a7-ba4c5f0a3278', 'Benton Skursky', 'Male', '2000-07-18', 'benton.skursky@aol.com', '47939 Porter Ave-Gardena-90248', '310-694-8466', '$2a$08$WCoLlUwrefbYxZ2Hj6MvfuBII3XmkeMX5lqpPMrAD7dXfXH8G6OTi', 1, '2022-07-27', 'IT', ''),
('b9223ecf-3d6c-42a0-9cf6-db4a2775fb69', 'Ronny Caiafa', 'Female', '2000-08-10', 'ronny.caiafa@caiafa.org', '73 Southern Blvd-Philadelphia-19103', '215-511-3531', '$2a$08$WdBGowoOk4ogVkEoUNVq4uBkj0C2erCW/67uDAho5EGYhvIIF9/qi', 2, '2022-07-27', 'IT', ''),
('ba8c6542-0a0f-4894-803f-c9a4fe71bb04', 'Daren Weirather', 'Female', '2000-06-06', 'dweirather@aol.com', '9 N College Ave #3-Milwaukee-53216', '414-838-3151', '$2a$08$86Pb1mm0TC2wa0Ct8LLVcu6/kYtPUGO/Rm9c.q6DRK3w46QtKSARW', 2, '2022-07-27', 'ICE', ''),
('bab9a786-9232-4c60-b558-f1cd476c55e6', 'Mozell Pelkowski', 'Female', '2000-08-14', 'mpelkowski@pelkowski.org', '577 Parade St-South San Francisco-94080', '650-960-1069', '$2a$08$mTCiKxhq87EFN2El5qjpFufAVWcAJJhPpUPqK7ftqJu9TE/eK9t5C', 2, '2022-07-27', 'IT', ''),
('bb05b700-9cca-4cf8-a9c8-a4b539b2a8d4', 'Celeste Korando', 'Male', '2000-04-23', 'ckorando@hotmail.com', '7 W Pinhook Rd-Lynbrook-11563', '516-365-7266', '$2a$08$HjEqWmUDqSK23Y/ouqbxcujQbNWbmTXIU35bn/9Q6bHNOiJsqzIuq', 3, '2022-07-27', 'CSE', ''),
('bb855053-85bf-4466-b0e6-f90257527939', 'Viola Bitsuie', 'Male', '2000-08-15', 'viola@gmail.com', '70 Mechanic St-Northridge-91325', '818-481-5787', '$2a$08$e9pGqvI48TNJDAeQkduZYuOLGT6ZTy4dz81pBAtsJPKLkHLg.pMSi', 2, '2022-07-27', 'IT', ''),
('bbbfc574-a333-40ca-aab1-1c7806c02756', 'Mirta Mallett', 'Female', '2000-11-11', 'mirta_mallett@gmail.com', '7 S San Marcos Rd-New York-10004', '212-745-6948', '$2a$08$gSeQ63BgUBhyLDcRrkC1s.0MeCi09LugnwUedfPxrDQ742x4Ew4LK', 3, '2022-07-27', 'BT', ''),
('bc4fc504-9a5d-408b-99e4-353a68c7f2cd', 'Veronika Inouye', 'Male', '2000-01-23', 'vinouye@aol.com', '6 Greenleaf Ave-San Jose-95111', '408-813-4592', '$2a$08$xcesqmauEfTBED6SAppnmOKVja8a2g/DJ9b1ep3XhLHac61s4/lRq', 2, '2022-07-27', 'ECE', ''),
('bcc835d8-3f29-4807-aad3-879cdd449b7a', 'Jenelle Regusters', 'Female', '2000-11-23', 'jregusters@regusters.com', '3211 E Northeast Loop-Tampa-33619', '813-357-7296', '$2a$08$tMXxQfMgVocA/bIIDG2ea.j3gZQyHIMKcIrcRJLmAlsB7BFq/aNFu', 1, '2022-07-27', 'MPAE', ''),
('be0aecd8-aa39-4b3c-8750-cf199555899e', 'Maurine Yglesias', 'Female', '2000-03-10', 'maurine_yglesias@yglesias.com', '59 Shady Ln #53-Milwaukee-53214', '414-573-7719', '$2a$08$NR8QDiWazdfxwcTXpkhXheZSaXeSS8RLNHT4OOWCa4ecUemfNYx6K', 1, '2022-07-27', 'CSE', ''),
('bf4c1126-e923-4bb9-ba28-dec486745f91', 'Cherry Lietz', 'Female', '2001-01-06', 'cherry@lietz.com', '40 9th Ave Sw #91-Waterford-48329', '248-697-7722', '$2a$08$1YmOBZ1wQOp8RNQx8WKWbO8WuPTJJSD5rw8Q.AUekgaIYjXTqwfGi', 1, '2022-07-27', 'MPAE', ''),
('bf55e12e-0daf-4337-9d20-16dc43a026ba', 'Lashon Vizarro', 'Male', '2000-09-18', 'lashon@aol.com', '433 Westminster Blvd #590-Roseville-95661', '916-289-4526', '$2a$08$cUM5KFL.9cBf8uC61dpoquRXunRQBIrq3RNpEVV.9BpDKyDGIjDVq', 1, '2022-07-27', 'BT', ''),
('bfa0815d-a405-41cf-a490-78cc3d0271cd', 'Sarah Candlish', 'Female', '2000-11-15', 'sarah.candlish@gmail.com', '45 2nd Ave #9759-Atlanta-30328', '770-531-2842', '$2a$08$8f8D623oX2SIgCcXcmlcF.GKWhtwvZBL1X50/vm6F/pw4D9Cbi7Mi', 3, '2022-07-27', 'BT', ''),
('c02230db-2a8d-459f-84e1-607326b589e6', 'Norah Waymire', 'Female', '2000-08-12', 'norah.waymire@gmail.com', '6 Middlegate Rd #106-San Francisco-94107', '415-874-2984', '$2a$08$/fggBDoV1cmDT9KzFOdxNeeIQn7Aa0mQxb9MDTuvDlTSlFP9zxXPS', 2, '2022-07-27', 'IT', ''),
('c11146a8-61c5-408e-bdbc-6687946a7504', 'Lettie Isenhower', 'Female', '2000-04-02', 'lettie_isenhower@yahoo.com', '70 W Main St-Beachwood-44122', '216-733-8494', '$2a$08$bHtToG8E/rTCD3/RUpST0.eDJxqxzLyoAyBU.hUZOxTtpJ6QgyGLa', 2, '2022-07-27', 'CSE', ''),
('c5361fb0-0a0c-462a-84b3-9a0a0b0fa847', 'Salome Lacovara', 'Female', '2000-10-28', 'slacovara@gmail.com', '9677 Commerce Dr-Richmond-23219', '804-858-1011', '$2a$08$eFFhrJUnTnUGYf6l8RLvN.e7LkYuM1G5D0KjQo2jj8w5NPn2xNOsm', 2, '2022-07-27', 'BT', ''),
('c5705903-b77d-4805-80ee-5c6110474c88', 'Lizbeth Kohl', 'Female', '2001-03-27', 'lizbeth@yahoo.com', '35433 Blake St #588-Gardena-90248', '310-955-5788', '$2a$08$y3fZSXP/SB6hecixrmGzUe0lm6r1ERWnuW0ysImNBZZjAJzSCOVf6', 2, '2022-07-27', 'ME', ''),
('c6527cd7-3dfe-4c9c-a4cf-d87ab747007b', 'Casie Good', 'Female', '2000-11-09', 'casie.good@aol.com', '5221 Bear Valley Rd-Nashville-37211', '615-825-4297', '$2a$08$LmvIGnCeBeiHLmhMYPFmOuSehV4xe2WwpXOrdATFGyW9Af.CU0CAq', 3, '2022-07-27', 'BT', ''),
('c65b56b3-bd38-4ef5-8c63-7f19f45b28f8', 'Cammy Albares', 'Female', '2000-01-16', 'calbares@gmail.com', '56 E Morehead St-Laredo-78045', '956-841-7216', '$2a$08$vQ5FuquLleVBlPwCu/vsQONZLgBLFUs7SFnuafAtrVtyUZkARggI.', 1, '2022-07-27', 'ECE', ''),
('c661e92a-2d94-4e72-9390-11ca0ea5f14d', 'Lisha Centini', 'Female', '2000-04-16', 'lisha@centini.org', '64 5th Ave #1153-Mc Lean-22102', '703-475-7568', '$2a$08$UMJPqAqzJifGt0QjDGeBiuTRcag0Cm8k9kkUcCIle6znXNM2nePoi', 2, '2022-07-27', 'CSE', ''),
('c6a6b0cb-4a5f-475c-b0e8-c9fda14c07cc', 'Penney Weight', 'Female', '2000-03-12', 'penney_weight@aol.com', '18 Fountain St-Anchorage-99515', '907-873-2882', '$2a$08$Th6hCe4u/wDdv.St18VVXOXHKXUzWV6wTmgFvwIHPoEUnn/.E1MHG', 1, '2022-07-27', 'CSE', ''),
('c6b43b61-385e-4cfb-a90e-fddfd5dbc0c4', 'Eden Jayson', 'Female', '2001-04-26', 'eden_jayson@yahoo.com', '4 Iwaena St-Baltimore-21202', '410-429-4888', '$2a$08$xUN1m3FWhqCwzJgyjwSJF.kPrItoDUqWWgaHJHU/o.maG7MV0qKMC', 3, '2022-07-27', 'ME', ''),
('c79dbf3a-aa16-4c9b-8a41-d85e34caebab', 'Carin Deleo', 'Male', '2000-06-21', 'cdeleo@deleo.com', '1844 Southern Blvd-Little Rock-72202', '501-409-6072', '$2a$08$cCAkQ.O6byK0.WR8mC6nae/N5Goni5uQ2SPjSXWcYWTClB2YBdwaW', 2, '2022-07-27', 'ICE', ''),
('c8170e05-c0b3-458a-8815-1d8c86245f5a', 'Alyce Arias', 'Male', '2000-10-02', 'alyce@arias.org', '3196 S Rider Trl-Stockton-95207', '209-242-7022', '$2a$08$x4L4PZXZm8PE9FermHdAXe56sPjLq3hpHT7DFbLQVDb/QHxfHGXTK', 1, '2022-07-27', 'BT', ''),
('c8e9ae70-cb3b-447e-8dfe-8a5eca9c8d27', 'Johnna Engelberg', 'Female', '2000-10-16', 'jengelberg@engelberg.org', '5 S Colorado Blvd #449-Bothell-98021', '425-700-3751', '$2a$08$GO4TVzUOR2ohQC9CCzDTg.avZ3xMq6oCKPft7829GV/fZM2TFB8ru', 2, '2022-07-27', 'BT', ''),
('cace68ce-5505-4ded-9516-ddab8c663b90', 'Irma Wolfgramm', 'Female', '2000-07-05', 'irma.wolfgramm@hotmail.com', '9745 W Main St-Randolph-7869', '973-868-8660', '$2a$08$4TPziI392rol.AMshMjWreaKMYfe5aJzfq87KxhCZgrejBKoWypAy', 3, '2022-07-27', 'ICE', ''),
('cb6603bf-cd1f-4a08-8de8-e9b3ecbbd9bd', 'An Fritz', 'Male', '2000-09-26', 'an_fritz@hotmail.com', '506 S Hacienda Dr-Atlantic City-8401', '609-854-7156', '$2a$08$mylgX0srKsPalCd0FHdlOu8b19F7nas51TR40XbTAIOzsnam0HHq6', 1, '2022-07-27', 'BT', ''),
('cb6dae94-1a0e-44e7-9058-527178600808', 'Lilli Scriven', 'Female', '2001-01-08', 'lilli@aol.com', '33 State St-Abilene-79601', '325-667-7868', '$2a$08$pannf3Um6Cp0kLXnTgUcfe/DdLAZnn56L17Va7gmseBBEn.37feR6', 1, '2022-07-27', 'MPAE', ''),
('cc33abf4-7782-4998-9bc7-e9003ced9038', 'Willodean Konopacki', 'Male', '2000-08-17', 'willodean_konopacki@konopacki.org', '55 Hawthorne Blvd-Lafayette-70506', '337-774-7564', '$2a$08$BcCuiM0QB3Rxbvv5ptA6COhu/OuDN96lJq98KMRFqEj3wGevMZc0.', 2, '2022-07-27', 'IT', ''),
('cd99f55e-05e8-4911-9648-79d08e317f4b', 'Louisa Cronauer', 'Male', '2000-04-19', 'louisa@cronauer.com', '524 Louisiana Ave Nw-San Leandro-94577', '510-472-7758', '$2a$08$A7NSyR3Z0oHOtFiKDHGH.O8twbnLlGnad5vR/DSW8npObrOvy1jk.', 3, '2022-07-27', 'CSE', ''),
('cf3a82bf-cf01-4b31-973f-6cf3ef076c7e', 'Justine Ferrario', 'Female', '2001-01-18', 'jferrario@hotmail.com', '48 Stratford Ave-Pomona-91768', '909-631-5703', '$2a$08$7WvoPMiSJNwZesnLQG/mqeGHuZ.HSxPHt0lhtIHUhd.9r6yrx0nba', 2, '2022-07-27', 'MPAE', ''),
('d05f319c-3f73-4b50-92ad-a0836f0929f1', 'Angella Cetta', 'Female', '2000-04-20', 'angella.cetta@hotmail.com', '185 Blackstone Bldge-Honolulu-96817', '808-475-2310', '$2a$08$.E5ryxFiJ8H0gziOEttgeOBq9pwkj.FQ3jQ8k.my7jfZoEeFg4Wd6', 3, '2022-07-27', 'CSE', ''),
('d12d8fe1-7225-4811-8421-9c1b1ac6e309', 'Roosevelt Hoffis', 'Female', '2001-01-14', 'roosevelt.hoffis@aol.com', '60 Old Dover Rd-Hialeah-33014', '305-302-1135', '$2a$08$071wjGf9apfNAk.XPwUiTu8pGu6iDHCa6syupvYSN/ZcdmPwqx4jS', 2, '2022-07-27', 'MPAE', ''),
('d14f5a0f-1769-4b0b-a41e-1554aed6137e', 'Beatriz Corrington', 'Female', '2000-05-25', 'beatriz@yahoo.com', '481 W Lemon St-Middleboro-2346', '508-315-3867', '$2a$08$qKHoeOVBLftHA5IG/eKi0OAnCilqTz9GZ7CnxhE5smTAAfrts12Em', 1, '2022-07-27', 'ICE', ''),
('d2b9e7fb-3274-41df-a99c-817cd79495f3', 'Serina Zagen', 'Male', '2001-03-12', 'szagen@aol.com', '7 S Beverly Dr-Fort Wayne-46802', '260-382-4869', '$2a$08$FZ1kT66f5NKrvp9Ad4QIZOGBf8F/81poTg3ueygNTOCJq/Xy98kQS', 1, '2022-07-27', 'ME', ''),
('d37fbf4f-f21f-4c8a-afcf-5882a5f67e18', 'Nobuko Halsey', 'Female', '2001-02-08', 'nobuko.halsey@yahoo.com', '8139 I Hwy 10 #92-New Bedford-2745', '508-897-7916', '$2a$08$HPXxBanXNrW4pK23r4c5M.xuJygyBjrQGWXj1.fy3YEeq4U5hdLk2', 3, '2022-07-27', 'MPAE', ''),
('d388a3ee-33ee-472d-b62f-c46a6e1cd476', 'Tasia Andreason', 'Male', '2001-04-14', 'tasia_andreason@yahoo.com', '4 Cowesett Ave-Kearny-7032', '201-969-7063', '$2a$08$Yi7Q7sAU9c/qut.hXwNhzehNL3bIHNAPpeCn0qYYXNV7xdkmxagF.', 3, '2022-07-27', 'ME', ''),
('d45ac0c6-1b28-4000-b2c9-8588f60693e6', 'Becky Mirafuentes', 'Male', '2000-05-24', 'becky.mirafuentes@mirafuentes.com', '30553 Washington Rd-Plainfield-7062', '908-426-8272', '$2a$08$wNQiVFUmbYfVCuNFQ8WAJuxYyWps10Cz/tpMmaCnVZjM06YSP3t8u', 1, '2022-07-27', 'ICE', ''),
('d49a2a22-b704-4d97-9590-8d7111bc4189', 'Arlette Honeywell', 'Male', '2000-03-28', 'ahoneywell@honeywell.com', '11279 Loytan St-Jacksonville-32254', '904-514-9918', '$2a$08$WxuYRzzW/j1jO1z.vSxw1./hEM/4Bl7YIbb.OovAhgChkmvRJQn5S', 2, '2022-07-27', 'CSE', ''),
('d4c41fc7-b614-4ed8-9ade-f253dedd04a3', 'Arlene Klusman', 'Male', '2000-04-17', 'arlene_klusman@gmail.com', '3 Secor Rd-New Orleans-70112', '504-946-1807', '$2a$08$Dlv4VFZ1ng3s2ouQPiaZGuE4rQqPU5xW94aI8PobEXMnl9DcLKpCu', 2, '2022-07-27', 'CSE', ''),
('d67d38b4-ab2e-41c3-87e7-86631ae034f6', 'Yolando Luczki', 'Female', '2000-06-18', 'yolando@cox.net', '422 E 21st St-Syracuse-13214', '315-640-6357', '$2a$08$kxmt5vbR/6NDclAMAk8VAe84sYNT6Ty78HueyBTEv19Y2UYF8kvG2', 2, '2022-07-27', 'ICE', ''),
('d70c2bae-6af4-4d70-ac06-79757424cf81', 'Tyra Shields', 'Female', '2000-04-07', 'tshields@gmail.com', '3 Fort Worth Ave-Philadelphia-19106', '215-228-8264', '$2a$08$bTbNb/Q.C0ygPzBFNaNS8OeBhjuF.qL/RdQDQ238R7wYxT.87OoOu', 2, '2022-07-27', 'CSE', ''),
('d78fee66-e6b4-4926-be4e-19be9edef6ce', 'Chau Kitzman', 'Female', '2000-06-09', 'chau@gmail.com', '429 Tiger Ln-Beverly Hills-90212', '310-969-7230', '$2a$08$z32QSN/hFtOQvNmmmxeXIujI6WJjv9aPcuX6RcOyq06R4BS5XBgcC', 2, '2022-07-27', 'ICE', ''),
('d7b80de3-0b8c-4456-83ba-1b0d4cd77e56', 'Kris Marrier', 'Female', '2000-01-11', 'kris@gmail.com', '228 Runamuck Pl #2808-Baltimore-21224', '410-804-4694', '$2a$08$6oaBeLJlVOFUU/ESe4V3bOL64dmsK/jGzazlKunKAQK.s3H.kxNRK', 1, '2022-07-27', 'ECE', ''),
('d8634a9e-24d7-4e16-b080-102afdd0c355', 'Lorrie Nestle', 'Female', '2000-02-25', 'lnestle@hotmail.com', '39 S 7th St-Tullahoma-37388', '931-303-6041', '$2a$08$t9ynX4hmScehq.jFKJaz5u6/MSB9WfJRJV1bpbH4v4vv1UryViPea', 3, '2022-07-27', 'ECE', ''),
('d90c9843-c78a-4ab6-9aed-a7642c458911', 'Kallie Blackwood', 'Male', '2000-03-16', 'kallie.blackwood@gmail.com', '701 S Harrison Rd-San Francisco-94104', '415-604-7609', '$2a$08$mMrqHKkAoI9TunC/QAVCoOFmF8R7v1nErTf6MvjezYV0kNg1CEV2e', 1, '2022-07-27', 'CSE', ''),
('da6e2490-05e3-405f-9ee5-45ef9c6b8aec', 'Aja Gehrett', 'Male', '2001-01-24', 'aja_gehrett@hotmail.com', '993 Washington Ave-Nutley-7110', '973-986-4456', '$2a$08$fMi8DMNWR0DLQEiBo/Ug3uzBxzextVmejikaVPmpyw5MI4M1ultBO', 2, '2022-07-27', 'MPAE', ''),
('daddbcdf-e04c-4b17-b845-ca55d833ab92', 'Renea Monterrubio', 'Male', '2000-11-24', 'renea@hotmail.com', '26 Montgomery St-Atlanta-30328', '770-930-9967', '$2a$08$dPjUt8pL.zY7NYbbCbKyZuPLlCSI.lRSnlWCoD6Q238t8c5coyvqi', 1, '2022-07-27', 'MPAE', ''),
('db07969f-e914-4229-81a0-ed34ddcf3ba1', 'Tarra Nachor', 'Male', '2001-01-28', 'tarra.nachor@cox.net', '39 Moccasin Dr-San Francisco-94104', '415-284-2730', '$2a$08$5JIBgTc/tklqF5wOy.YBoOQuMGJhr.08CmE/T6stftdbTssANcj92', 2, '2022-07-27', 'MPAE', ''),
('dbbcf8f1-0568-4823-a309-c128043bb43c', 'Amber Monarrez', 'Male', '2000-03-02', 'amber_monarrez@monarrez.org', '14288 Foster Ave #4121-Jenkintown-19046', '215-329-6386', '$2a$08$qexlEP0ENO4xsdtxzLZ2Me.H7SCrGvFRJ1AkphaL08B8YCF55Fclu', 3, '2022-07-27', 'ECE', ''),
('dc094534-5266-4545-8aaf-17b1338a3a4a', 'Chaya Malvin', 'Male', '2000-09-10', 'chaya@malvin.com', '560 Civic Center Dr-Ann Arbor-48103', '734-408-8174', '$2a$08$tXnRrvZ0zGeBR66IOjmhAeRqUYQ1XHXoEArvepLADeAfAYUpBZi/q', 3, '2022-07-27', 'IT', ''),
('dc19fe94-92af-4e64-973b-08bf5d17ac6a', 'Bok Isaacs', 'Male', '2000-05-19', 'bok.isaacs@aol.com', '6 Gilson St-Bronx-10468', '718-478-8568', '$2a$08$OtjinPMBD7IHKI0A7VGIh.m0ZjjL6MZs/PyyX/GLI96DFPEyuG8Oe', 1, '2022-07-27', 'ICE', ''),
('dc5dd2e6-e89c-4959-97c2-464cfa4afb6f', 'Eladia Saulter', 'Female', '2000-09-09', 'eladia@saulter.com', '3958 S Dupont Hwy #7-Ramsey-7446', '201-365-8698', '$2a$08$zRE0PcfkE2LjarCafOjl2uWnzI4BleEjiMElYagnQKWpBGmegZN1y', 3, '2022-07-27', 'IT', ''),
('dc9d2ddd-bfb0-4aeb-9a32-c4f64fbf240f', 'Leota Ragel', 'Male', '2001-01-22', 'leota.ragel@gmail.com', '99 5th Ave #33-Trion-30753', '706-616-5131', '$2a$08$5DwYrIg7xaKaSThHhzzGT.NGZJvMgDklrmv7Z/mUDQ/dJuFDiXPni', 2, '2022-07-27', 'MPAE', ''),
('dcb41154-9503-4735-b9c1-01c521b96974', 'Lynelle Auber', 'Male', '2001-04-27', 'lynelle_auber@gmail.com', '32820 Corkwood Rd-Newark-7104', '973-605-6492', '$2a$08$sq4oPjrfMi16Tvu112jvBetreG17fXlPYbCX37okgY0CQhQekqGC.', 3, '2022-07-27', 'ME', ''),
('ddd323f2-2052-422f-9ddb-d318887f52ef', 'Jaclyn Bachman', 'Female', '2001-03-15', 'jaclyn@aol.com', '721 Interstate 45 S-Colorado Springs-80919', '719-223-2074', '$2a$08$4gdd0k2wa6hUWuH1FnZ0jeNC2ET.x8vzdez57c2AJa9YP/S6ICIre', 1, '2022-07-27', 'ME', ''),
('de7a41a1-09ad-436b-a758-4f4293fcaefa', 'Lindsey Dilello', 'Female', '2000-05-12', 'lindsey.dilello@hotmail.com', '52777 Leaders Heights Rd-Ontario-91761', '909-589-1693', '$2a$08$AYow.b/dIUk11Jsy45fxK.Xr.wkg3KAUsGfUzTAXu2rdhqp.QHNc6', 1, '2022-07-27', 'ICE', ''),
('de9d4309-1999-4292-b4a0-c7ea8b9567b2', 'Cristy Lother', 'Male', '2000-08-27', 'cristy@lother.com', '3989 Portage Tr-Escondido-92025', '760-465-4762', '$2a$08$mX7PXFZ6wUqzMdGqfnA6TuFu./Zbx./asujPRYodLMkQcKKqSGucC', 3, '2022-07-27', 'IT', ''),
('df1f5914-46ac-48a7-9036-3f8aa4cd8dbe', 'Alaine Bergesen', 'Male', '2000-09-04', 'alaine_bergesen@cox.net', '7667 S Hulen St #42-Yonkers-10701', '914-654-1426', '$2a$08$KQ9RYlzM0N0aQ38HF6eA5ezHBenPhDvvXvuIUTT/vNQ0rld7ABulu', 3, '2022-07-27', 'IT', ''),
('df54f571-332c-4619-876f-4d62a608e981', 'Ezekiel Chui', 'Female', '2000-02-01', 'ezekiel@chui.com', '2 Cedar Ave #84-Easton-21601', '410-235-8738', '$2a$08$ew6883xqNBLaLLhx7Hkl7eckF/raYYVRQSFvJMoWuttpJTbS8k3zq', 2, '2022-07-27', 'ECE', ''),
('dfd20344-8060-434d-9395-50120ee13b7f', 'Paz Sahagun', 'Male', '2001-03-13', 'paz_sahagun@cox.net', '919 Wall Blvd-Meridian-39307', '601-249-4511', '$2a$08$ann0udoh2uVj1HXfh086AOxzY156sc1XUqd9rvy5YNZI96WtirFNu', 1, '2022-07-27', 'ME', ''),
('e0385a59-e93f-4dd0-92f1-63eb417b02ea', 'Ceola Setter', 'Male', '2000-09-20', 'ceola.setter@setter.org', '96263 Greenwood Pl-Warren-4864', '207-297-5029', '$2a$08$3CfaTJV9KeowhGgMOtThHOOLXH/1OfMXmRGHLkvQjOsjsHqOr0jZG', 1, '2022-07-27', 'BT', ''),
('e07a518d-3086-40c7-8c47-b0686be2e844', 'Ettie Hoopengardner', 'Male', '2001-04-25', 'ettie.hoopengardner@hotmail.com', '39 Franklin Ave-Richland-99352', '509-847-3352', '$2a$08$/zvRU0Gqp380kLC.uRbIYufNcozEEEQc3P7o60wcGrMnGi2lLMdge', 3, '2022-07-27', 'ME', ''),
('e07b9d37-9d6f-4b31-951c-c07292f89c0a', 'Franklyn Emard', 'Female', '2000-08-16', 'femard@emard.com', '4379 Highway 116-Philadelphia-19103', '215-483-3003', '$2a$08$UGLA4I7D5N96xH/cfAkN.uNiVXqBcym49WVViOC4/QQ8GFxWj1Aue', 2, '2022-07-27', 'IT', ''),
('e1a80729-cbf1-4418-b327-7a46f0ae544d', 'Sabra Uyetake', 'Female', '2000-02-26', 'sabra@uyetake.org', '98839 Hawthorne Blvd #6101-Columbia-29201', '803-681-3678', '$2a$08$3fJFCJjOV2sijIK16KryJevl7ybolTme8V2N2dWVUlVAAmTNR1TL.', 3, '2022-07-27', 'ECE', ''),
('e24cd80d-9f5a-4b2a-82e2-5baf02456256', 'My Rantanen', 'Male', '2000-09-21', 'my@hotmail.com', '8 Mcarthur Ln-Richboro-18954', '215-647-2158', '$2a$08$KpIT29/sWHsOeNWnSjIIaeBbXrCGMkOI1X/VKn0LQWSlyzuCB0aDO', 1, '2022-07-27', 'BT', ''),
('e28152f4-b993-4285-bea7-e25d72a788aa', 'Reena Maisto', 'Male', '2000-11-10', 'reena@hotmail.com', '9648 S Main-Salisbury-21801', '410-951-2667', '$2a$08$8T2K/N3DgsjcJTRf393ZNeR5tys2QeC0QkVQs.7ohDOngPliWyxYC', 3, '2022-07-27', 'BT', ''),
('e2f0719a-c118-491d-85ff-1bd6c554f21c', 'Herman Demesa', 'Female', '2000-05-14', 'hdemesa@cox.net', '9 Norristown Rd-Troy-12180', '518-931-7852', '$2a$08$6RPBWpy.gtlKtdQ2pVs48.lQs3g9Q7QiFnNyijVD6A3OtjfQeEzi6', 1, '2022-07-27', 'ICE', ''),
('e2f7b661-d0a9-4859-8ba7-11c199543467', 'Wilda Giguere', 'Female', '2000-04-11', 'wilda@cox.net', '1747 Calle Amanecer #2-Anchorage-99501', '907-914-9482', '$2a$08$9cnXG26u6g/cvW67aq/ghu7zU21NvabFncLK9sHSAZCAF8x.hR5Z2', 2, '2022-07-27', 'CSE', ''),
('e3510801-1d3d-4710-a052-410f7b4dcbc1', 'Shawna Palaspas', 'Male', '2000-05-06', 'shawna_palaspas@palaspas.org', '5 N Cleveland Massillon Rd-Thousand Oaks-91362', '805-638-6617', '$2a$08$deGpASm185GZA0HIBFmw..9xiOEOdPFoDDsclh9xyl/SVWEli59ZW', 3, '2022-07-27', 'CSE', ''),
('e3755ed7-f5ae-4b12-8891-d17ebe8eee36', 'Barrett Toyama', 'Female', '2000-08-06', 'barrett.toyama@toyama.org', '4252 N Washington Ave #9-Kennedale-76060', '817-577-6151', '$2a$08$Gml0LhD035MRBo8t4WIid.q8lx3BqH9hDWGM2C3HQ15k/n5JAvY5K', 2, '2022-07-27', 'IT', ''),
('e3cef1bd-5583-4529-a82c-953ff8c2a346', 'Jesusita Flister', 'Male', '2001-01-12', 'jesusita.flister@hotmail.com', '3943 N Highland Ave-Lancaster-17601', '717-686-7564', '$2a$08$YW3gytE1VZe/HDau0N50j.Kiy3l9ZSVWsslFjzAadTvahhefbENOS', 1, '2022-07-27', 'MPAE', ''),
('e45621bf-89ef-402f-8c33-caccdc947423', 'Valentine Gillian', 'Female', '2000-02-12', 'valentine_gillian@gmail.com', '775 W 17th St-San Antonio-78204', '210-300-6244', '$2a$08$7RFaB3wLpoDwqRu.o62xBuxP5zzVqGqx8TfRQMP33wXoMlyDUB9uC', 2, '2022-07-27', 'ECE', ''),
('e495b8a5-194c-48c3-867c-0997477c91de', 'Brandon Callaro', 'Male', '2000-05-07', 'brandon_callaro@hotmail.com', '7 Benton Dr-Honolulu-96819', '808-240-5168', '$2a$08$mU5QR1CVqItsykMZ0HYW5OwrUwYy.S0E3h/TO.4fOcjuVa9SaimHS', 3, '2022-07-27', 'CSE', ''),
('e4d1772f-1fc2-4639-a2c2-00476b7973fb', 'Brock Bolognia', 'Male', '2000-02-24', 'bbolognia@yahoo.com', '4486 W O St #1-New York-10003', '212-617-5063', '$2a$08$rdSqCmbTO98SqtJVDTcME.91OuSTVxZJ1Q8t3AYuu0dThe0Y66lFS', 3, '2022-07-27', 'ECE', ''),
('e541208d-a502-4568-8261-c2253ca98dc5', 'Edna Miceli', 'Male', '2000-04-28', 'emiceli@miceli.org', '555 Main St-Erie-16502', '814-299-2877', '$2a$08$MBDtrm4M2jhdZ3IUFQ8AQOfkdceYjqV0jva.s6k4FpNpvdpzK6wVq', 3, '2022-07-27', 'CSE', ''),
('e5445acf-a0a4-4bff-898f-56ca3a5e08ba', 'Kaitlyn Ogg', 'Male', '2001-02-04', 'kaitlyn.ogg@gmail.com', '2 S Biscayne Blvd-Baltimore-21230', '410-773-3862', '$2a$08$0NbRFlMD97iV1QSwkoOtrOfv5IBt5Up/jvcRPU2JJu3T9MZ8K/Af6', 2, '2022-07-27', 'MPAE', ''),
('e6c19346-2e25-4924-9d07-62bb41672e96', 'Marge Limmel', 'Female', '2000-08-11', 'marge@gmail.com', '189 Village Park Rd-Crestview-32536', '850-330-8079', '$2a$08$K6i0zERRpIkxJVm8DE2KcOgOvVDYmsVXLxIEX85wg8S3ZXtUTlrIe', 2, '2022-07-27', 'IT', ''),
('e8509a18-ff3f-41e3-8c52-7059dcfa10c7', 'Katina Polidori', 'Male', '2000-09-15', 'katina_polidori@aol.com', '5 Little River Tpke-Wilmington-1887', '978-679-7429', '$2a$08$VE5SwooN4xEJqKf7uunDwuEu1lb/2Ke8ivJWHnEeSTommsacUI7xe', 3, '2022-07-27', 'IT', ''),
('e854e9ac-6676-4cfd-8f02-809fadeb9747', 'Abel Maclead', 'Female', '2000-01-13', 'amaclead@gmail.com', '37275 St  Rt 17m M-Middle Island-11953', '631-677-3675', '$2a$08$DAu9CjJdnhQv1xwx1IlRuefgQH2F9k8mW7vG.h6Tq9xSGoIx42e3W', 1, '2022-07-27', 'ECE', ''),
('e95a8160-7f98-447a-8c32-b110f8de9da4', 'Kanisha Waycott', 'Female', '2000-02-21', 'kanisha_waycott@yahoo.com', '5 Tomahawk Dr-Los Angeles-90006', '323-315-7314', '$2a$08$rfAp6GSXG3HV9rW3iK6xNenPAW5lsF.567G/JDdDxvZzp6MbLRd2W', 3, '2022-07-27', 'ECE', ''),
('e967e540-e623-4527-9c98-de89dab22bf4', 'Christiane Eschberger', 'Male', '2000-11-27', 'christiane.eschberger@yahoo.com', '96541 W Central Blvd-Phoenix-85034', '602-330-6894', '$2a$08$0dycweO9mF2QQjQapdUl4.J4jg.JC6MSVALE2WZ0Hq4C6ZZYRmXCe', 1, '2022-07-27', 'MPAE', ''),
('e990dd50-3717-4555-827b-a929e430767e', 'Pamella Schmierer', 'Male', '2000-05-04', 'pamella.schmierer@schmierer.org', '5161 Dorsett Rd-Homestead-33030', '305-575-8481', '$2a$08$sSTE01TktGdkEY9mBaWqbOFGb3CX87kGjsB3RVj3zNqk5iF7B01Ki', 3, '2022-07-27', 'CSE', ''),
('ea3d2efb-eab1-42ce-b021-b76c4376ae4e', 'Laticia Merced', 'Female', '2000-06-12', 'lmerced@gmail.com', '72 Mannix Dr-Cincinnati-45203', '513-418-1566', '$2a$08$Wi8ieEv45gcNHDrsuLNDsu9cijDFbBJxNxV3Xl6g4e7a4c9Gmw7YC', 2, '2022-07-27', 'ICE', ''),
('ea72fa71-4563-4f6c-a312-0137d22118dd', 'Delisa Crupi', 'Male', '2000-03-23', 'delisa.crupi@crupi.com', '47565 W Grand Ave-Newark-7105', '973-847-9611', '$2a$08$qUeTPy.aSjlBVht1zLFPxeID7OdfxhXry9Dba2zIE/BUkqLWN2nAW', 1, '2022-07-27', 'CSE', ''),
('eb6b47d7-3b04-4bfc-a9a5-5fa59e2893c2', 'Larae Gudroe', 'Male', '2000-06-24', 'larae_gudroe@gmail.com', '6651 Municipal Rd-Houma-70360', '985-261-5783', '$2a$08$gdg6ZjPQ7DOgZpfUwoWvee6CmdxF7W68BN1TBXLcelvE5b/2DDKdq', 3, '2022-07-27', 'ICE', ''),
('eba38f7e-e0a6-47d1-a1cd-ffaf199ae26d', 'Jettie Mconnell', 'Female', '2000-07-24', 'jmconnell@hotmail.com', '50 E Wacker Dr-Bridgewater-8807', '908-602-5258', '$2a$08$2OwOvmnHHUEn.Ra6TsBFTO5F0r94SUhehblzzbewXMxOAJjf0v10W', 1, '2022-07-27', 'IT', ''),
('ebc2883f-5f70-4536-b247-1b5e1ee64dde', 'Rosio Cork', 'Male', '2000-04-22', 'rosio.cork@gmail.com', '4 10th St W-High Point-27263', '336-497-4407', '$2a$08$A0.ynIGghiPoitwppwqlIe9s.5QNQsktGeImZuUV9Fn732fYmXGOy', 3, '2022-07-27', 'CSE', ''),
('ec4e2394-5ebc-44e5-b588-48abe9ecb95d', 'Danica Bruschke', 'Male', '2000-04-10', 'danica_bruschke@gmail.com', '840 15th Ave-Waco-76708', '254-205-1422', '$2a$08$BN9ffZjdUk3AIx0666e7Her7XbPAlsyeA6RIItRLoa2qCdavygE5i', 2, '2022-07-27', 'CSE', ''),
('ec69e273-f371-44d5-a906-4d57e260a07a', 'Elza Lipke', 'Female', '2000-03-25', 'elza@yahoo.com', '6794 Lake Dr E-Newark-7104', '973-796-3667', '$2a$08$r8RGurioJwjGwVU4k8FiPeG/fWN7BJWaAF1wzmrb863wSUA3V1UVO', 1, '2022-07-27', 'CSE', ''),
('ed65132f-dd67-4db2-b970-72178f5a2342', 'Lashawnda Stuer', 'Male', '2001-02-06', 'lstuer@cox.net', '7422 Martin Ave #8-Toledo-43607', '419-399-1744', '$2a$08$sSLUTgxAuK5uIRTB6d/dMehs8Bj1N.e2WgTME2qi645iaBDv0rZjS', 3, '2022-07-27', 'MPAE', ''),
('ee5b74ce-7391-48d4-a978-2bd3d0d18f0c', 'Ma Layous', 'Female', '2000-10-25', 'mlayous@hotmail.com', '78112 Morris Ave-North Haven-6473', '203-564-1543', '$2a$08$6SYrYIXaDdOO/ym2SiYo7egpyawaneIdDo6ngdx9wBFSzfXz1L1Ja', 2, '2022-07-27', 'BT', ''),
('ee90fc3b-cf73-4cdf-9493-ef18f46f887a', 'Latrice Tolfree', 'Male', '2000-06-25', 'latrice.tolfree@hotmail.com', '81 Norris Ave #525-Ronkonkoma-11779', '631-998-2102', '$2a$08$z0o8aiZBxf.6HCqw4ddUzOrrIQ/A54ci1Jc0u9q9vLehnNp9fUfV2', 3, '2022-07-27', 'ICE', ''),
('efb0b16c-745f-4cae-b8eb-455de8045d39', 'Bernardine Rodefer', 'Male', '2001-04-21', 'bernardine_rodefer@yahoo.com', '2 W Grand Ave-Memphis-38112', '901-739-5892', '$2a$08$6PSo.nZVVq3Ii1Y3CUZzpOt6sLIk9HQrKa.jTs7NPtoeYt0iwq8w.', 3, '2022-07-27', 'ME', ''),
('f0127ea1-1155-484b-8951-19bcca3c5ca3', 'Dean Ketelsen', 'Female', '2001-04-06', 'dean_ketelsen@gmail.com', '2 Flynn Rd-Hicksville-11801', '516-732-6649', '$2a$08$4eJtz3fOwQ063E7NUJt82.jcpyPZjnCOQ7To7BbGoA8c5oF2p6cyC', 2, '2022-07-27', 'ME', ''),
('f1de2d98-6362-4928-9ab6-80851eb26a83', 'Amie Perigo', 'Male', '2001-01-03', 'amie.perigo@yahoo.com', '596 Santa Maria Ave #7913-Mesquite-75150', '972-898-1033', '$2a$08$z/Y7ElOODP84G3T1rh9XfOt3Nqd6UAsvxsiSYeGhRss3MZmLywZJq', 1, '2022-07-27', 'MPAE', ''),
('f2e791d1-a302-485d-a5a6-b70335b8d8a5', 'Blondell Pugh', 'Male', '2000-03-06', 'bpugh@aol.com', '201 Hawk Ct-Providence-2904', '401-300-8122', '$2a$08$DFddpR3fpEvD3BPw7r8mju5b/UmnPlvRPZJnBlHYBx2WzvOzV.Iom', 1, '2022-07-27', 'CSE', ''),
('f2eb2d17-4e90-4141-9981-3bfe445a5374', 'Howard Paulas', 'Male', '2000-05-21', 'hpaulas@gmail.com', '866 34th Ave-Denver-80231', '303-692-3118', '$2a$08$b8S3Agj7iTffjQItG/S/wOjZfpqnL7/labpZBuc3BI8gRgY5v15fe', 1, '2022-07-27', 'ICE', ''),
('f2f13c67-1570-4bcf-8a7b-b155f65b5f27', 'James Butt', 'Male', '2000-01-02', 'jbutt@gmail.com', '6649 N Blue Gum St-New Orleans-70116', '504-845-1427', '$2a$08$EXBow.05on7yPP.0Ll4rAOFfCT7RwbzFM9MPl8y0tGWnYhRDR9tRG', 1, '2022-07-27', 'ECE', ''),
('f3239f9f-496b-4a23-8356-348c194113e3', 'Elouise Gwalthney', 'Male', '2001-02-24', 'egwalthney@yahoo.com', '9506 Edgemore Ave-Bladensburg-20710', '301-591-3034', '$2a$08$R7ixQSVsqk6chx8Jv8GCluT6MvuxuSSua2xdWviGtTIF1N/yS36Au', 3, '2022-07-27', 'MPAE', ''),
('f3911768-d8aa-477e-9e6d-869477094e0a', 'Gregoria Pawlowicz', 'Female', '2000-06-20', 'gpawlowicz@yahoo.com', '455 N Main Ave-Garden City-11530', '516-376-4230', '$2a$08$Lpkr1OkGRiSECy7s1lsnz.ovfjzca3Jdb2kD4k6oarQ4wJWlJABay', 2, '2022-07-27', 'ICE', ''),
('f3eec7e4-6a38-4853-b912-f45c961e3bf2', 'Deandrea Hughey', 'Female', '2000-10-06', 'deandrea@yahoo.com', '33 Lewis Rd #46-Burlington-27215', '336-467-3095', '$2a$08$4gpGqQx4tCvL76uXXua3geJ2K2F.6id5iTMjBhBqgedO3Yt/QVRD.', 1, '2022-07-27', 'BT', ''),
('f5a479fb-584d-4336-873b-4c08aaa564a1', 'Rebecka Gesick', 'Male', '2000-08-19', 'rgesick@gesick.org', '2026 N Plankinton Ave #3-Austin-78754', '512-693-8345', '$2a$08$DFm9uqg/UNzlSeAVcNFJlutEV.VesqAa5NntQ24WXQX/fnewrObGO', 2, '2022-07-27', 'IT', ''),
('f5b0de8a-02fc-4f63-aa05-3f5d43195127', 'Tracey Modzelewski', 'Male', '2000-09-01', 'tracey@hotmail.com', '77132 Coon Rapids Blvd Nw-Conroe-77301', '936-988-8171', '$2a$08$H8iPaxxVC.sotvFk6PQPKO/aZTlBqwLUURjWNoWDzXlXemqCP4w8q', 3, '2022-07-27', 'IT', ''),
('f5c64993-5828-4f2a-afdb-4181bad36ba3', 'Zona Colla', 'Male', '2001-03-11', 'zona@hotmail.com', '49440 Dearborn St-Norwalk-6854', '203-938-2557', '$2a$08$zHM980Xu8YbUBpDLJwgJIuvftN7ksKPKjrsNmeSvtzAxiFAONudLm', 1, '2022-07-27', 'ME', '');
INSERT INTO `student` (`s_id`, `s_name`, `gender`, `dob`, `email`, `s_address`, `contact`, `password`, `section`, `joining_date`, `dept_id`, `resetLink`) VALUES
('f5f09f6f-5ec6-4070-a95f-b9da6d49614e', 'Cheryl Haroldson', 'Male', '2000-06-11', 'cheryl@haroldson.org', '92 Main St-Atlantic City-8401', '609-263-9243', '$2a$08$kunX8zrd5DlTJL0NTBNIPuE9nCeb85atUUXk2Ss//Sj2ngM3l5tKS', 2, '2022-07-27', 'ICE', ''),
('f7745d4e-7edb-41b9-90f7-c5c7d5df89fa', 'Lucina Lary', 'Female', '2000-05-18', 'lucina_lary@cox.net', '8597 W National Ave-Cocoa-32922', '321-632-4668', '$2a$08$EbVOMe45DOerxfrs1280mOSn.NrU58rayiihCK.uEfAA09CGeQF4W', 1, '2022-07-27', 'ICE', ''),
('f7757fd4-4508-495b-a8b3-acadb84cafdb', 'Minna Amigon', 'Female', '2000-01-12', 'minna_amigon@yahoo.com', '2371 Jerrold Ave-Kulpsville-19443', '215-422-8694', '$2a$08$WzdNsK6FO4nAq1U.R8NMouRlSLhgn8zMioPAb6tLFMfi4PwUm3JMW', 1, '2022-07-27', 'ECE', ''),
('f7ab8e7d-7295-4356-8138-840f4147b296', 'Cathrine Pontoriero', 'Male', '2000-11-12', 'cathrine.pontoriero@pontoriero.com', '812 S Haven St-Amarillo-79109', '806-558-5848', '$2a$08$FNhUFBEHeFm0T6JlWQ80p.SDBKjeBQMc8LwEKVjBZtsB/42WwfY6e', 3, '2022-07-27', 'BT', ''),
('f7e5102d-62fa-4dfd-812c-e4c37c3246e1', 'Laurel Pagliuca', 'Male', '2001-04-03', 'laurel@yahoo.com', '36 Enterprise St Se-Richland-99352', '509-595-6485', '$2a$08$LqSSdvdPC/ftwutNBgIyG.jX8hEswgmjvA2.PX4g2mqalvyjIy.MW', 2, '2022-07-27', 'ME', ''),
('f9000b6a-f8a5-41b2-baf2-71af64721269', 'Tamar Hoogland', 'Male', '2000-03-20', 'tamar@hotmail.com', '2737 Pistorio Rd #9230-London-43140', '740-526-5410', '$2a$08$wM3BZjHVOpKR5cYR4h.zl.n5f5rXJsXxnzM608UQw66LEkveadbZu', 1, '2022-07-27', 'CSE', ''),
('f9130e05-d66d-4902-a7c9-04f9df273580', 'Alishia Sergi', 'Male', '2000-02-08', 'asergi@gmail.com', '2742 Distribution Way-New York-10025', '212-753-2740', '$2a$08$wEU.C.z8rAazixBvZ7.fK.QDZfDii8J07B19WDDTEAmiuYVj60WR.', 2, '2022-07-27', 'ECE', ''),
('f924b62f-6934-4132-a67b-4cdedf3c0589', 'Gladys Rim', 'Female', '2000-01-19', 'gladys.rim@rim.org', '322 New Horizon Blvd-Milwaukee-53207', '414-377-2880', '$2a$08$vtmMpzL2r42k1xqIjeWLl.GQLfBchHcoB7Vh5l8Rntn.uqedqjiOi', 1, '2022-07-27', 'ECE', ''),
('f9283fc1-8189-4f4d-99bb-1b29bb891250', 'Loreta Timenez', 'Male', '2001-01-01', 'loreta.timenez@hotmail.com', '47857 Coney Island Ave-Clinton-20735', '301-392-6698', '$2a$08$zT4A7lIXvN6VElcpeBXKwuQL1t8x6QYwXR2.Pbw5FSycqEwhIHmcq', 1, '2022-07-27', 'MPAE', ''),
('f9373b4f-fd5e-4164-afa8-52c6b2057f27', 'Allene Iturbide', 'Male', '2000-01-27', 'allene_iturbide@cox.net', '1 Central Ave-Stevens Point-54481', '715-530-9863', '$2a$08$itxryf/hinrb9TbbNpB.6OqodUzQT3dQBwDX0x.E1dfPkCep3Y1Y.', 2, '2022-07-27', 'ECE', ''),
('f9762174-747b-4c8e-8b6b-a92d783fc2ec', 'Delmy Ahle', 'Male', '2000-03-04', 'delmy.ahle@hotmail.com', '65895 S 16th St-Providence-2909', '401-559-8961', '$2a$08$25bVyqz3gSmX/uvdUh5hQOJDcPjwOrpdvi7t1hUcP464pw4SBxiPu', 3, '2022-07-27', 'ECE', ''),
('f9a1ca7b-bc0d-48ad-ae65-dc5030f3cc3a', 'Mitsue Tollner', 'Male', '2000-01-08', 'mitsue_tollner@yahoo.com', '7 Eads St-Chicago-60632', '773-924-8565', '$2a$08$8rIsWxwszvX.ShRWIUcpX.lmSlCrOf3SwBr2obDhN1rAbr2sme6O6', 1, '2022-07-27', 'ECE', ''),
('fa7a73f1-dc33-4f9f-b8e9-c9f0938d4eae', 'Olive Matuszak', 'Female', '2000-11-25', 'olive@aol.com', '13252 Lighthouse Ave-Cathedral City-92234', '760-745-2649', '$2a$08$UJlmS78MjJWj4pe2XwL.0Obq5p7sBA.kJFCDbYG6ZwdHvM0.iUAZq', 1, '2022-07-27', 'MPAE', ''),
('fae83764-b30d-4324-bb14-29f072bcfbbc', 'Fannie Lungren', 'Male', '2000-06-28', 'fannie.lungren@yahoo.com', '17 Us Highway 111-Round Rock-78664', '512-528-9933', '$2a$08$7nmTIVJpUvLx4KtzfDLYze1/owztBKtTCa6DwGnSPmxbB.drTWR8i', 3, '2022-07-27', 'ICE', ''),
('fb782e82-2fd3-41e2-b428-6145ee26c47e', 'Ernest Syrop', 'Male', '2001-02-07', 'ernest@cox.net', '94 Chase Rd-Hyattsville-20785', '301-257-4883', '$2a$08$pyBkRhgqGN7IAyKhHFuBFOTE74/NF2kKeGyjixyramD.Btn8DU/Pa', 3, '2022-07-27', 'MPAE', ''),
('fc779995-80fd-4db3-adca-30cfe539dae8', 'Arthur Farrow', 'Female', '2001-04-16', 'arthur.farrow@yahoo.com', '28 S 7th St #2824-Englewood-7631', '201-772-4377', '$2a$08$LphT3gvsZ2FR7ouFQ3JLMONAqGUvYHvPVz34wdnEZO./hcPFMTcz6', 3, '2022-07-27', 'ME', ''),
('fd7c4be2-f4aa-4ac4-81fb-b1c70874884f', 'Francine Vocelka', 'Female', '2000-02-05', 'francine_vocelka@vocelka.com', '366 South Dr-Las Cruces-88011', '505-335-5293', '$2a$08$DaBcjhmg2z4EvujT9Eu5bexIaHemm0ZzwgcEydHmkzftGq7X6Nh2.', 2, '2022-07-27', 'ECE', ''),
('fd7f72ec-4003-4aa1-8e1c-e795b95bb75f', 'Joesph Degonia', 'Female', '2000-07-10', 'joesph_degonia@degonia.org', '2887 Knowlton St #5435-Berkeley-94710', '510-942-5916', '$2a$08$NSQhvMYMVpZ/eloMlEpEE.1UY3TOFR3kkax89L7Uswm1TIl8cUvNO', 3, '2022-07-27', 'ICE', ''),
('ff5ea616-36d0-4c10-b996-e4329012454f', 'Portia Stimmel', 'Female', '2000-09-27', 'portia.stimmel@aol.com', '3732 Sherman Ave-Bridgewater-8807', '908-670-4712', '$2a$08$VHMBRsm1E5vgWfeKXR5Ow.0Noy2A12QL4ufDmMuZbQlovthEBo0KK', 1, '2022-07-27', 'BT', ''),
('ffb07613-1028-4a84-ba9f-390cac15ec5f', 'Hillary Skulski', 'Female', '2000-07-19', 'hillary.skulski@aol.com', '9 Wales Rd Ne #914-Homosassa-34448', '352-990-5946', '$2a$08$RmbE.lWYRpYG7BU4dU9BMOC08JPQacI5CAT0b5q9Js8KlMm.Lub16', 1, '2022-07-27', 'IT', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`asg_id`),
  ADD KEY `assignment_fk0` (`class_id`);

--
-- Indexes for table `assignment_question`
--
ALTER TABLE `assignment_question`
  ADD PRIMARY KEY (`asg_id`,`q_id`),
  ADD KEY `assignment_question_ibfk_2` (`q_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`s_id`,`c_id`,`date`),
  ADD KEY `attendance_fk1` (`c_id`);

--
-- Indexes for table `chapter`
--
ALTER TABLE `chapter`
  ADD PRIMARY KEY (`chapter_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`),
  ADD UNIQUE KEY `class_id` (`class_id`),
  ADD KEY `class_fk0` (`c_id`),
  ADD KEY `class_fk1` (`st_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `c_id` (`c_id`),
  ADD KEY `course_fk0` (`dept_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`),
  ADD UNIQUE KEY `dept_id` (`dept_id`),
  ADD UNIQUE KEY `d_name` (`d_name`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`q_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `asg_id` (`asg_id`),
  ADD KEY `s_id` (`s_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`st_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `staff_fk0` (`dept_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`s_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `student_fk0` (`dept_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `asg_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `chapter`
--
ALTER TABLE `chapter`
  MODIFY `chapter_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `q_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `result_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignment`
--
ALTER TABLE `assignment`
  ADD CONSTRAINT `assignment_fk0` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assignment_question`
--
ALTER TABLE `assignment_question`
  ADD CONSTRAINT `assignment_question_ibfk_1` FOREIGN KEY (`asg_id`) REFERENCES `assignment` (`asg_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assignment_question_ibfk_2` FOREIGN KEY (`q_id`) REFERENCES `question` (`q_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_fk0` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_fk1` FOREIGN KEY (`c_id`) REFERENCES `course` (`c_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `chapter`
--
ALTER TABLE `chapter`
  ADD CONSTRAINT `chapter_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_fk0` FOREIGN KEY (`c_id`) REFERENCES `course` (`c_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `class_fk1` FOREIGN KEY (`st_id`) REFERENCES `staff` (`st_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_fk0` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`asg_id`) REFERENCES `assignment` (`asg_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `result_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_fk0` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_fk0` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
