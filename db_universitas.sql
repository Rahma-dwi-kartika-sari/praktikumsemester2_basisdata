-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2025 at 08:43 PM
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
-- Database: `db_universitas`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_mhs_simple` ()   BEGIN
    SELECT NPM, nama, no_hp
    FROM mahasiswa;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `tambah` (`angka1` INT, `angka2` INT) RETURNS INT(11)  BEGIN
  RETURN angka1 + angka2;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_brg` char(4) NOT NULL,
  `nama_brg` varchar(20) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_brg`, `nama_brg`, `stok`) VALUES
('A10', 'Mouse', 30),
('A11', 'Keyboard', 15),
('A12', 'DVD R-W', 10),
('A13', 'Modem', 6);

--
-- Triggers `barang`
--
DELIMITER $$
CREATE TRIGGER `auditBarang` BEFORE INSERT ON `barang` FOR EACH ROW BEGIN
    IF NOT EXISTS (SELECT id_brg FROM barang WHERE id_brg = NEW.id_brg) THEN
        SET NEW.nama_brg = NEW.nama_brg,
            NEW.stok = NEW.stok;
    ELSE
        SET @status = CONCAT('ID ', NEW.id_brg, ' sudah ada');
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `deleteChild` AFTER DELETE ON `barang` FOR EACH ROW DELETE FROM pembelian
WHERE id_brg = OLD.id_brg
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NPM` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `id_kelurahan` int(3) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `kode_prodi` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NPM`, `nama`, `alamat`, `id_kelurahan`, `jenis_kelamin`, `no_hp`, `kode_prodi`) VALUES
(12345, 'Imam Adi Nata', 'Kajen', 1, 'L', '081215259899', '1'),
(12346, 'Budi Sugandhi', 'Bekasi', 109, 'L', '085643433321', '2'),
(12347, 'Toha Sitohang', 'Medan', 103, 'L', '08989787876', '2'),
(12348, 'Megawati', 'Condong Catur', 107, 'P', '0839303058', '1'),
(12349, 'PRABOWO SUBIYANTO', 'JKT', 107, 'L', '08132809811', NULL),
(12780, 'Anis Baswedan', 'Jakarta', 234, 'L', '08988877663', NULL),
(12786, 'GANJAR PRANOWO', 'JAWA TENGAH', 123, 'L', '087656366622', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pem` int(11) NOT NULL,
  `id_brg` char(4) DEFAULT NULL,
  `jml_beli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pem`, `id_brg`, `jml_beli`) VALUES
(3, 'A10', 20);

--
-- Triggers `pembelian`
--
DELIMITER $$
CREATE TRIGGER `updateStok` AFTER INSERT ON `pembelian` FOR EACH ROW UPDATE barang
SET stok = stok + NEW.jml_beli
WHERE id_brg = NEW.id_brg
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateStokEdit` AFTER UPDATE ON `pembelian` FOR EACH ROW UPDATE barang
SET stok = stok + (NEW.jml_beli - OLD.jml_beli)
WHERE id_brg = NEW.id_brg
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NPM`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pem`),
  ADD KEY `id_brg` (`id_brg`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
