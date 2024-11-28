-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 28 Nov 2024 pada 07.45
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
-- Struktur dari tabel `oc_affiliate_notifikasi_user`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_notifikasi_user` (
  `id_affiliate_notifikasi_user` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `id_affiliate_pengeluaran` int(11) NOT NULL,
  `id_affiliate_pemasukan` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `keterangan` text NOT NULL,
  `link` text NOT NULL,
  `status_baca` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `oc_affiliate_notifikasi_user`
--

INSERT INTO `oc_affiliate_notifikasi_user` (`id_affiliate_notifikasi_user`, `affiliate_id`, `id_affiliate_pengeluaran`, `id_affiliate_pemasukan`, `tanggal`, `keterangan`, `link`, `status_baca`) VALUES
(1, 1, 0, 1, '2024-11-24 09:47:00', 'Pembayaran Komisi  #10301', 'https://gudangmaterials.id/index.php?route=affiliate/detailsaldomasuk&id_status=1', 1),
(2, 1, 1, 0, '2024-11-25 11:40:00', 'Penarikan 10.000 Berhasil', 'https://gudangmaterials.id/index.php?route=affiliate/statuspenarikan&id_status=1', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oc_affiliate_notifikasi_user`
--
ALTER TABLE `oc_affiliate_notifikasi_user`
  ADD PRIMARY KEY (`id_affiliate_notifikasi_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oc_affiliate_notifikasi_user`
--
ALTER TABLE `oc_affiliate_notifikasi_user`
  MODIFY `id_affiliate_notifikasi_user` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
