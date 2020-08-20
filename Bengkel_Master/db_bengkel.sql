-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Agu 2020 pada 13.03
-- Versi server: 10.1.36-MariaDB
-- Versi PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bengkel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_service`
--

CREATE TABLE `detail_service` (
  `kd_sparepart` varchar(21) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `no_faktur` varchar(21) NOT NULL,
  `ongkos` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `id_login` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`username`, `password`, `email`, `status`, `id_login`) VALUES
('admin', 'admin', 'ari@mail.com', 'Owner', 'KD0001'),
('ari', 'ari', 'ari', 'ari', 'KD0002'),
('aaa', 'aaa', 'aaa', 'aaa', 'KD0003'),
('aa', 'a', 'a', 'a', 'KD0004'),
('juni', 'juni', 'email', 'status', 'KD0008');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mekanik`
--

CREATE TABLE `mekanik` (
  `kd_mekanik` varchar(21) NOT NULL,
  `nama_mekanik` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mekanik`
--

INSERT INTO `mekanik` (`kd_mekanik`, `nama_mekanik`, `alamat`, `no_telp`) VALUES
('M0001', 'ari', 'jl.gelatik', 899999);

-- --------------------------------------------------------

--
-- Struktur dari tabel `motor_service`
--

CREATE TABLE `motor_service` (
  `no_faktur` varchar(21) NOT NULL,
  `tanggal` date NOT NULL,
  `kd_pelanggan` varchar(21) NOT NULL,
  `kd_mekanik` varchar(21) NOT NULL,
  `no_plat` varchar(21) NOT NULL,
  `keluhan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `kd_pelanggan` varchar(21) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`kd_pelanggan`, `nama_pelanggan`, `alamat`, `no_telp`) VALUES
('PL0001', 'ari', 'jl			', 9),
('PL0002', 'paijo', 'a', 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sparepart`
--

CREATE TABLE `sparepart` (
  `kd_sparepart` varchar(21) NOT NULL,
  `nama_sparepart` varchar(21) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `ongkos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sparepart`
--

INSERT INTO `sparepart` (`kd_sparepart`, `nama_sparepart`, `harga`, `stok`, `ongkos`) VALUES
('SP0001', 'aa', 9000, 9, 90);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indeks untuk tabel `mekanik`
--
ALTER TABLE `mekanik`
  ADD PRIMARY KEY (`kd_mekanik`);

--
-- Indeks untuk tabel `motor_service`
--
ALTER TABLE `motor_service`
  ADD PRIMARY KEY (`no_faktur`),
  ADD KEY `kd_pelanggan` (`kd_pelanggan`),
  ADD KEY `kd_mekanik` (`kd_mekanik`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kd_pelanggan`);

--
-- Indeks untuk tabel `sparepart`
--
ALTER TABLE `sparepart`
  ADD PRIMARY KEY (`kd_sparepart`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `motor_service`
--
ALTER TABLE `motor_service`
  ADD CONSTRAINT `motor_service_ibfk_1` FOREIGN KEY (`kd_pelanggan`) REFERENCES `pelanggan` (`kd_pelanggan`),
  ADD CONSTRAINT `motor_service_ibfk_2` FOREIGN KEY (`kd_mekanik`) REFERENCES `mekanik` (`kd_mekanik`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
