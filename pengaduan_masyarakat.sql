-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2023 at 08:12 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengaduan_masyarakat`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(2, 'Anak Jalanan'),
(4, 'Anak Sekolah Bolos (ANSEBOL)'),
(5, 'Bencana'),
(6, 'Pengemis'),
(7, 'Keagamaan'),
(8, 'Masyarakat, Aparatur & Badan Hukum'),
(9, 'Orang Dalam Gangguan Jiwa'),
(10, 'Pengamanan Aset Negara'),
(11, 'Penegakan PERDA'),
(13, 'Pungutan Liar (Pungli)');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `level` enum('masyarakat','petugas','admin') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id_login`, `email`, `password`, `level`) VALUES
(1, 'admin@gmail.com', '$2y$10$fxaQOxPocYskneYwzuPZH.M5iH/imvW8F0T8uMMTwPR0GneAE0woS', 'admin'),
(26, 'peleton1@gmail.com', '$2y$10$yYhgTBoHMR4udb3Vt3vwQO/IoM3n7aGYmtKfxnY.2PYXZWcMg7Szm', 'petugas'),
(27, 'peleton2@gmail.com', '$2y$10$FVRdyKmVRMMVH0WqRvD29evncdokfFdd89FgwBXg4wdwyLZixFcey', 'petugas'),
(28, 'peleton3@gmail.com', '$2y$10$zd3AFqBvIrWU9WR4T3tojuNRy/pIboyypMbaF118TXpMdMS0hBnMe', 'petugas'),
(29, 'gakda@gmail.com', '$2y$10$JejLZmsFuVbIVp2HTL2ise83z.asXgm76YTzAMsxrCZdIPkdV/LA2', 'petugas'),
(30, 'linmas@gmail.com', '$2y$10$eOPyt37CEzKVuXJc/JYGtOxnVZJ5iPLy4Ewgsk/0CcoUXXplGfoEO', 'petugas'),
(32, 'masyarakat@gmail.com', '$2y$10$PWx9qQ1VYR9izAgrl0KcquUUndjLxr5y6tztyNg7BafdMKlZSN6nG', 'masyarakat'),
(33, 'ervinaa@gmail.com', '$2y$10$XqdeLsXNNQtu7Qg.j5xVYeup4./qsyrQoyQ7n2W0.rGXrpuaJNoCy', 'petugas'),
(34, 'ervina@gmail.com', '$2y$10$2FMUyHLnoSdk/JU6Htwqyexr5CCMU5RS8MIVObxhI/Ep5xTuiSdva', 'masyarakat'),
(35, 'sherly@gmail.com', '$2y$10$V.f9p3c99Ka7Lsq7.chA9./NO4fnM4Xw8F8EPZq7cbSBj5ba.Gd2m', 'masyarakat'),
(36, 'silvy@gmail.com', '$2y$10$K.FoGmymMjM1FSAeE.v/fOyqmWh2B/aB7SLgGN.VOXt7X92nY6PUa', 'masyarakat');

-- --------------------------------------------------------

--
-- Table structure for table `masyarakat`
--

CREATE TABLE `masyarakat` (
  `nik` varchar(16) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `telp` varbinary(13) DEFAULT NULL,
  `id_login` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `masyarakat`
--

INSERT INTO `masyarakat` (`nik`, `nama`, `telp`, `id_login`) VALUES
('12345', 'Masyarakat', 0x31, 32),
('453347600003', 'Silvy Oktaviani', 0x303839333435383736393233, 36),
('665243160005', 'Sherly Nabila Adha', 0x303832313334353637363534, 35),
('87536200005', 'Ervina Dwi Andyarini', 0x30383932313334353637363534, 34);

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `tanggal_pengaduan` date DEFAULT NULL,
  `isi_pengaduan` text DEFAULT NULL,
  `file` varchar(50) DEFAULT NULL,
  `status` enum('pending','proses','approved','selesai') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `id_kategori`, `nik`, `tanggal_pengaduan`, `isi_pengaduan`, `file`, `status`) VALUES
(28, 5, '87536200005', '2022-12-01', 'Telah terjadi kebakaran di pasar Garut', 'default.jpg', 'selesai'),
(29, 9, '665243160005', '2022-12-05', 'Ada ODGJ yang mengamuk dan mengganggu Masyarakat, di pengkolan Garut Kota', '1671117246.jpg', 'selesai'),
(30, 2, '453347600003', '2022-12-08', 'Ada anak jalanan yang mabuk di bunderan Leuwidaun', '1671117944.jpg', 'selesai'),
(31, 4, '12345', '2022-12-16', 'Terdapat kumpulan anak bolos di Alun-Alun Garut', '1671178182.jpg', 'proses');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(50) DEFAULT NULL,
  `telp` varchar(13) DEFAULT NULL,
  `id_login` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `telp`, `id_login`) VALUES
(10, 'Peleton 1', '085220666168', 26),
(11, 'Peleton 2', '082116964860', 27),
(12, 'Peleton 3', '085921004866', 28),
(13, 'Gakda', '081385630701', 29),
(14, 'Satgas Linmas', '085324069698', 30);

-- --------------------------------------------------------

--
-- Table structure for table `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(11) NOT NULL,
  `id_pengaduan` int(11) DEFAULT NULL,
  `id_petugas` int(11) DEFAULT NULL,
  `tanggal_tanggapan` date DEFAULT NULL,
  `isi_tanggapan` text DEFAULT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_pengaduan`, `id_petugas`, `tanggal_tanggapan`, `isi_tanggapan`, `foto`) VALUES
(17, 25, 10, '2022-11-07', 'Kejadian sudah selesai ditangani dan anak-anak telah diserahkan ke sekolah.', '1667794539.jpg'),
(18, 26, 10, NULL, NULL, 'default.jpg'),
(19, 27, 10, NULL, NULL, 'default.jpg'),
(20, 28, 10, '2022-12-15', 'Telah selesai di tangani', '1671116636.jpg'),
(21, 29, 11, '2022-12-15', 'ODGJ telah diamankan', '1671117469.jpg'),
(22, 30, 11, '2022-12-15', 'Selesai ditangani', '1671118026.jpg'),
(23, 31, 11, NULL, NULL, 'default.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indexes for table `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
