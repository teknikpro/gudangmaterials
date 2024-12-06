-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 06 Des 2024 pada 07.38
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
-- Struktur dari tabel `oc_affiliate_notifikasi_admin`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_notifikasi_admin` (
  `id_notifikasi_admin` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `keterangan` text NOT NULL,
  `link` text NOT NULL,
  `status_baca` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `oc_affiliate_notifikasi_admin`
--

INSERT INTO `oc_affiliate_notifikasi_admin` (`id_notifikasi_admin`, `tanggal`, `keterangan`, `link`, `status_baca`) VALUES
(1, '2024-12-06 08:00:00', 'Verifikasi Afiliator', 'https://gudangmaterials.id/index.php?route=adminaffiliate/verifikasi&affiliate_id=10&status_notif=1', 1),
(2, '2024-12-06 14:14:42', 'verifikasi afiliator', 'https://gudangmaterials.id/index.php?route=adminaffiliate/verifikasi&affiliate_id=13&status_notif=2', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oc_affiliate_notifikasi_admin`
--
ALTER TABLE `oc_affiliate_notifikasi_admin`
  ADD PRIMARY KEY (`id_notifikasi_admin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oc_affiliate_notifikasi_admin`
--
ALTER TABLE `oc_affiliate_notifikasi_admin`
  MODIFY `id_notifikasi_admin` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
