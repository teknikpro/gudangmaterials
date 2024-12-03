-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 03 Des 2024 pada 02.28
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
-- Struktur dari tabel `oc_affiliate`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `provinsi` varchar(100) NOT NULL,
  `admin` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `oc_affiliate`
--

INSERT INTO `oc_affiliate` (`affiliate_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `company`, `website`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `code`, `commission`, `tax`, `payment`, `cheque`, `paypal`, `bank_name`, `bank_branch_number`, `bank_swift_code`, `bank_account_name`, `bank_account_number`, `ip`, `status`, `approved`, `date_added`, `provinsi`, `admin`) VALUES
(1, 'kiki', 'agustin', 'threadlightid@gmail.com', '081331649928', '', '2778efb4e5a7d972c3dce7311fb204d1c2a42b41', 'Cd8pphdd4', '', '', 'Jl. Tebet Utara 1 No 7', '', 'Jakarta Selatan', '40383', 100, 115, '5f2bc8c01b14c', '5.00', '', 'bank', '', '', 'BCA', 'Moh Toha', 'CENAIDJA', 'Kiki Agustin', '6566554', '125.163.31.221', 1, 1, '2020-08-06 09:09:20', 'Jawa Barat', 1),
(2, 'Stacy', 'Keibler', 'stacykeibler001@gmail.com', '0983189078', '84983189078', '277265379867a9767ba297ce08cb7f329bcbd339', 'bCWnJovrT', 'Victory', 'https://couponupto.com/', 'Union Street, union street', '', 'Eureka', '90001', 223, 3624, '5f32659f735fd', '5.00', '', 'paypal', '', 'stacykeibler001@gmail.com', '', '', '', '', '', '27.79.164.21', 1, 1, '2020-08-11 09:32:15', '', 0),
(3, 'Chairul ', 'Sabri', 'csofficer79@gmail.com', '082246823832', '', '9bc60077a0f439ebb8ae2b0023c7650d48341f27', 'GMvZEjIbE', '', '', 'Bunga Rampai 7 gang 4 No. 126 Rt. 016/006 Prumnas Klender Jakarta Timur 13460', '', 'Prumnas Klender', '13460', 100, 1513, '5f93e73eaf994', '5.00', '', 'bank', '', '', 'BCA', '', '', 'Chairul Sabri', '2302383635', '180.242.231.218', 1, 1, '2020-10-24 08:35:10', '', 0),
(4, 'Imam', 'Baihaki', 'imam.baihaki@outlook.com', '+6282338593610', '', 'dfed268138cd3f6d9c19f4234494a13c830b0e4a', 'luZ047Pz9', 'Desain Rumah Inspiratif', 'https://www.facebook.com/Designrumahinspiratif', 'Jl. Sunan Prapen 4E no 3, Gresik, Jawa TImur', '', 'Gresik', '61161', 100, 1517, '5f99545b0a0c0', '5.00', '94.397.670.4-612.000', 'bank', '', '', 'BCA', '0147900', 'CENAIDJA', 'Imam Baihaki', '7900603228', '36.88.247.173', 1, 1, '2020-10-28 11:22:03', '', 0),
(5, 'Beny Amirulah', 'Basyori', 'benydreams@gmail.com', '+6282131080758', '', '71aae12da04d46b2b6693b43178296118bfd05a8', '43JfbeWKl', '-', 'https://nusantaragenteng.com', 'Karang Gayam 1 No.41b', '', 'Surabaya', '60136', 100, 1517, '605cb3656e37e', '5.00', '', 'paypal', 'Beny Amirulah Basyori', '', '', '', '', '', '', '36.68.222.96', 1, 1, '2021-03-25 22:59:33', '', 0),
(10, 'Dadang', 'Saepuloh', 'onlinekiki008@gmail.com', '083765566765', '', '0cfefc5702969980d58f8c1b24596aaa9fda0f91', '3QUJqqshX', '', '', 'Jl Pik No. 5 Bandug Utara Barat', '', 'Bandung', '40383', 100, 115, '67492e81e6d13', '5.00', '', 'bank', '', '', '', '', '', '', '', '125.163.31.221', 1, 1, '2024-11-29 10:01:21', 'Jawa Barat', 0),
(8, 'userdummy', 'tester', 'cscenter@aplikasibisnis.web.id', '085294418667', '', '5c0fc2447e3b4b23226f178b0ba31697a05848bd', 'nnrBx8Bfq', '', '', 'Jl.Sudirman No. 123', '', 'Bandung', '', 100, 1515, '673821acf0510', '5.00', '', 'bank', '', '', '', '', '', '', '', '114.122.73.194', 1, 1, '2024-11-16 11:38:04', 'Jawa Barat', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  ADD PRIMARY KEY (`affiliate_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  MODIFY `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
