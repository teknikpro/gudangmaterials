-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 05 Des 2024 pada 08.38
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
  `tanggal` datetime NOT NULL,
  `tanggal_pencairan` datetime NOT NULL,
  `status_penarikan` int(11) NOT NULL,
  `bukti_transfer` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `oc_affiliate_pengeluaran`
--

INSERT INTO `oc_affiliate_pengeluaran` (`id_affiliate_pengeluaran`, `affiliate_id`, `jumlah`, `keterangan`, `tanggal`, `tanggal_pencairan`, `status_penarikan`, `bukti_transfer`) VALUES
(1, 1, 20000, 'Penarikan Komisi', '2024-11-29 09:57:42', '2024-12-05 14:34:34', 2, 'transfer_6751578a190ce8.60823709.png');

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
  MODIFY `id_affiliate_pengeluaran` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
