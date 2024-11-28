-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 28 Nov 2024 pada 04.57
-- Versi Server: 5.6.51
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gdmmaster`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `oc_affiliate_pengeluaran`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_pengeluaran` (
  `id_affiliate_pengeluaran` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal` varchar(100) NOT NULL,
  `tanggal_pencairan` datetime NOT NULL,
  `status_penarikan` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `oc_affiliate_pengeluaran`
--

INSERT INTO `oc_affiliate_pengeluaran` (`id_affiliate_pengeluaran`, `affiliate_id`, `jumlah`, `keterangan`, `tanggal`, `tanggal_pencairan`, `status_penarikan`) VALUES
(1, 1, 10000, 'Penarikan Komisi', '2024-11-25 15:36:04', '2024-11-28 09:14:00', 2),
(3, 1, 11000, 'Penarikan Komisi', '2024-11-26 10:28:58', '0000-00-00 00:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oc_affiliate_pengeluaran`
--
ALTER TABLE `oc_affiliate_pengeluaran`
  ADD PRIMARY KEY (`id_affiliate_pengeluaran`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oc_affiliate_pengeluaran`
--
ALTER TABLE `oc_affiliate_pengeluaran`
  MODIFY `id_affiliate_pengeluaran` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
