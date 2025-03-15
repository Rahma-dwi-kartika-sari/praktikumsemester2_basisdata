-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2025 at 03:44 PM
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
-- Database: `dbms11_2410506008`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbgaji`
--

CREATE TABLE `tbgaji` (
  `gol` int(1) NOT NULL,
  `gapok` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbgaji`
--

INSERT INTO `tbgaji` (`gol`, `gapok`) VALUES
(1, 1500000),
(2, 2000000),
(3, 3500000),
(4, 5000000);

-- --------------------------------------------------------

--
-- Table structure for table `tbpegawai`
--

CREATE TABLE `tbpegawai` (
  `nip` varchar(5) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `kota` varchar(15) NOT NULL,
  `thn_masuk` year(4) NOT NULL,
  `gol` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbpegawai`
--

INSERT INTO `tbpegawai` (`nip`, `nama`, `tgl_lahir`, `kota`, `thn_masuk`, `gol`) VALUES
('1', 'Ahmad Burhanuddin', '0000-00-00', 'Bandung', '2010', 3),
('10', 'Agus Wisman', '0000-00-00', 'Garut', '2010', 3),
('2', 'Amin Insyorry', '0000-00-00', 'Ciamis', '2009', 2),
('3', 'Budhy Bungaox', '0000-00-00', 'Tasikmalaya', '2011', 4),
('4', 'Zulkarnaen', '0000-00-00', 'Bandung', '2009', 1),
('5', 'Dewi Sudewa', '0000-00-00', 'Bogor', '2009', 1),
('6', 'Ina Nurlian', '0000-00-00', 'Sumedang', '2011', 4),
('7', 'Cheppy Chardut', '0000-00-00', 'Garut', '2011', 4),
('8', 'Dodong M', '0000-00-00', 'Bandung', '2010', 3),
('9', 'Gandung P', '0000-00-00', 'Bogor', '2009', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbpegawai`
--
ALTER TABLE `tbpegawai`
  ADD PRIMARY KEY (`nip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
