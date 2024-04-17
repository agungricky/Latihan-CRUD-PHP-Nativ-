-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Apr 2024 pada 08.12
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skema_rr`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `Username` varchar(45) COLLATE utf8_bin NOT NULL,
  `Password` varchar(100) COLLATE utf8_bin NOT NULL,
  `Status` enum('Pengajar','Siswa') COLLATE utf8_bin NOT NULL,
  `Pengajar_idPengajar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`Username`, `Password`, `Status`, `Pengajar_idPengajar`) VALUES
('ricky', 'b575a1d730d4abbcf28ec651f61d0e9e', 'Pengajar', 1),
('ika', 'b575a1d730d4abbcf28ec651f61d0e9e', 'Pengajar', 2),
('afan', 'cd8b17db80f8efb1d75fb68d4e56131e', 'Pengajar', 3),
('aris', 'b575a1d730d4abbcf28ec651f61d0e9e', 'Pengajar', 4),
('fahmi', 'b575a1d730d4abbcf28ec651f61d0e9e', 'Pengajar', 5),
('resandi', 'b575a1d730d4abbcf28ec651f61d0e9e', 'Pengajar', 6),
('lutfi', 'b575a1d730d4abbcf28ec651f61d0e9e', 'Pengajar', 7),
('faisal', 'b575a1d730d4abbcf28ec651f61d0e9e', 'Pengajar', 8),
('julian', '806bc0812a1539ba85340d65423b493d', 'Pengajar', 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi_pembelajaran`
--

CREATE TABLE `materi_pembelajaran` (
  `idMateri_Pembelajaran` int(11) NOT NULL,
  `Materi` varchar(50) COLLATE utf8_bin NOT NULL,
  `Kategory` enum('TIK','MEKER') COLLATE utf8_bin NOT NULL,
  `Level` enum('Mudah','Menengah','Sulit') COLLATE utf8_bin NOT NULL,
  `Jumlah_pertemuan` int(2) NOT NULL,
  `Pengajar_idPengajar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `materi_pembelajaran`
--

INSERT INTO `materi_pembelajaran` (`idMateri_Pembelajaran`, `Materi`, `Kategory`, `Level`, `Jumlah_pertemuan`, `Pengajar_idPengajar`) VALUES
(1, 'Robot Remote', 'MEKER', 'Mudah', 8, 8),
(2, 'Robot Avoider', 'MEKER', 'Mudah', 4, 7),
(3, 'Robot Line Follower', 'MEKER', 'Mudah', 4, 2),
(4, 'Robot Remote Capit', 'MEKER', 'Mudah', 8, 3),
(5, 'Robot Amvibi', 'MEKER', 'Mudah', 4, 4),
(11, 'Pemrograman Pictoblox - Hadware', 'TIK', 'Mudah', 8, 1),
(12, 'Pemrograman Pictoblox - Hadware 2', 'TIK', 'Menengah', 8, 1),
(13, 'Pemrograman Pictoblox - Hadware 3', 'TIK', 'Sulit', 8, 5),
(14, 'Game Screach', 'TIK', 'Mudah', 8, 6),
(15, 'Game Screach 2', 'TIK', 'Menengah', 8, 5),
(16, 'Arduino Hadware', 'TIK', 'Mudah', 8, 7),
(17, 'Arduino Hadware 2', 'TIK', 'Menengah', 8, 7),
(18, 'Arduino Hadware 3', 'TIK', 'Sulit', 8, 5),
(19, 'ESP', 'TIK', 'Sulit', 8, 5),
(20, 'Pemrograman Python', 'TIK', 'Sulit', 16, 9),
(21, 'Pemrograman C++', 'TIK', 'Sulit', 16, 4),
(22, 'Pemrograman HTML, CSS, JavaScript', 'TIK', 'Sulit', 16, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajar`
--

CREATE TABLE `pengajar` (
  `idPengajar` int(11) NOT NULL,
  `Nama` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Alamat` varchar(200) COLLATE utf8_bin NOT NULL,
  `Jenis_kelamin` enum('Pria','Wanita') COLLATE utf8_bin NOT NULL,
  `Email` varchar(45) COLLATE utf8_bin NOT NULL,
  `No_hp` varchar(12) COLLATE utf8_bin NOT NULL,
  `Created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `Updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `pengajar`
--

INSERT INTO `pengajar` (`idPengajar`, `Nama`, `Alamat`, `Jenis_kelamin`, `Email`, `No_hp`, `Created_at`, `Updated_at`) VALUES
(1, 'Ricky', 'Nganjuk Ladang', 'Pria', 'agungricky07@gmail.com', '08127643611', '2024-03-27 14:49:21', '2024-04-17 12:42:37'),
(2, 'Ika', 'Pare', 'Wanita', 'ikadaniati26@gmail.com', '08133098281', '2024-03-28 10:28:59', '2024-04-16 10:43:50'),
(3, 'Afan', 'Kepung', 'Pria', 'zainafan@gmail.com', '08173881911', '2024-03-28 10:28:59', '2024-03-28 10:28:59'),
(4, 'Aris', 'Tulungagung', 'Pria', 'arismahmudi@gmail.com', '08571728199', '2024-03-28 10:28:59', '2024-03-28 10:28:59'),
(5, 'Fahmi', 'Kediri', 'Pria', 'fahmi@gmail.com', '0827382922', '2024-03-28 10:28:59', '2024-04-16 12:15:37'),
(6, 'Resandi', 'Tulungagung', 'Pria', 'resandi@gmail.com', '08136382', '2024-03-28 10:28:59', '2024-03-28 10:28:59'),
(7, 'Lutfi', 'Kediri', 'Pria', 'lutfi007@gmail.com', '08988392999', '2024-03-28 10:28:59', '2024-03-28 10:28:59'),
(8, 'Faisal', 'Kediri', 'Pria', 'faisal@gmail.com', '0897363332', '2024-03-28 10:28:59', '2024-03-28 10:28:59'),
(9, 'Julian', 'Tulungagung', 'Pria', 'julian@gmail.com', '08273829211', '2024-03-28 10:30:46', '2024-04-17 12:43:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pertemuan_pembelajaran`
--

CREATE TABLE `pertemuan_pembelajaran` (
  `idPembelajaran` int(11) NOT NULL,
  `Tanggal` date NOT NULL,
  `Deskripsi` varchar(100) COLLATE utf8_bin NOT NULL,
  `Pengajar_idPengajar` int(11) NOT NULL,
  `Materi_Pembelajaran_idMateri_Pembelajaran` int(11) NOT NULL,
  `Siswa_idSiswa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `pertemuan_pembelajaran`
--

INSERT INTO `pertemuan_pembelajaran` (`idPembelajaran`, `Tanggal`, `Deskripsi`, `Pengajar_idPengajar`, `Materi_Pembelajaran_idMateri_Pembelajaran`, `Siswa_idSiswa`) VALUES
(1, '2024-03-28', 'Pembelajaran Pengenalan HTML Dasar', 1, 22, 1),
(2, '2024-03-28', 'Finishing Robot Remote', 8, 1, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sertifikat_pembelajaran`
--

CREATE TABLE `sertifikat_pembelajaran` (
  `idSertifikat_pembelajaran` int(11) NOT NULL,
  `No_Sertivikat` varchar(45) COLLATE utf8_bin NOT NULL,
  `Keterangan` varchar(45) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Pertemuan_Pembelajaran_idPembelajaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `sertifikat_pembelajaran`
--

INSERT INTO `sertifikat_pembelajaran` (`idSertifikat_pembelajaran`, `No_Sertivikat`, `Keterangan`, `created_at`, `updated_at`, `Pertemuan_Pembelajaran_idPembelajaran`) VALUES
(1, '2024/III/28 - Kediri', 'LULUS DENGAN BAIK', '2024-03-28 13:11:20', '2024-03-28 13:11:20', 1),
(2, '2024/III/28/II - Kediri', 'LULUS DENGAN BAIK', '2024-03-28 15:37:37', '2024-03-28 15:38:52', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `idSiswa` int(11) NOT NULL,
  `Nama` varchar(50) COLLATE utf8_bin NOT NULL,
  `Jenis_Kelamin` enum('Laki-laki','Perempuan') COLLATE utf8_bin NOT NULL,
  `Alamat` varchar(100) COLLATE utf8_bin NOT NULL,
  `Sekolah` varchar(100) COLLATE utf8_bin NOT NULL,
  `No_hp` varchar(12) COLLATE utf8_bin NOT NULL,
  `No_hp_Ortu` varchar(12) COLLATE utf8_bin NOT NULL,
  `Created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `Updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`idSiswa`, `Nama`, `Jenis_Kelamin`, `Alamat`, `Sekolah`, `No_hp`, `No_hp_Ortu`, `Created_at`, `Updated_at`) VALUES
(1, 'Anisa Rahma', 'Perempuan', 'Kediri', 'Man 1 - Kediri', '82732873', '81627738', '2024-03-28 13:06:33', '2024-03-28 13:06:33'),
(2, 'Buntara', 'Laki-laki', 'Sukorame', 'Sd the Naff- Kediri', '0', '817728393', '2024-03-28 13:06:33', '2024-03-28 13:06:33'),
(5, 'Kameswara', 'Laki-laki', 'Nganjuk', 'Man 3', '082899080', '0829272626', '2024-03-29 11:07:24', '2024-03-29 11:07:24'),
(8, 'Johan', 'Laki-laki', 'Nganjuk', 'Man 3 Nganjuk', '08282020', '08292729290', '2024-03-29 11:26:11', '2024-03-29 11:27:44'),
(10, 'Toni', 'Laki-laki', 'Nganjuk', 'Man 3', '082373839', '082923637', '2024-03-29 11:31:33', '2024-03-29 11:31:33'),
(14, 'Jono', 'Laki-laki', 'Nganjuk', 'Man 3', '083737222', '082923637', '2024-03-29 16:06:00', '2024-03-29 16:06:00'),
(29, 'Rini', 'Perempuan', 'Mojoroto', 'SMK', '01', '00', '2024-03-30 13:03:25', '2024-03-30 13:03:25'),
(32, 'Budiman', 'Laki-laki', 'Nganjuk Ladang', 'Garas', '09', '09', '2024-03-30 13:09:38', '2024-03-30 13:09:38'),
(33, 'kafa', 'Laki-laki', 'Kediri', 'sd rahmat', '08', '08', '2024-03-30 13:12:49', '2024-03-30 13:12:49'),
(37, '', 'Laki-laki', 'nga', 's', '06', '06', '2024-03-30 13:19:54', '2024-03-30 13:19:54'),
(40, 'Evriting', 'Laki-laki', 'Nganjuk Ladang', 'sd rahmat', '00', '00', '2024-03-30 14:53:33', '2024-03-30 14:53:33'),
(41, 'Badria', 'Perempuan', 'Kediri', 'sd rahmat', '008', '0', '2024-03-30 14:54:06', '2024-03-30 14:54:06'),
(42, '', 'Perempuan', 'sd', 'sd rahmat', '009', '0', '2024-03-30 14:54:55', '2024-03-30 14:54:55'),
(44, 'kosong', 'Laki-laki', 'p', 'sd', '', '', '2024-03-30 15:00:53', '2024-03-30 15:00:53'),
(65, 'Tukiman', '', 'P', 'Sd', '0000817', '282681', '2024-04-17 09:22:00', '2024-04-17 09:22:00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`Pengajar_idPengajar`),
  ADD KEY `fk_Akun_Pengajar_idx` (`Pengajar_idPengajar`);

--
-- Indeks untuk tabel `materi_pembelajaran`
--
ALTER TABLE `materi_pembelajaran`
  ADD PRIMARY KEY (`idMateri_Pembelajaran`),
  ADD UNIQUE KEY `idMateri_Pembelajaran_UNIQUE` (`idMateri_Pembelajaran`),
  ADD UNIQUE KEY `Materi_UNIQUE` (`Materi`),
  ADD KEY `fk_Materi_Pembelajaran_Pengajar1_idx` (`Pengajar_idPengajar`);

--
-- Indeks untuk tabel `pengajar`
--
ALTER TABLE `pengajar`
  ADD PRIMARY KEY (`idPengajar`),
  ADD UNIQUE KEY `idPengajar_UNIQUE` (`idPengajar`),
  ADD UNIQUE KEY `Email_UNIQUE` (`Email`),
  ADD UNIQUE KEY `No_hp_UNIQUE` (`No_hp`);

--
-- Indeks untuk tabel `pertemuan_pembelajaran`
--
ALTER TABLE `pertemuan_pembelajaran`
  ADD PRIMARY KEY (`idPembelajaran`),
  ADD UNIQUE KEY `idPembelajaran_UNIQUE` (`idPembelajaran`),
  ADD KEY `fk_Pertemuan_Pembelajaran_Pengajar1_idx` (`Pengajar_idPengajar`),
  ADD KEY `fk_Pertemuan_Pembelajaran_Materi_Pembelajaran1_idx` (`Materi_Pembelajaran_idMateri_Pembelajaran`),
  ADD KEY `fk_Pertemuan_Pembelajaran_Siswa1_idx` (`Siswa_idSiswa`);

--
-- Indeks untuk tabel `sertifikat_pembelajaran`
--
ALTER TABLE `sertifikat_pembelajaran`
  ADD PRIMARY KEY (`idSertifikat_pembelajaran`),
  ADD UNIQUE KEY `No_Sertivikat_UNIQUE` (`No_Sertivikat`),
  ADD UNIQUE KEY `idSertifikat_pembelajaran_UNIQUE` (`idSertifikat_pembelajaran`),
  ADD KEY `fk_Sertifikat_pembelajaran_Pertemuan_Pembelajaran1_idx` (`Pertemuan_Pembelajaran_idPembelajaran`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`idSiswa`),
  ADD UNIQUE KEY `idSiswa_UNIQUE` (`idSiswa`),
  ADD UNIQUE KEY `No_hp_UNIQUE` (`No_hp`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `materi_pembelajaran`
--
ALTER TABLE `materi_pembelajaran`
  MODIFY `idMateri_Pembelajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `pengajar`
--
ALTER TABLE `pengajar`
  MODIFY `idPengajar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `pertemuan_pembelajaran`
--
ALTER TABLE `pertemuan_pembelajaran`
  MODIFY `idPembelajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `sertifikat_pembelajaran`
--
ALTER TABLE `sertifikat_pembelajaran`
  MODIFY `idSertifikat_pembelajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `idSiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD CONSTRAINT `fk_Akun_Pengajar` FOREIGN KEY (`Pengajar_idPengajar`) REFERENCES `pengajar` (`idPengajar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `materi_pembelajaran`
--
ALTER TABLE `materi_pembelajaran`
  ADD CONSTRAINT `fk_Materi_Pembelajaran_Pengajar1` FOREIGN KEY (`Pengajar_idPengajar`) REFERENCES `pengajar` (`idPengajar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `pertemuan_pembelajaran`
--
ALTER TABLE `pertemuan_pembelajaran`
  ADD CONSTRAINT `fk_Pertemuan_Pembelajaran_Materi_Pembelajaran1` FOREIGN KEY (`Materi_Pembelajaran_idMateri_Pembelajaran`) REFERENCES `materi_pembelajaran` (`idMateri_Pembelajaran`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pertemuan_Pembelajaran_Pengajar1` FOREIGN KEY (`Pengajar_idPengajar`) REFERENCES `pengajar` (`idPengajar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pertemuan_Pembelajaran_Siswa1` FOREIGN KEY (`Siswa_idSiswa`) REFERENCES `siswa` (`idSiswa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `sertifikat_pembelajaran`
--
ALTER TABLE `sertifikat_pembelajaran`
  ADD CONSTRAINT `fk_Sertifikat_pembelajaran_Pertemuan_Pembelajaran1` FOREIGN KEY (`Pertemuan_Pembelajaran_idPembelajaran`) REFERENCES `pertemuan_pembelajaran` (`idPembelajaran`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
