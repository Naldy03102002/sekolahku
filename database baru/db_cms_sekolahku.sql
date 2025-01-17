-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jun 2024 pada 12.13
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cms_sekolahku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `academic_years`
--

CREATE TABLE `academic_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year` varchar(9) NOT NULL COMMENT 'Tahun Pelajaran',
  `semester` enum('odd','even') NOT NULL DEFAULT 'odd' COMMENT 'odd = Ganjil, even = Genap',
  `current_semester` enum('true','false') NOT NULL DEFAULT 'false',
  `admission_semester` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `academic_years`
--

INSERT INTO `academic_years` (`id`, `academic_year`, `semester`, `current_semester`, `admission_semester`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '2023-2024', 'even', 'true', 'true', '2024-05-28 19:44:18', '2024-05-28 12:44:18', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `achievements`
--

CREATE TABLE `achievements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) DEFAULT 0,
  `achievement_description` varchar(255) NOT NULL,
  `achievement_type` bigint(20) DEFAULT 0,
  `achievement_level` smallint(6) NOT NULL DEFAULT 0,
  `achievement_year` year(4) NOT NULL,
  `achievement_organizer` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `admission_phases`
--

CREATE TABLE `admission_phases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT 0 COMMENT 'Tahun Pelajaran',
  `phase_name` varchar(255) NOT NULL COMMENT 'Gelombang Pendaftaran',
  `phase_start_date` date DEFAULT NULL COMMENT 'Tanggal Mulai',
  `phase_end_date` date DEFAULT NULL COMMENT 'Tanggal Selesai',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `admission_phases`
--

INSERT INTO `admission_phases` (`id`, `academic_year_id`, `phase_name`, `phase_start_date`, `phase_end_date`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, 'Pertama', '2024-06-01', '2024-06-30', '2024-06-02 21:14:24', '2024-06-02 14:38:13', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `admission_quotas`
--

CREATE TABLE `admission_quotas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT 0 COMMENT 'Tahun Pelajaran',
  `admission_type_id` bigint(20) DEFAULT 0 COMMENT 'Jalur Pendaftaran',
  `major_id` bigint(20) DEFAULT 0 COMMENT 'Program Keahlian',
  `quota` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Kuota Pendaftaran',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `admission_quotas`
--

INSERT INTO `admission_quotas` (`id`, `academic_year_id`, `admission_type_id`, `major_id`, `quota`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, 187, 0, 50, '2024-06-01 10:55:19', '2024-06-01 03:55:19', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 1, 173, 0, 70, '2024-06-01 10:55:39', '2024-06-01 03:55:39', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 1, 186, 0, 40, '2024-06-01 10:55:53', '2024-06-01 03:55:53', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `albums`
--

CREATE TABLE `albums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `album_title` varchar(255) NOT NULL,
  `album_description` varchar(255) DEFAULT NULL,
  `album_slug` varchar(255) DEFAULT NULL,
  `album_cover` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `albums`
--

INSERT INTO `albums` (`id`, `album_title`, `album_description`, `album_slug`, `album_cover`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Bersama camat atinggola', '', 'bersama-camat-atinggola', NULL, '2024-05-26 22:10:33', '2024-05-27 03:28:57', '2024-05-27 10:28:57', NULL, 1, 0, 1, 0, 'true'),
(2, 'smp', 'smp', 'smp', NULL, '2024-05-31 17:49:09', '2024-05-31 10:52:32', '2024-05-31 17:52:32', NULL, 1, 0, 1, 0, 'true'),
(3, 'contoh', 'contoh1', 'contoh', '39b4b68bb448b2530fcfd8b2f42e0aec.JPG', '2024-05-31 20:41:56', '2024-06-12 14:58:23', NULL, NULL, 1, 1, 0, 0, 'false'),
(4, 'TIM', '', 'tim', 'b17e8eb81bb79c77470aa2d6dcc7fb66.JPG', '2024-05-31 20:51:29', '2024-06-12 15:01:23', NULL, NULL, 1, 1, 0, 0, 'false'),
(5, 'Mahasiswa PMS MBKM 2024', '', 'mahasiswa-pms-mbkm-2024', '1e280e8ce0732ffc08c1ce327d47b380.jpeg', '2024-06-12 21:59:09', '2024-06-12 15:00:11', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) DEFAULT 0,
  `answer` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_slug` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `category_type` enum('post','file') DEFAULT 'post',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `category_description`, `category_type`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Berita', 'berita', 'Berita', 'post', '2023-01-15 21:23:22', '2024-05-27 23:25:32', NULL, NULL, 0, 1, 0, 0, 'false'),
(2, 'Berita', 'berita', 'Berita', 'file', '2023-01-15 21:23:22', '2024-05-28 03:12:21', NULL, NULL, 0, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `class_groups`
--

CREATE TABLE `class_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_group` varchar(100) DEFAULT NULL,
  `sub_class_group` varchar(100) DEFAULT NULL,
  `major_id` bigint(20) DEFAULT 0 COMMENT 'Program Keahlian',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `class_groups`
--

INSERT INTO `class_groups` (`id`, `class_group`, `sub_class_group`, `major_id`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'KELAS', 'VII-A', 0, '2024-05-28 19:45:50', '2024-05-28 12:48:51', NULL, NULL, 1, 1, 0, 0, 'false'),
(2, 'KELAS', 'VII-B', 0, '2024-05-28 19:46:04', '2024-05-28 12:49:02', NULL, NULL, 1, 1, 0, 0, 'false'),
(3, 'KELAS', 'VII-C', 0, '2024-05-28 19:46:15', '2024-05-28 12:49:11', NULL, NULL, 1, 1, 0, 0, 'false'),
(4, 'KELAS', 'VIII-A', 0, '2024-05-28 19:46:34', '2024-05-28 12:49:20', NULL, NULL, 1, 1, 0, 0, 'false'),
(5, 'KELAS', 'VIII-B', 0, '2024-05-28 19:46:48', '2024-05-28 12:49:30', NULL, NULL, 1, 1, 0, 0, 'false'),
(6, 'KELAS', 'VIII-C', 0, '2024-05-28 19:47:01', '2024-05-28 12:49:45', NULL, NULL, 1, 1, 0, 0, 'false'),
(7, 'KELAS', 'IX-A', 0, '2024-05-28 19:47:14', '2024-05-28 12:48:17', NULL, NULL, 1, 1, 0, 0, 'false'),
(8, 'KELAS', 'IX-B', 0, '2024-05-28 19:47:27', '2024-05-28 12:48:28', NULL, NULL, 1, 1, 0, 0, 'false'),
(9, 'KELAS', 'IX-C', 0, '2024-05-28 19:47:41', '2024-05-28 12:48:35', NULL, NULL, 1, 1, 0, 0, 'false'),
(10, 'KELAS', 'IX-D', 0, '2024-05-28 19:47:57', '2024-05-28 12:48:44', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `class_group_settings`
--

CREATE TABLE `class_group_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT 0 COMMENT 'FK dari academic_years',
  `class_group_id` bigint(20) DEFAULT 0 COMMENT 'Kelas, FK dari class_groups',
  `employee_id` bigint(20) DEFAULT 0 COMMENT 'Wali Kelas, FK dari employees',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `class_group_settings`
--

INSERT INTO `class_group_settings` (`id`, `academic_year_id`, `class_group_id`, `employee_id`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, 3, 3, '2024-05-28 20:04:56', '2024-05-28 13:04:56', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `class_group_students`
--

CREATE TABLE `class_group_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_group_setting_id` bigint(20) DEFAULT 0,
  `student_id` bigint(20) DEFAULT 0,
  `is_class_manager` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Ketua Kelas ?',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_post_id` bigint(20) DEFAULT 0,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) DEFAULT NULL,
  `comment_url` varchar(255) DEFAULT NULL,
  `comment_ip_address` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_subject` varchar(255) DEFAULT NULL,
  `comment_reply` text DEFAULT NULL,
  `comment_status` enum('approved','unapproved','spam') DEFAULT 'approved',
  `comment_agent` varchar(255) DEFAULT NULL,
  `comment_parent_id` varchar(255) DEFAULT NULL,
  `comment_type` enum('post','message') DEFAULT 'post',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assignment_letter_number` varchar(255) DEFAULT NULL COMMENT 'Nomor Surat Tugas',
  `assignment_letter_date` date DEFAULT NULL COMMENT 'Tanggal Surat Tugas',
  `assignment_start_date` date DEFAULT NULL COMMENT 'TMT Tugas',
  `parent_school_status` enum('true','false') NOT NULL DEFAULT 'true' COMMENT 'Status Sekolah Induk',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `nik` varchar(50) DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `mother_name` varchar(150) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Rukun Tetangga',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Rukun Warga',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kota/Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `religion_id` bigint(20) DEFAULT 0,
  `marriage_status_id` bigint(20) DEFAULT 0,
  `spouse_name` varchar(255) DEFAULT NULL COMMENT 'Nama Pasangan : Suami / Istri',
  `spouse_employment_id` bigint(20) DEFAULT 0 COMMENT 'Pekerjaan Pasangan : Suami / Istri',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `npwp` varchar(100) DEFAULT NULL,
  `employment_status_id` bigint(20) DEFAULT 0 COMMENT 'Status Kepegawaian',
  `nip` varchar(100) DEFAULT NULL,
  `niy` varchar(100) DEFAULT NULL COMMENT 'NIY/NIGK',
  `nuptk` varchar(100) DEFAULT NULL,
  `employment_type_id` bigint(20) DEFAULT 0 COMMENT 'Jenis Guru dan Tenaga Kependidikan (GTK)',
  `decree_appointment` varchar(255) DEFAULT NULL COMMENT 'SK Pengangkatan',
  `appointment_start_date` date DEFAULT NULL COMMENT 'TMT Pengangkatan',
  `institution_lifter_id` bigint(20) DEFAULT 0 COMMENT 'Lembaga Pengangkat',
  `decree_cpns` varchar(100) DEFAULT NULL COMMENT 'SK CPNS',
  `pns_start_date` date DEFAULT NULL COMMENT 'TMT CPNS',
  `rank_id` bigint(20) DEFAULT 0 COMMENT 'Pangkat/Golongan',
  `salary_source_id` bigint(20) DEFAULT 0 COMMENT 'Sumber Gaji',
  `headmaster_license` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Punya Lisensi Kepala Sekolah?',
  `laboratory_skill_id` bigint(20) DEFAULT 0 COMMENT 'Keahlian Lab oratorium',
  `special_need_id` bigint(20) DEFAULT 0 COMMENT 'Mampu Menangani Kebutuhan Khusus',
  `braille_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Braile ?',
  `sign_language_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Bahasa Isyarat ?',
  `phone` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `employees`
--

INSERT INTO `employees` (`id`, `assignment_letter_number`, `assignment_letter_date`, `assignment_start_date`, `parent_school_status`, `full_name`, `gender`, `nik`, `birth_place`, `birth_date`, `mother_name`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `religion_id`, `marriage_status_id`, `spouse_name`, `spouse_employment_id`, `citizenship`, `country`, `npwp`, `employment_status_id`, `nip`, `niy`, `nuptk`, `employment_type_id`, `decree_appointment`, `appointment_start_date`, `institution_lifter_id`, `decree_cpns`, `pns_start_date`, `rank_id`, `salary_source_id`, `headmaster_license`, `laboratory_skill_id`, `special_need_id`, `braille_skills`, `sign_language_skills`, `phone`, `mobile_phone`, `email`, `photo`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '2345432234', '2024-03-07', '2024-07-04', 'true', 'Chrisnaldy', 'M', '3233455555543', 'swiss', '2002-10-03', 'ina', 'atg', '1', '2', 'bage', 'kotajin', 'atinggola', 'gorut', '332345', 89, 104, '', 10, 'WNI', '', NULL, 113, NULL, NULL, '', 124, '', '0000-00-00', 106, '', '0000-00-00', 144, 152, 'true', 164, 23, 'true', 'true', '0822913045', '09897654', 'chirisnaldyt@gmail.com', 'd20bcf2ae1f801fbadffdc10b0129150.jpg', '2024-05-27 11:10:44', '2024-06-13 00:22:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, '', '0000-00-00', '0000-00-00', 'true', 'Chrisnaldi D.Tampilang', 'M', '532421077', 'Siau', '0000-00-00', '', 'Atinggola', '', '', '', '', '', '', '', 0, 0, '', 0, 'WNI', '', NULL, 113, NULL, NULL, '', 125, '', '0000-00-00', 0, '', '0000-00-00', 0, 0, 'false', 0, 0, 'false', 'false', '', '', '532421077@smpn1atinggola.sch.id', '52d8ac2584ad848549223ab0c5aee891.jpeg', '2024-05-28 20:02:12', '2024-05-31 12:03:40', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_title` varchar(255) DEFAULT NULL,
  `file_description` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_category_id` bigint(20) DEFAULT 0,
  `file_path` varchar(255) DEFAULT NULL,
  `file_ext` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `file_visibility` enum('public','private') DEFAULT 'public',
  `file_counter` bigint(20) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `image_sliders`
--

CREATE TABLE `image_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caption` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `image_sliders`
--

INSERT INTO `image_sliders` (`id`, `caption`, `image`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(6, 'Guru SMP Negeri 1 Atinggola Dan Mahasiswa PMS MBKM Universitas Negeri Gorontalo', '476cc8623de3f0d14aac96f3cf82c236.jpeg', '2024-06-12 21:33:57', '2024-06-12 14:37:10', NULL, NULL, 1, 0, 0, 0, 'false'),
(7, 'bersama camat atinggola', '784e7f9f75a9dad03e4a53559d6524b5.jpeg', '2024-06-12 21:42:18', '2024-06-12 14:42:35', NULL, NULL, 1, 0, 0, 0, 'false'),
(8, 'staf dewan guru smpn1atinggola', 'c0178cfa816b13115679095b7ba1b31f.jpeg', '2024-06-12 21:42:52', '2024-06-12 14:43:14', NULL, NULL, 1, 0, 0, 0, 'false'),
(9, 'Bapak/Ibu guru dan mahasiwa Mbkm', '8920f5d1346af3d9dcdf564c67bf89b8.jpeg', '2024-06-12 21:43:58', '2024-06-12 14:44:29', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `links`
--

CREATE TABLE `links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link_title` varchar(255) NOT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_target` enum('_blank','_self','_parent','_top') DEFAULT '_blank',
  `link_image` varchar(100) DEFAULT NULL,
  `link_type` enum('link','banner') DEFAULT 'link',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `links`
--

INSERT INTO `links` (`id`, `link_title`, `link_url`, `link_target`, `link_image`, `link_type`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'SMP NEGERI 1 ATINGGOLA', 'https://smpn1atinggola.web.id', '_blank', NULL, 'link', '2023-01-15 21:23:22', '2024-05-28 03:08:23', '2024-05-28 10:08:23', NULL, 0, 1, 1, 0, 'true'),
(2, 'smpn1atg', 'https://www.facebook.com/share/v/enXiwL2UeHi2dxZs/?mibextid=oFDknk', '_blank', '39906a1089ec7913938a5645c1e1fd08.jpeg', 'banner', '2023-01-15 21:23:22', '2024-05-31 12:54:48', NULL, NULL, 0, 1, 0, 0, 'false'),
(5, 'SMPN1ATINGGOLA', 'https://www.facebook.com/share/v/99gtXzw7L6Wr7X5p/?mibextid=oFDknk', '_self', 'e975a960960bab97d7188db84ccd6377.jpeg', 'banner', '2024-05-31 19:49:15', '2024-05-31 12:54:34', NULL, NULL, 1, 1, 0, 0, 'false'),
(6, 'SMP NEGERI 1 ATINGGOLA', 'http://#', '_blank', '55ab4b6117a3c89e5c6f391da9486080.JPG', 'banner', '2024-06-12 21:55:19', '2024-06-12 14:56:09', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `counter` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `datetime` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `majors`
--

CREATE TABLE `majors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `major_name` varchar(255) DEFAULT NULL COMMENT 'Program Keahlian / Jurusan',
  `major_short_name` varchar(255) DEFAULT NULL COMMENT 'Nama Singkat',
  `is_active` enum('true','false') DEFAULT 'true',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_title` varchar(150) NOT NULL,
  `menu_url` varchar(150) NOT NULL,
  `menu_target` enum('_blank','_self','_parent','_top') DEFAULT '_self',
  `menu_type` varchar(100) NOT NULL DEFAULT 'pages',
  `menu_parent_id` bigint(20) DEFAULT 0,
  `menu_position` bigint(20) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `menu_title`, `menu_url`, `menu_target`, `menu_type`, `menu_parent_id`, `menu_position`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Hubungi Kami', 'hubungi-kami', '_self', 'modules', 0, 9, '2023-01-15 21:23:22', '2024-06-01 02:54:20', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Galeri Foto', 'galeri-foto', '_self', 'modules', 9, 1, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Galeri Video', 'galeri-video', '_self', 'modules', 9, 2, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'Formulir PPDB', 'formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 1, '2023-01-15 21:23:22', '2024-05-31 12:46:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'Cetak Formulir', 'cetak-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 2, '2023-01-15 21:23:22', '2024-05-31 12:46:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'Download Formulir', 'download-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 3, '2023-01-15 21:23:22', '2024-05-31 12:46:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'PPDB 2024', '#', '', 'links', 0, 7, '2023-01-15 21:23:22', '2024-06-01 02:54:20', NULL, '2024-05-28 11:30:47', 0, 1, 0, 1, 'false'),
(9, 'Galeri', '#', '_self', 'links', 0, 6, '2023-01-15 21:23:22', '2024-06-01 02:54:20', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'informasi', '#', '', 'links', 0, 5, '2023-01-15 21:23:22', '2024-06-01 02:54:20', NULL, '2024-05-29 05:57:43', 0, 1, 0, 1, 'false'),
(11, 'Berita', 'kategori/Berita', '', 'post_categories', 10, 1, '2023-01-15 21:23:22', '2024-05-28 04:32:18', NULL, '2024-05-28 11:32:18', 0, 1, 0, 1, 'false'),
(12, 'Direktori', '#', '_self', 'links', 0, 2, '2023-01-15 21:23:22', '2024-05-28 23:17:59', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'Alumni', 'direktori-alumni', '', 'modules', 12, 3, '2023-01-15 21:23:22', '2024-05-29 23:58:45', NULL, '2024-05-30 06:57:39', 0, 1, 0, 1, 'false'),
(14, 'Peserta Didik', 'direktori-peserta-didik', '', 'modules', 12, 2, '2023-01-15 21:23:22', '2024-05-29 23:58:45', NULL, '2024-05-30 06:57:27', 0, 1, 0, 1, 'false'),
(15, 'Guru dan Tenaga Kependidikan', 'direktori-guru-dan-tenaga-kependidikan', '', 'modules', 12, 1, '2023-01-15 21:23:22', '2024-05-29 23:58:45', NULL, '2024-05-30 06:57:00', 0, 1, 0, 1, 'false'),
(16, 'Pendaftaran Alumni', 'pendaftaran-alumni', '_self', 'modules', 0, 8, '2023-01-15 21:23:22', '2024-06-01 02:54:20', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'Profil Sekolah', 'read/2/profil', '', 'pages', 0, 1, '2023-01-15 21:23:22', '2024-05-31 13:39:20', NULL, '2024-05-31 20:39:20', 0, 1, 0, 1, 'false'),
(18, 'Visi dan Misi', 'read/3/visi-dan-misi', '_self', 'pages', 0, 3, '2023-01-15 21:23:22', '2024-05-31 12:46:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(22, 'struktur organisasi', 'read/28/struktur-organisasi', '_self', 'pages', 0, 4, '2024-06-01 09:57:33', '2024-06-01 02:57:53', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_description` varchar(255) DEFAULT NULL,
  `module_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `module_description`, `module_url`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Pengguna', 'Pengguna', 'users', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'PPDB / PMB', 'PPDB / PMB', 'admission', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Tampilan', 'Tampilan', 'appearance', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'Blog', 'Blog', 'blog', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'GTK / Staff / Dosen', 'GTK / Staff / Dosen', 'employees', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'Media', 'Media', 'media', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'Plugins', 'Plugins', 'plugins', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'Data Referensi', 'Data Referensi', 'reference', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'Pengaturan', 'Pengaturan', 'settings', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'Akademik', 'Akademik', 'academic', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_group` varchar(100) NOT NULL,
  `option_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `options`
--

INSERT INTO `options` (`id`, `option_group`, `option_name`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'student_status', 'Aktif', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'student_status', 'Lulus', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'student_status', 'Mutasi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'student_status', 'Dikeluarkan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'student_status', 'Mengundurkan Diri', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'student_status', 'Putus Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'student_status', 'Meninggal', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'student_status', 'Hilang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'student_status', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'employments', 'Tidak bekerja', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'employments', 'Nelayan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'employments', 'Petani', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'employments', 'Peternak', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(14, 'employments', 'PNS/TNI/POLRI', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'employments', 'Karyawan Swasta', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(16, 'employments', 'Pedagang Kecil', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'employments', 'Pedagang Besar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(18, 'employments', 'Wiraswasta', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(19, 'employments', 'Wirausaha', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(20, 'employments', 'Buruh', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(21, 'employments', 'Pensiunan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(22, 'employments', 'Lain-lain', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(23, 'special_needs', 'Tidak', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(24, 'special_needs', 'Tuna Netra', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(25, 'special_needs', 'Tuna Rungu', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(26, 'special_needs', 'Tuna Grahita ringan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(27, 'special_needs', 'Tuna Grahita Sedang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(28, 'special_needs', 'Tuna Daksa Ringan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(29, 'special_needs', 'Tuna Daksa Sedang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(30, 'special_needs', 'Tuna Laras', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(31, 'special_needs', 'Tuna Wicara', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(32, 'special_needs', 'Tuna ganda', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(33, 'special_needs', 'Hiper aktif', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(34, 'special_needs', 'Cerdas Istimewa', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(35, 'special_needs', 'Bakat Istimewa', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(36, 'special_needs', 'Kesulitan Belajar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(37, 'special_needs', 'Narkoba', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(38, 'special_needs', 'Indigo', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(39, 'special_needs', 'Down Sindrome', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(40, 'special_needs', 'Autis', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(41, 'special_needs', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(42, 'educations', 'Tidak sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(43, 'educations', 'Putus SD', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(44, 'educations', 'SD Sederajat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(45, 'educations', 'SMP Sederajat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(46, 'educations', 'SMA Sederajat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(47, 'educations', 'D1', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(48, 'educations', 'D2', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(49, 'educations', 'D3', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(50, 'educations', 'D4/S1', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(51, 'educations', 'S2', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(52, 'educations', 'S3', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(53, 'scholarships', 'Anak berprestasi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(54, 'scholarships', 'Anak Miskin', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(55, 'scholarships', 'Pendidikan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(56, 'scholarships', 'Unggulan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(57, 'scholarships', 'Lain-lain', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(58, 'achievement_types', 'Sains', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(59, 'achievement_types', 'Seni', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(60, 'achievement_types', 'Olahraga', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(61, 'achievement_types', 'Lain-lain', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(62, 'achievement_levels', 'Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(63, 'achievement_levels', 'Kecamatan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(64, 'achievement_levels', 'Kota/Kabupaten', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(65, 'achievement_levels', 'Propinsi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(66, 'achievement_levels', 'Nasional', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(67, 'achievement_levels', 'Internasional', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(68, 'monthly_incomes', 'Kurang dari 500,000', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(69, 'monthly_incomes', '500.000 - 999.9999', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(70, 'monthly_incomes', '1 Juta - 1.999.999', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(71, 'monthly_incomes', '2 Juta - 4.999.999', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(72, 'monthly_incomes', '5 Juta - 20 Juta', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(73, 'monthly_incomes', 'Lebih dari 20 Juta', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(74, 'residences', 'Bersama orang tua', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(75, 'residences', 'Wali', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(76, 'residences', 'Kos', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(77, 'residences', 'Asrama', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(78, 'residences', 'Panti Asuhan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(79, 'residences', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(80, 'transportations', 'Jalan kaki', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(81, 'transportations', 'Kendaraan pribadi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(82, 'transportations', 'Kendaraan Umum / angkot / Pete-pete', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(83, 'transportations', 'Jemputan Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(84, 'transportations', 'Kereta Api', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(85, 'transportations', 'Ojek', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(86, 'transportations', 'Andong / Bendi / Sado / Dokar / Delman / Beca', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(87, 'transportations', 'Perahu penyebrangan / Rakit / Getek', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(88, 'transportations', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(89, 'religions', 'Islam', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(90, 'religions', 'Kristen / protestan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(91, 'religions', 'Katholik', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(92, 'religions', 'Hindu', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(93, 'religions', 'Budha', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(94, 'religions', 'Khong Hu Chu', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(95, 'religions', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(96, 'school_levels', '1 - Sekolah Dasar (SD) / Sederajat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(97, 'school_levels', '2 - Sekolah Menengah Pertama (SMP) / Sederajat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(98, 'school_levels', '3 - Sekolah Menengah Atas (SMA) / Aliyah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(99, 'school_levels', '4 - Sekolah Menengah Kejuruan (SMK)', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(100, 'school_levels', '5 - Universitas', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(101, 'school_levels', '6 - Sekolah Tinggi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(102, 'school_levels', '7 - Politeknik', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(103, 'marriage_status', 'Kawin', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(104, 'marriage_status', 'Belum Kawin', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(105, 'marriage_status', 'Berpisah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(106, 'institution_lifters', 'Pemerintah Pusat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(107, 'institution_lifters', 'Pemerintah Provinsi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(108, 'institution_lifters', 'Pemerintah Kab/Kota', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(109, 'institution_lifters', 'Ketua yayasan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(110, 'institution_lifters', 'Kepala Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(111, 'institution_lifters', 'Komite Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(112, 'institution_lifters', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(113, 'employment_status', 'PNS ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(114, 'employment_status', 'PNS Diperbantukan ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(115, 'employment_status', 'PNS DEPAG ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(116, 'employment_status', 'GTY/PTY ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(117, 'employment_status', 'GTT/PTT Provinsi ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(118, 'employment_status', 'GTT/PTT Kota/Kabupaten', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(119, 'employment_status', 'Guru Bantu Pusat ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(120, 'employment_status', 'Guru Honor Sekolah ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(121, 'employment_status', 'Tenaga Honor Sekolah ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(122, 'employment_status', 'CPNS', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(123, 'employment_status', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(124, 'employment_types', 'Guru Kelas VII-A', '2023-01-15 21:23:22', '2024-05-28 13:11:02', NULL, NULL, 0, 1, 0, 0, 'false'),
(125, 'employment_types', 'Guru Mata Pelajaran', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(126, 'employment_types', 'Guru BK', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(127, 'employment_types', 'Guru Inklusi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(128, 'employment_types', 'Tenaga Administrasi Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(129, 'employment_types', 'Guru Pendamping', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(130, 'employment_types', 'Guru Magang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(131, 'employment_types', 'Guru TIK', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(132, 'employment_types', 'Laboran', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(133, 'employment_types', 'Pustakawan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(134, 'employment_types', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(135, 'ranks', 'I/A', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(136, 'ranks', 'I/B', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(137, 'ranks', 'I/C', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(138, 'ranks', 'I/D', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(139, 'ranks', 'II/A', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(140, 'ranks', 'II/B', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(141, 'ranks', 'II/C', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(142, 'ranks', 'II/D', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(143, 'ranks', 'III/A', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(144, 'ranks', 'III/B', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(145, 'ranks', 'III/C', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(146, 'ranks', 'III/D', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(147, 'ranks', 'IV/A', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(148, 'ranks', 'IV/B', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(149, 'ranks', 'IV/C', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(150, 'ranks', 'IV/D', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(151, 'ranks', 'IV/E', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(152, 'salary_sources', 'APBN', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(153, 'salary_sources', 'APBD Provinsi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(154, 'salary_sources', 'APBD Kab/Kota', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(155, 'salary_sources', 'Yayasan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(156, 'salary_sources', 'Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(157, 'salary_sources', 'Lembaga Donor', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(158, 'salary_sources', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(159, 'laboratory_skills', 'Lab IPA', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(160, 'laboratory_skills', 'Lab Fisika', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(161, 'laboratory_skills', 'Lab Biologi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(162, 'laboratory_skills', 'Lab Kimia', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(163, 'laboratory_skills', 'Lab Bahasa', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(164, 'laboratory_skills', 'Lab Komputer', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(165, 'laboratory_skills', 'Teknik Bangunan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(166, 'laboratory_skills', 'Teknik Survei & Pemetaan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(167, 'laboratory_skills', 'Teknik Ketenagakerjaan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(168, 'laboratory_skills', 'Teknik Pendinginan & Tata Udara', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(169, 'laboratory_skills', 'Teknik Mesin', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(170, 'employment_types', 'wakasek kurikulum', '2024-05-28 05:44:24', '2024-05-27 22:44:24', NULL, NULL, 1, 0, 0, 0, 'false'),
(171, 'institution_lifters', 'wakasek kurikulum', '2024-05-28 05:45:20', '2024-05-27 22:45:20', NULL, NULL, 1, 0, 0, 0, 'false'),
(172, 'institution_lifters', 'wakil kepala sekolah', '2024-05-28 05:45:36', '2024-05-27 22:45:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(173, 'admission_types', 'zonasi', '2024-05-28 05:46:52', '2024-05-27 22:46:52', NULL, NULL, 1, 0, 0, 0, 'false'),
(174, 'employment_types', 'Guru Kelas VII-B', '2024-05-28 20:11:14', '2024-05-28 13:11:14', NULL, NULL, 1, 0, 0, 0, 'false'),
(175, 'employment_types', 'Guru Kelas VII-C', '2024-05-28 20:11:23', '2024-05-28 13:11:23', NULL, NULL, 1, 0, 0, 0, 'false'),
(176, 'employment_types', 'Guru Kelas VIII-A', '2024-05-28 20:11:43', '2024-05-28 13:11:43', NULL, NULL, 1, 0, 0, 0, 'false'),
(177, 'employment_types', 'Guru Kelas VIII-B', '2024-05-28 20:11:58', '2024-05-28 13:11:58', NULL, NULL, 1, 0, 0, 0, 'false'),
(178, 'employment_types', 'Guru Kelas VIII-C', '2024-05-28 20:12:10', '2024-05-28 13:12:10', NULL, NULL, 1, 0, 0, 0, 'false'),
(179, 'employment_types', 'Guru Kelas IX-A', '2024-05-28 20:12:27', '2024-05-28 13:12:27', NULL, NULL, 1, 0, 0, 0, 'false'),
(180, 'employment_types', 'Guru Kelas IX-B', '2024-05-28 20:12:40', '2024-05-28 13:12:40', NULL, NULL, 1, 0, 0, 0, 'false'),
(181, 'employment_types', 'Guru Kelas IX-C', '2024-05-28 20:13:02', '2024-05-28 13:13:02', NULL, NULL, 1, 0, 0, 0, 'false'),
(182, 'employment_types', 'Guru Kelas IX-D', '2024-05-28 20:13:13', '2024-05-28 13:13:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(183, 'employment_types', 'Guru Kelas', '2024-05-28 20:13:27', '2024-05-28 13:13:27', NULL, NULL, 1, 0, 0, 0, 'false'),
(186, 'admission_types', 'afirmasi', '2024-05-28 21:58:31', '2024-06-02 14:15:15', NULL, NULL, 1, 1, 0, 0, 'false'),
(187, 'admission_types', 'Prestasi', '2024-05-28 21:58:42', '2024-05-28 14:58:42', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo_album_id` bigint(20) DEFAULT 0,
  `photo_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pollings`
--

CREATE TABLE `pollings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `answer_id` bigint(20) DEFAULT 0,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_content` longtext DEFAULT NULL,
  `post_image` varchar(100) DEFAULT NULL,
  `post_author` bigint(20) DEFAULT 0,
  `post_categories` varchar(255) DEFAULT NULL,
  `post_type` varchar(50) NOT NULL DEFAULT 'post',
  `post_status` enum('publish','draft') DEFAULT 'draft',
  `post_visibility` enum('public','private') DEFAULT 'public',
  `post_comment_status` enum('open','close') DEFAULT 'close',
  `post_slug` varchar(255) DEFAULT NULL,
  `post_tags` varchar(255) DEFAULT NULL,
  `post_counter` bigint(20) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `post_title`, `post_content`, `post_image`, `post_author`, `post_categories`, `post_type`, `post_status`, `post_visibility`, `post_comment_status`, `post_slug`, `post_tags`, `post_counter`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '', '<p>Selamat datang di website resmi SMP Negeri 1 Atinggola! Saya, Asraty Ibrahim, S.Pd., dengan senang hati menyambut Anda semua dalam kunjungan virtual ini. Di tengah kemajuan teknologi yang semakin pesat, kami bangga dapat berkomunikasi dengan Anda melalui platform ini untuk berbagi informasi tentang sekolah kami. SMP Negeri 1 Atinggola telah menjadi bagian integral dari komunitas pendidikan di Kabupaten Gorontalo Utara, Provinsi Gorontalo. Sejak didirikan, kami berkomitmen untuk memberikan pendidikan berkualitas yang mempersiapkan siswa-siswa kami untuk meraih prestasi akademis yang gemilang serta berkembang sebagai individu yang berintegritas dan bertanggung jawab. Dengan didukung oleh tenaga pendidik yang berkualitas dan fasilitas belajar yang memadai, kami berusaha menciptakan lingkungan yang kondusif bagi perkembangan potensi siswa dalam berbagai bidang. Kami juga memprioritaskan pendekatan pembelajaran yang inovatif dan inklusif, yang mendorong setiap siswa untuk mencapai kemampuan terbaiknya. Di website ini, Anda akan menemukan informasi tentang kurikulum sekolah, kegiatan ekstrakurikuler, prestasi siswa, serta berbagai acara dan kegiatan sekolah lainnya. Kami berharap informasi yang disediakan dapat memberikan gambaran yang jelas tentang identitas dan kualitas pendidikan di SMP Negeri 1 Atinggola. Terima kasih atas kunjungan Anda di website kami. Jika Anda memiliki pertanyaan lebih lanjut atau ingin mengetahui lebih detail tentang sekolah kami, jangan ragu untuk menghubungi kami. Kami siap memberikan informasi dan bantuan yang Anda butuhkan. Salam hormat, Asraty Ibrahim, S.Pd. Kepala Sekolah SMP Negeri 1 Atinggola</p>', 'headmaster_photo.png', 0, '', 'opening_speech', 'publish', 'public', 'open', '', '', 0, '2023-01-15 21:23:22', '2024-05-31 13:17:57', NULL, NULL, 0, 1, 0, 0, 'false'),
(2, 'Profil', '<p>Profil sekolah smp negeri&nbsp; 1 atinggola</p>', NULL, 1, '+1+', 'page', 'publish', 'public', 'open', 'profil', 'berita, pengumuman, sekilas-info', 66, '2024-05-26 21:20:22', '2024-06-13 09:16:41', NULL, NULL, 0, 1, 0, 0, 'false'),
(3, 'Visi dan Misi', '<p><strong><img src=\"http://localhost/cmssekolahku/media_library/posts/post-image-1717154680007.jpg\" alt=\"visi misi\" width=\"713\" height=\"1591\" /></strong></p>', NULL, 1, '+1+', 'page', 'publish', 'public', 'open', 'visi-dan-misi', 'berita, pengumuman, sekilas-info', 13, '2023-01-15 21:23:22', '2024-06-13 09:14:19', NULL, NULL, 0, 1, 0, 0, 'false'),
(4, 'Camat Atinggola Buka Asesmen Sumatif Berbasis Daring di SMP Negeri 1 Atinggola', '<p>Gorontalo Utara, 6 Mei 2024 06 Mei 2024, SMP Negeri 1 Atinggola melaksanankan Asesmen Sumatif Berbasis Daring Kelas IX Tahun Pelajaran 2023-2024 yang bertujuan untuk mengevaluasi pencapaian belajar peserta pidik pada semester ini. Acara pembukaan secara resmi dilakukan oleh Camat Atinggola, Ismail Polapa S.E. Asesmen sumatif berbasis daring ini merupakan bagian integral dari upaya SMP Negeri 1 Atinggola untuk meningkatkan mutu pendidikan di tengah tantangan yang dihadapi dalam era digital. Dengan menggunakan platform daring yang telah disiapkan oleh sekolah, peserta didik dapat mengikuti ujian secara online dan mengukur pemahaman mereka terhadap materi yang telah dipelajari. Selain itu,menurut wakil kepala sekolah bidang kurikulum yang sekaligus sebagai ketua panitia mengutarakan bahwa asesmen sumatif kelas IX juga bertujuan sebagai ujian akhir kelulusan. Ujian ini merupakan salah satu faktor penentu kelulusan dari SMP Negeri 1 Atinggola. Dalam sambutannya, Ismail Polapa menyampaikan apresiasinya terhadap inisiatif SMP Negeri 1 Atinggola dalam mengadopsi teknologi untuk meningkatkan efisiensi dan efektivitas pembelajaran. \"Pemerintah daerah sangat mendukung langkah-langkah inovatif seperti ini yang bertujuan untuk memberikan pendidikan yang berkualitas kepada generasi muda kita,\" ujarnya. Ia juga menekankan pentingnya kolaborasi antara pihak sekolah, orang tua, dan komunitas dalam mendukung proses pembelajaran siswa. \"Kami berharap asesmen sumatif ini dapat menjadi alat yang berguna untuk mengevaluasi prestasi siswa dan memberikan umpan balik yang konstruktif untuk pengembangan selanjutnya,\" tambah Pak Ismail Polapa. Acara pembukaan juga dihadiri oleh kepala sekolah, guru-guru dan siswa di SMP Negeri 1 Atinggola. Mereka menyambut program asesmen sumatif berbasis daring ini dengan antusiasme dan siap untuk mendukung kelancarannya. Dengan pembukaan resmi oleh Pak Camat Atinggola pada tanggal 6 Mei 2024, asesmen sumatif berbasis daring di SMP Negeri 1 Atinggola telah dimulai. Semoga program ini dapat memberikan manfaat yang besar bagi proses pembelajaran dan perkembangan akademis siswa di sekolah ini.</p>', '53f2e62bed6819e8d23ea630d4a59390.jpeg', 1, '+1+', 'post', 'publish', 'public', 'open', 'camat-atinggola-buka-asesmen-sumatif-berbasis-daring-di-smp-negeri-1-atinggola', 'berita, Asesmensumatif2024', 5, '2023-01-15 21:23:22', '2024-05-27 23:26:39', '2024-05-28 06:26:39', NULL, 0, 1, 1, 0, 'true'),
(5, 'Sample Post 2', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-2', 'berita, pengumuman, sekilas-info', 1, '2023-01-15 21:23:22', '2024-05-27 23:26:39', '2024-05-28 06:26:39', NULL, 0, 0, 1, 0, 'true'),
(6, 'Sample Post 3', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-3', 'berita, pengumuman, sekilas-info', 1, '2023-01-15 21:23:22', '2024-05-27 23:26:39', '2024-05-28 06:26:39', NULL, 0, 0, 1, 0, 'true'),
(7, 'Sample Post 4', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-4', 'berita, pengumuman, sekilas-info', 2, '2023-01-15 21:23:22', '2024-05-27 23:26:39', '2024-05-28 06:26:39', NULL, 0, 0, 1, 0, 'true'),
(8, 'Sample Post 5', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-5', 'berita, pengumuman, sekilas-info', 2, '2023-01-15 21:23:22', '2024-05-27 23:26:39', '2024-05-28 06:26:39', NULL, 0, 0, 1, 0, 'true'),
(9, 'MOTABI KAMBUNGU || KEC. ATINGGOLA TAHUN 2022', 'zd3GntGY0gs?si=aEtRSFMdpMxlPZFz', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2024-05-27 10:38:54', '2024-05-27 23:05:04', '2024-05-28 06:05:04', NULL, 1, 1, 1, 0, 'true'),
(10, 'PERJUSAMI SMPN 1 ATINGGOLA T.P 2022-2023', 'WvVvDPd8p-8?si=HN6WZV2h1neXApC0', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2024-05-28 05:53:50', '2024-05-27 22:53:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(11, 'MPLS SMPN 1 ATINGGOLA T.P 2022-2023', '8qVhov6qiZ4?si=ISr7CvaDtckf_yxI', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2024-05-28 05:57:37', '2024-05-27 22:57:37', NULL, NULL, 1, 0, 0, 0, 'false'),
(12, 'GERAKAN LITERASI SEKOLAH SMP NEGERI 1 ATINGGOLA KABUPATEN GORONTALO UTARA', 'pOSKaWDlkh0?si=RKLk6KVVt6umHhdD', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2024-05-28 06:00:05', '2024-05-27 23:00:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(13, 'Hymne GORONTALO UTARA oleh SMPN 1 Atinggola - dalam rangka HARDIKNAS & HARKITNAS tAHUN 2022', 'qrcten-gVHs?si=BaO5u-IKddVTh4u0', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2024-05-28 06:01:15', '2024-05-27 23:03:16', '2024-05-28 06:03:16', NULL, 1, 1, 1, 0, 'true'),
(14, 'LOMBA PIDATO SMP NEGERI 1 ATINGGOLA', 'D32guJL5AwI?si=4dhN_23usmhLhDfe', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2024-05-28 06:02:08', '2024-05-27 23:02:08', NULL, NULL, 1, 0, 0, 0, 'false'),
(15, 'Hymne GORONTALO UTARA oleh SMPN 1 Atinggola - dalam rangka HARDIKNAS & HARKITNAS tAHUN 2022', 'WvVvDPd8p-8?si=1FZjTG0Q0JJqudE5', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2024-05-28 06:03:36', '2024-05-27 23:03:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(16, 'MOTABI KAMBUNGU || KEC. ATINGGOLA TAHUN 2022', 'zd3GntGY0gs?si=NqhxN1kTAaB-12C4', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2024-05-28 06:05:32', '2024-05-27 23:05:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(17, 'Camat Atinggola Buka Asesmen Sumatif Berbasis Daring di SMP Negeri 1 Atinggola', '<p>Gorontalo Utara, 6 Mei 2024 06 Mei 2024, SMP Negeri 1 Atinggola melaksanankan Asesmen Sumatif Berbasis Daring Kelas IX Tahun Pelajaran 2023-2024 yang bertujuan untuk mengevaluasi pencapaian belajar peserta pidik pada semester ini. Acara pembukaan secara resmi dilakukan oleh Camat Atinggola, Ismail Polapa S.E. Asesmen sumatif berbasis daring ini merupakan bagian integral dari upaya SMP Negeri 1 Atinggola untuk meningkatkan mutu pendidikan di tengah tantangan yang dihadapi dalam era digital. Dengan menggunakan platform daring yang telah disiapkan oleh sekolah, peserta didik dapat mengikuti ujian secara online dan mengukur pemahaman mereka terhadap materi yang telah dipelajari. Selain itu,menurut wakil kepala sekolah bidang kurikulum yang sekaligus sebagai ketua panitia mengutarakan bahwa asesmen sumatif kelas IX juga bertujuan sebagai ujian akhir kelulusan. Ujian ini merupakan salah satu faktor penentu kelulusan dari SMP Negeri 1 Atinggola. Dalam sambutannya, Ismail Polapa menyampaikan apresiasinya terhadap inisiatif SMP Negeri 1 Atinggola dalam mengadopsi teknologi untuk meningkatkan efisiensi dan efektivitas pembelajaran. \"Pemerintah daerah sangat mendukung langkah-langkah inovatif seperti ini yang bertujuan untuk memberikan pendidikan yang berkualitas kepada generasi muda kita,\" ujarnya. Ia juga menekankan pentingnya kolaborasi antara pihak sekolah, orang tua, dan komunitas dalam mendukung proses pembelajaran siswa. \"Kami berharap asesmen sumatif ini dapat menjadi alat yang berguna untuk mengevaluasi prestasi siswa dan memberikan umpan balik yang konstruktif untuk pengembangan selanjutnya,\" tambah Pak Ismail Polapa. Acara pembukaan juga dihadiri oleh kepala sekolah, guru-guru dan siswa di SMP Negeri 1 Atinggola. Mereka menyambut program asesmen sumatif berbasis daring ini dengan antusiasme dan siap untuk mendukung kelancarannya. Dengan pembukaan resmi oleh Pak Camat Atinggola pada tanggal 6 Mei 2024, asesmen sumatif berbasis daring di SMP Negeri 1 Atinggola telah dimulai. Semoga program ini dapat memberikan manfaat yang besar bagi proses pembelajaran dan perkembangan akademis siswa di sekolah ini.</p>', '5d0df6f49606e0621650069cea19e70a.jpeg', 1, '+1+', 'post', 'publish', 'public', 'open', 'camat-atinggola-buka-asesmen-sumatif-berbasis-daring-di-smp-negeri-1-atinggola', '', 2, '2024-05-28 06:27:48', '2024-05-27 23:30:43', NULL, NULL, 1, 0, 0, 0, 'false'),
(18, 'SMP Negeri 1 Atinggola Bantu Korban Banjir di Tolinggula, Gorontalo Utara', '<p>Gorontalo Utara, 3 Mei 2024 - SMP Negeri 1 Atinggola, sebuah sekolah yang terletak di Kabupaten Gorontalo Utara, Provinsi Gorontalo, memberikan bantuan kepada korban banjir di Kecamatan Tolinggula. Banjir yang melanda daerah tersebut telah menyebabkan kerugian besar bagi masyarakat setempat, dan SMP Negeri 1 Atinggola merespons dengan cepat untuk memberikan bantuan yang dibutuhkan. Dalam upaya membantu para korban banjir, siswa dan staf SMP Negeri 1 Atinggola mengumpulkan barang-barang kebutuhan pokok seperti makanan, air bersih, pakaian, selimut, dan perlengkapan mandi. Selain itu, mereka juga menggalang dana untuk mendukung upaya pemulihan dan rekonstruksi di daerah terdampak. Kepala SMP Negeri 1 Atinggola, Ibu Asraty Ibrahim, S.Pd., menyatakan, \"Kami merasa prihatin dengan kondisi para korban banjir di Tolinggula, dan kami ingin memberikan dukungan sebanyak mungkin dalam mengatasi situasi ini. Semoga bantuan yang kami berikan dapat meringankan beban mereka dan membantu proses pemulihan.\" Bantuan dari SMP Negeri 1 Atinggola telah disalurkan secara langsung kepada masyarakat yang terdampak banjir melalui koordinasi dengan pihak terkait di lokasi. Aksi ini merupakan bagian dari komitmen sekolah untuk berkontribusi dalam membantu sesama dan menjadi contoh bagi siswa tentang pentingnya kepedulian sosial dan solidaritas. Para siswa dan staf SMP Negeri 1 Atinggola berharap bahwa bantuan yang mereka berikan dapat membantu memulihkan kehidupan para korban banjir dan memberikan semangat bagi mereka untuk bangkit kembali dari musibah yang mereka alami.</p>', '3d72b42373996ca03dd8ccb3307f89ae.jpeg', 1, '+1+', 'post', 'publish', 'public', 'open', 'smp-negeri-1-atinggola-bantu-korban-banjir-di-tolinggula-gorontalo-utara', '', 4, '2024-05-28 06:30:39', '2024-06-13 09:15:56', NULL, NULL, 1, 0, 0, 0, 'false'),
(19, 'OSIS SMPN1ATINGGOLA', 'C5JoyONyWAP/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2024-05-29 10:47:41', '2024-05-29 04:15:33', '2024-05-29 11:15:33', NULL, 1, 0, 1, 0, 'true'),
(20, 'contoh berita', '<p>contoh&nbsp;</p>', '51e9a19fb53de9dbca13b01b5f7f7181.jpeg', 1, '', 'post', 'publish', 'public', 'open', 'contoh-berita', '', 0, '2024-05-31 20:31:40', '2024-05-31 13:31:40', NULL, NULL, 1, 0, 0, 0, 'false'),
(21, 'contoh 2', '<p>contoh 2</p>', '46c4fa9bfaea99a750ddcd27f303b0b8.jpeg', 1, '+1+', 'post', 'publish', 'public', 'open', 'contoh-2', '', 0, '2024-05-31 20:32:51', '2024-05-31 13:32:51', NULL, NULL, 1, 0, 0, 0, 'false'),
(22, 'contoh 3', '<p>contoh234567</p>', 'd99415c0e59e51ab8f40a93acf4c8ee0.jpeg', 1, '', 'post', 'publish', 'public', 'open', 'contoh-3', '', 0, '2024-05-31 20:37:50', '2024-05-31 13:37:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(23, 'STRUKTUR ORGANISASI', '<p><img src=\"http://localhost/cmssekolahku/media_library/posts/post-image-1717209267615.jpg\" alt=\"\" width=\"8000\" height=\"8000\" /></p>', NULL, 1, NULL, 'page', 'publish', 'public', 'open', 'struktur-organisasi', NULL, 0, '2024-06-01 09:39:44', '2024-06-01 02:51:52', '2024-06-01 09:51:52', NULL, 1, 0, 1, 0, 'true'),
(24, 'STRUKTUR ORGANISASI', '<p><img src=\"http://localhost/cmssekolahku/media_library/posts/post-image-1717209267615.jpg\" alt=\"\" width=\"8000\" height=\"8000\" /></p>', NULL, 1, NULL, 'page', 'publish', 'public', 'open', 'struktur-organisasi', NULL, 0, '2024-06-01 09:39:46', '2024-06-01 02:51:52', '2024-06-01 09:51:52', NULL, 1, 0, 1, 0, 'true'),
(25, 'STRUKTUR ORGANISASI', '<p><img src=\"http://localhost/cmssekolahku/media_library/posts/post-image-1717209267615.jpg\" alt=\"\" width=\"8000\" height=\"8000\" /><img src=\"http://localhost/cmssekolahku/media_library/posts/post-image-1717209605300.jpg\" alt=\"\" width=\"800\" height=\"800\" /></p>', NULL, 1, NULL, 'page', 'publish', 'public', 'open', 'struktur-organisasi', NULL, 0, '2024-06-01 09:40:40', '2024-06-01 02:51:52', '2024-06-01 09:51:52', NULL, 1, 0, 1, 0, 'true'),
(26, 'STRUKTUR ORGANISASI', '<p><img src=\"http://localhost/cmssekolahku/media_library/posts/post-image-1717209267615.jpg\" alt=\"\" width=\"8000\" height=\"8000\" /><img src=\"http://localhost/cmssekolahku/media_library/posts/post-image-1717209605300.jpg\" alt=\"\" width=\"800\" height=\"800\" /></p>', NULL, 1, NULL, 'page', 'publish', 'public', 'open', 'struktur-organisasi', NULL, 0, '2024-06-01 09:40:47', '2024-06-01 02:51:52', '2024-06-01 09:51:52', NULL, 1, 0, 1, 0, 'true'),
(27, 'STRUKTUR', '<p><img src=\"http://localhost/cmssekolahku/media_library/posts/post-image-1717210405447.jpg\" alt=\"\" width=\"1994\" height=\"1994\" /></p>', NULL, 1, NULL, 'page', 'publish', 'public', 'open', 'struktur', NULL, 4, '2024-06-01 09:53:42', '2024-06-01 02:58:44', '2024-06-01 09:58:44', NULL, 1, 1, 1, 0, 'true'),
(28, 'struktur organisasi', '<p><img src=\"http://localhost/cmssekolahku/media_library/posts/post-image-1717210584920.jpg\" alt=\"\" width=\"2733\" height=\"2733\" /></p>', NULL, 1, NULL, 'page', 'publish', 'public', 'open', 'struktur-organisasi', NULL, 9, '2024-06-01 09:56:53', '2024-06-13 09:14:54', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `quotes`
--

CREATE TABLE `quotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quote` varchar(255) DEFAULT NULL,
  `quote_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `quotes`
--

INSERT INTO `quotes` (`id`, `quote`, `quote_by`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Pendidikan merupakan tiket untuk masa depan. Hari esok untuk orang-orang yang telah mempersiapkan dirinya hari ini', '-', '2023-01-15 21:23:22', '2024-05-31 11:27:46', NULL, NULL, 1, 1, 0, 0, 'false'),
(2, 'Semakin banyak kamu membaca, semakin banyak hal yang kamu ketahui. Semakin banyak kamu belajar, semakin banyak tempat yang akan kamu kunjungi', '-', '2023-01-15 21:23:22', '2024-05-31 11:33:34', NULL, NULL, 1, 1, 0, 0, 'false'),
(3, 'Hiduplah seakan-akan kau akan mati besok. Belajarlah seakan-akan kau akan hidup selamanya', '-', '2023-01-15 21:23:22', '2024-05-31 11:28:10', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `scholarships`
--

CREATE TABLE `scholarships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) DEFAULT 0,
  `scholarship_type` bigint(20) DEFAULT 0,
  `scholarship_description` varchar(255) NOT NULL,
  `scholarship_start_year` year(4) NOT NULL,
  `scholarship_end_year` year(4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_group` varchar(100) NOT NULL,
  `setting_variable` varchar(255) DEFAULT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_default_value` text DEFAULT NULL,
  `setting_access_group` varchar(255) DEFAULT NULL,
  `setting_description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `setting_group`, `setting_variable`, `setting_value`, `setting_default_value`, `setting_access_group`, `setting_description`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'general', 'site_maintenance', NULL, 'false', 'public', 'Pemeliharaan situs', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'general', 'site_maintenance_end_date', '2024-05-28', '2022-01-01', 'public', 'Tanggal Berakhir Pemeliharaan Situs', '2023-01-15 21:23:22', '2024-05-28 15:03:01', NULL, NULL, 0, 1, 0, 0, 'false'),
(3, 'general', 'site_cache', NULL, 'false', 'public', 'Cache situs', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'general', 'site_cache_time', NULL, '10', 'public', 'Lama Cache Situs', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'general', 'meta_description', 'smpn1atinggola', 'CMS Sekolahku adalah Content Management System dan PPDB Online gratis untuk SD SMP/Sederajat SMA/Sederajat', 'public', 'Deskripsi Meta', '2023-01-15 21:23:22', '2024-05-28 15:02:29', NULL, NULL, 0, 1, 0, 0, 'false'),
(6, 'general', 'meta_keywords', 'smpn1atinggola', 'CMS, Website Sekolah Gratis, Cara Membuat Website Sekolah, membuat web sekolah, contoh website sekolah, fitur website sekolah, Sekolah, Website, Internet,Situs, CMS Sekolah, Web Sekolah, Website Sekolah Gratis, Website Sekolah, Aplikasi Sekolah, PPDB Online, PSB Online, PSB Online Gratis, Penerimaan Siswa Baru Online, Raport Online, Kurikulum 2013, SD, SMP, SMA, Aliyah, MTs, SMK', 'public', 'Kata Kunci Meta', '2023-01-15 21:23:22', '2024-05-28 15:02:40', NULL, NULL, 0, 1, 0, 0, 'false'),
(7, 'general', 'map_location', NULL, '', 'public', 'Lokasi di Google Maps', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'general', 'favicon', NULL, 'favicon.png', 'public', 'Favicon', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'general', 'header', NULL, 'header.png', 'public', 'Gambar Header', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'general', 'recaptcha_status', NULL, 'disable', 'public', 'reCAPTCHA Status', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'general', 'recaptcha_site_key', NULL, '6LeNCTAUAAAAAADTbL1rDw8GT1DF2DUjVtEXzdMu', 'public', 'Recaptcha Site Key', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'general', 'recaptcha_secret_key', NULL, '6LeNCTAUAAAAAGq8O0ItkzG8fsA9KeJ7mFMMFF1s', 'public', 'Recaptcha Secret Key', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'general', 'timezone', NULL, 'Asia/Jakarta', 'public', 'Time Zone', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(14, 'media', 'file_allowed_types', 'jpg,jng,png,gif', 'jpg, jpeg, png, gif', 'public', 'Tipe file yang diizinkan', '2024-05-29 21:23:22', '2024-05-31 13:09:54', NULL, NULL, 0, 1, 0, 0, 'false'),
(15, 'media', 'upload_max_filesize', '5000', '0', 'public', 'Maksimal Ukuran File yang Diupload', '2023-01-15 21:23:22', '2024-05-27 03:48:04', NULL, NULL, 0, 1, 0, 0, 'false'),
(16, 'media', 'thumbnail_size_height', NULL, '100', 'public', 'Tinggi Gambar Thumbnail', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'media', 'thumbnail_size_width', NULL, '150', 'public', 'Lebar Gambar Thumbnail', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(18, 'media', 'medium_size_height', NULL, '308', 'public', 'Tinggi Gambar Sedang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(19, 'media', 'medium_size_width', NULL, '460', 'public', 'Lebar Gambar Sedang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(20, 'media', 'large_size_height', NULL, '600', 'public', 'Tinggi Gambar Besar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(21, 'media', 'large_size_width', NULL, '800', 'public', 'Lebar Gambar Besar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(22, 'media', 'album_cover_height', NULL, '250', 'public', 'Tinggi Cover Album Foto', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(23, 'media', 'album_cover_width', NULL, '400', 'public', 'Lebar Cover Album Foto', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(24, 'media', 'banner_height', NULL, '81', 'public', 'Tinggi Iklan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(25, 'media', 'banner_width', NULL, '245', 'public', 'Lebar Iklan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(26, 'media', 'image_slider_height', '500', '400', 'public', 'Tinggi Gambar Slide', '2023-01-15 21:23:22', '2024-05-31 13:08:07', NULL, NULL, 0, 1, 0, 0, 'false'),
(27, 'media', 'image_slider_width', NULL, '900', 'public', 'Lebar Gambar Slide', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(28, 'media', 'student_photo_height', NULL, '400', 'public', 'Tinggi Photo Peserta Didik', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(29, 'media', 'student_photo_width', NULL, '300', 'public', 'Lebar Photo Peserta Didik', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(30, 'media', 'employee_photo_height', NULL, '400', 'public', 'Tinggi Photo Guru dan Tenaga Kependidikan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(31, 'media', 'employee_photo_width', '300', '300', 'public', 'Lebar Photo Guru dan Tenaga Kependidikan', '2023-01-15 21:23:22', '2024-05-31 13:09:05', NULL, NULL, 0, 1, 0, 0, 'false'),
(32, 'media', 'headmaster_photo_height', NULL, '400', 'public', 'Tinggi Photo Kepala Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(33, 'media', 'headmaster_photo_width', NULL, '300', 'public', 'Lebar Photo Kepala Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(34, 'media', 'header_height', NULL, '80', 'public', 'Tinggi Gambar Header', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(35, 'media', 'header_width', NULL, '200', 'public', 'Lebar Gambar Header', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(36, 'media', 'logo_height', '140', '120', 'public', 'Tinggi Logo Sekolah', '2023-01-15 21:23:22', '2024-05-31 14:16:03', NULL, NULL, 0, 1, 0, 0, 'false'),
(37, 'media', 'logo_width', '140', '120', 'public', 'Lebar Logo Sekolah', '2023-01-15 21:23:22', '2024-05-31 14:16:12', NULL, NULL, 0, 1, 0, 0, 'false'),
(38, 'writing', 'default_post_category', NULL, '1', 'public', 'Default Kategori Tulisan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(39, 'writing', 'default_post_status', NULL, 'publish', 'public', 'Default Status Tulisan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(40, 'writing', 'default_post_visibility', NULL, 'public', 'public', 'Default Akses Tulisan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(41, 'writing', 'default_post_discussion', NULL, 'open', 'public', 'Default Komentar Tulisan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(42, 'writing', 'post_image_thumbnail_height', NULL, '100', 'public', 'Tinggi Gambar Kecil', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(43, 'writing', 'post_image_thumbnail_width', NULL, '150', 'public', 'Lebar Gambar Kecil', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(44, 'writing', 'post_image_medium_height', '300', '250', 'public', 'Tinggi Gambar Sedang', '2023-01-15 21:23:22', '2024-05-31 13:19:19', NULL, NULL, 0, 1, 0, 0, 'false'),
(45, 'writing', 'post_image_medium_width', NULL, '400', 'public', 'Lebar Gambar Sedang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(46, 'writing', 'post_image_large_height', NULL, '450', 'public', 'Tinggi Gambar Besar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(47, 'writing', 'post_image_large_width', NULL, '840', 'public', 'Lebar Gambar Besar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(48, 'reading', 'post_per_page', NULL, '10', 'public', 'Tulisan per halaman', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(49, 'reading', 'post_rss_count', NULL, '10', 'public', 'Jumlah RSS', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(50, 'reading', 'post_related_count', NULL, '10', 'public', 'Jumlah Tulisan Terkait', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(51, 'reading', 'comment_per_page', NULL, '10', 'public', 'Komentar per halaman', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(52, 'discussion', 'comment_moderation', NULL, 'false', 'public', 'Komentar harus disetujui secara manual', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(53, 'discussion', 'comment_registration', NULL, 'false', 'public', 'Pengguna harus terdaftar dan login untuk komentar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(54, 'discussion', 'comment_blacklist', 'ya', 'kampret', 'public', 'Komentar disaring', '2023-01-15 21:23:22', '2024-05-27 03:42:31', NULL, NULL, 0, 1, 0, 0, 'false'),
(55, 'discussion', 'comment_order', NULL, 'asc', 'public', 'Urutan Komentar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(56, 'social_account', 'facebook', 'https://www.facebook.com/hubmas.spensaatinggola?mibextid=ZbWKwL', '', 'public', 'Facebook', '2023-01-15 21:23:22', '2024-05-31 12:35:50', NULL, NULL, 0, 1, 0, 0, 'false'),
(57, 'social_account', 'twitter', '#', '', 'public', 'Twitter', '2023-01-15 21:23:22', '2024-05-31 12:36:53', NULL, NULL, 0, 1, 0, 0, 'false'),
(58, 'social_account', 'linked_in', NULL, '', 'public', 'Linked In', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(59, 'social_account', 'youtube', 'https://www.youtube.com/@smpnegeri1atinggola295', '', 'public', 'Youtube', '2023-01-15 21:23:22', '2024-05-31 12:38:40', NULL, NULL, 0, 1, 0, 0, 'false'),
(60, 'social_account', 'instagram', 'https://www.instagram.com/pms_mbkm_smpn1atinggola2024?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==', '', 'public', 'Instagram', '2023-01-15 21:23:22', '2024-05-31 12:35:20', NULL, NULL, 0, 1, 0, 0, 'false'),
(61, 'mail_server', 'smtp_host', NULL, '', 'private', 'SMTP Server Address', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(62, 'mail_server', 'smtp_user', NULL, '', 'private', 'SMTP Username', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(63, 'mail_server', 'smtp_pass', NULL, '', 'private', 'SMTP Password', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(64, 'mail_server', 'smtp_port', NULL, '', 'public', 'SMTP Port', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(65, 'school_profile', 'npsn', NULL, '123', 'public', 'NPSN', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(66, 'school_profile', 'school_name', 'SMP NEGERI 1 ATINGGOLA', 'SMA Negeri 9 Kuningan', 'public', 'Nama Sekolah', '2023-01-15 21:23:22', '2024-05-31 14:14:01', NULL, NULL, 0, 1, 0, 0, 'false'),
(67, 'school_profile', 'headmaster', 'Asraty Ibrahim, S.Pd', 'Anton Sofyan', 'public', 'Kepala Sekolah', '2023-01-15 21:23:22', '2024-05-26 06:53:37', NULL, NULL, 0, 1, 0, 0, 'false'),
(68, 'school_profile', 'headmaster_photo', '99c80bc09bc019cdd1c442f1cd9edc83.jpeg', 'headmaster_photo.png', 'public', 'Photo Kepala Sekolah', '2023-01-15 21:23:22', '2024-05-31 13:34:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(69, 'school_profile', 'school_level', NULL, '3', 'public', 'Bentuk Pendidikan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(70, 'school_profile', 'school_status', NULL, '1', 'public', 'Status Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(71, 'school_profile', 'ownership_status', NULL, '1', 'public', 'Status Kepemilikan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(72, 'school_profile', 'decree_operating_permit', NULL, '-', 'public', 'SK Izin Operasional', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(73, 'school_profile', 'decree_operating_permit_date', NULL, '2023-01-15', 'public', 'Tanggal SK Izin Operasional', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(74, 'school_profile', 'tagline', 'Pendidikan Berkualitas untuk Generasi Emas', 'Where Tomorrow\'s Leaders Come Together', 'public', 'Slogan', '2023-01-15 21:23:22', '2024-05-26 06:58:02', NULL, NULL, 0, 1, 0, 0, 'false'),
(75, 'school_profile', 'rt', NULL, '12', 'public', 'RT', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(76, 'school_profile', 'rw', NULL, '06', 'public', 'RW', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(77, 'school_profile', 'sub_village', '3', 'Wage', 'public', 'Dusun', '2023-01-15 21:23:22', '2024-05-26 06:56:28', NULL, NULL, 0, 1, 0, 0, 'false'),
(78, 'school_profile', 'village', 'kota jin', 'Kadugede', 'public', 'Kelurahan / Desa', '2023-01-15 21:23:22', '2024-05-26 06:58:12', NULL, NULL, 0, 1, 0, 0, 'false'),
(79, 'school_profile', 'sub_district', 'Atinggola', 'Kadugede', 'public', 'Kecamatan', '2023-01-15 21:23:22', '2024-05-26 06:56:12', NULL, NULL, 0, 1, 0, 0, 'false'),
(80, 'school_profile', 'district', 'Gorontalo Utara', 'Kuningan', 'public', 'Kota/Kabupaten', '2023-01-15 21:23:22', '2024-05-26 06:50:55', NULL, NULL, 0, 1, 0, 0, 'false'),
(81, 'school_profile', 'postal_code', '96253', '45561', 'public', 'Kode Pos', '2023-01-15 21:23:22', '2024-05-27 04:21:50', NULL, NULL, 0, 1, 0, 0, 'false'),
(82, 'school_profile', 'street_address', 'W429+C34, Kota Jin, Kec. Atinggola, Kabupaten Gorontalo Utara, Gorontalo 96253', 'Jalan Raya Kadugede No. 11', 'public', 'Alamat Jalan', '2023-01-15 21:23:22', '2024-05-26 07:05:32', NULL, NULL, 0, 1, 0, 0, 'false'),
(83, 'school_profile', 'phone', NULL, '0232123456', 'public', 'Telepon', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(84, 'school_profile', 'fax', NULL, '0232123456', 'public', 'Fax', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(85, 'school_profile', 'email', 'smpn1atinggola@gmail.com', 'info@sman9kuningan.sch.id', 'public', 'Email', '2023-01-15 21:23:22', '2024-05-26 06:51:22', NULL, NULL, 0, 1, 0, 0, 'false'),
(86, 'school_profile', 'website', 'http://www.smpn1atinggola.sch.id', 'http://www.sman9kuningan.sch.id', 'public', 'Website', '2023-01-15 21:23:22', '2024-05-26 06:59:03', NULL, NULL, 0, 1, 0, 0, 'false'),
(87, 'school_profile', 'logo', 'c5d903c6d8bdb56ee42f26657a42ce94.png', 'logo.png', 'public', 'Logo', '2023-01-15 21:23:22', '2024-05-31 14:16:31', NULL, NULL, 0, 0, 0, 0, 'false'),
(88, 'admission', 'admission_status', NULL, 'open', 'public', 'Status Penerimaan Peserta Didik Baru', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(89, 'admission', 'admission_year', '2024', '2023', 'public', 'Tahun Penerimaan Peserta Didik Baru', '2023-01-15 21:23:22', '2024-05-26 07:33:02', NULL, NULL, 0, 1, 0, 0, 'false'),
(90, 'admission', 'admission_start_date', '2024-06-01', '2022-01-01', 'public', 'Tanggal Mulai PPDB', '2023-01-15 21:23:22', '2024-06-01 03:57:37', NULL, NULL, 0, 1, 0, 0, 'false'),
(91, 'admission', 'admission_end_date', '2024-06-20', '2022-12-31', 'public', 'Tanggal Selesai PPDB', '2023-01-15 21:23:22', '2024-05-26 07:32:12', NULL, NULL, 0, 1, 0, 0, 'false'),
(92, 'admission', 'announcement_start_date', '2024-07-04', '2022-01-01', 'public', 'Tanggal Mulai Pengumuman Hasil Seleksi PPDB', '2023-01-15 21:23:22', '2024-05-26 07:34:10', NULL, NULL, 0, 1, 0, 0, 'false'),
(93, 'admission', 'announcement_end_date', '2024-07-02', '2022-12-31', 'public', 'Tanggal Selesai Pengumuman Hasil Seleksi PPDB', '2023-01-15 21:23:22', '2024-05-26 07:33:25', NULL, NULL, 0, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `major_id` bigint(20) DEFAULT 0 COMMENT 'Program Keahlian',
  `first_choice_id` bigint(20) DEFAULT 0 COMMENT 'Pilihan Pertama PPDB',
  `second_choice_id` bigint(20) DEFAULT 0 COMMENT 'Pilihan Kedua PPDB',
  `registration_number` varchar(10) DEFAULT NULL COMMENT 'Nomor Pendaftaran',
  `admission_exam_number` varchar(10) DEFAULT NULL COMMENT 'Nomor Ujian Tes Tulis',
  `selection_result` varchar(100) DEFAULT NULL COMMENT 'Hasil Seleksi PPDB/PMB',
  `admission_phase_id` bigint(20) DEFAULT 0 COMMENT 'Gelombang Pendaftaran',
  `admission_type_id` bigint(20) DEFAULT 0 COMMENT 'Jalur Pendaftaran',
  `photo` varchar(100) DEFAULT NULL,
  `achievement` text DEFAULT NULL COMMENT 'Prestasi Calon Peserta Didik / Mahasiswa',
  `is_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Apakah Siswa Aktif ? Set true jika lolos seleksi PPDB dan set FALSE jika sudah lulus',
  `is_prospective_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Apakah Calon Siswa Baru ?',
  `is_alumni` enum('true','false','unverified') NOT NULL DEFAULT 'false' COMMENT 'Apakah Alumni?',
  `is_transfer` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Jenis Pendaftaran : Baru / Pindahan ?',
  `re_registration` enum('true','false') DEFAULT NULL COMMENT 'Konfirmasi Pendaftaran Ulang Calon Siswa Baru',
  `start_date` date DEFAULT NULL COMMENT 'Tanggal Masuk Sekolah',
  `identity_number` varchar(50) DEFAULT NULL COMMENT 'NIS/NIM',
  `nisn` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Siswa Nasional',
  `nik` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Kependudukan/KTP',
  `prev_exam_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Peserta Ujian Sebelumnya',
  `prev_diploma_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Ijazah Sebelumnya',
  `paud` enum('true','false') DEFAULT NULL COMMENT 'Apakah Pernah PAUD',
  `tk` enum('true','false') DEFAULT NULL COMMENT 'Apakah Pernah TK',
  `skhun` varchar(50) DEFAULT NULL COMMENT 'No. Seri Surat Keterangan Hasil Ujian Nasional Sebelumnya',
  `prev_school_name` varchar(255) DEFAULT NULL COMMENT 'Nama Sekolah Sebelumnya',
  `prev_school_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Sekolah Sebelumnya',
  `hobby` varchar(255) DEFAULT NULL,
  `ambition` varchar(255) DEFAULT NULL COMMENT 'Cita-Cita',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `religion_id` bigint(20) DEFAULT 0,
  `special_need_id` bigint(20) DEFAULT 0 COMMENT 'Berkeburuhan Khusus',
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kota/Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `residence_id` bigint(20) DEFAULT 0 COMMENT 'Tempat Tinggal',
  `transportation_id` bigint(20) DEFAULT 0 COMMENT 'Moda Transportasi',
  `phone` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `sktm` varchar(100) DEFAULT NULL COMMENT 'Surat Keterangan Tidak Mampu (SKTM)',
  `kks` varchar(100) DEFAULT NULL COMMENT 'Kartu Keluarga Sejahtera (KKS)',
  `kps` varchar(100) DEFAULT NULL COMMENT 'Kartu Pra Sejahtera (KPS)',
  `kip` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Pintar (KIP)',
  `kis` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Sehat (KIS)',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `father_name` varchar(150) DEFAULT NULL,
  `father_birth_year` year(4) DEFAULT NULL,
  `father_education_id` bigint(20) DEFAULT 0,
  `father_employment_id` bigint(20) DEFAULT 0,
  `father_monthly_income_id` bigint(20) DEFAULT 0,
  `father_special_need_id` bigint(20) DEFAULT 0,
  `mother_name` varchar(150) DEFAULT NULL,
  `mother_birth_year` year(4) DEFAULT NULL,
  `mother_education_id` bigint(20) DEFAULT 0,
  `mother_employment_id` bigint(20) DEFAULT 0,
  `mother_monthly_income_id` bigint(20) DEFAULT 0,
  `mother_special_need_id` bigint(20) DEFAULT 0,
  `guardian_name` varchar(150) DEFAULT NULL,
  `guardian_birth_year` year(4) DEFAULT NULL,
  `guardian_education_id` bigint(20) DEFAULT 0,
  `guardian_employment_id` bigint(20) DEFAULT 0,
  `guardian_monthly_income_id` bigint(20) DEFAULT 0,
  `mileage` smallint(6) DEFAULT NULL COMMENT 'Jarak tempat tinggal ke sekolah',
  `traveling_time` smallint(6) DEFAULT NULL COMMENT 'Waktu Tempuh',
  `height` smallint(6) DEFAULT NULL COMMENT 'Tinggi Badan',
  `weight` smallint(6) DEFAULT NULL COMMENT 'Berat Badan',
  `sibling_number` smallint(6) DEFAULT 0 COMMENT 'Jumlah Saudara Kandung',
  `student_status_id` bigint(20) DEFAULT 0 COMMENT 'Status siswa',
  `end_date` date DEFAULT NULL COMMENT 'Tanggal Keluar',
  `reason` varchar(255) DEFAULT NULL COMMENT 'Diisi jika peserta didik sudah keluar',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `students`
--

INSERT INTO `students` (`id`, `major_id`, `first_choice_id`, `second_choice_id`, `registration_number`, `admission_exam_number`, `selection_result`, `admission_phase_id`, `admission_type_id`, `photo`, `achievement`, `is_student`, `is_prospective_student`, `is_alumni`, `is_transfer`, `re_registration`, `start_date`, `identity_number`, `nisn`, `nik`, `prev_exam_number`, `prev_diploma_number`, `paud`, `tk`, `skhun`, `prev_school_name`, `prev_school_address`, `hobby`, `ambition`, `full_name`, `gender`, `birth_place`, `birth_date`, `religion_id`, `special_need_id`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `residence_id`, `transportation_id`, `phone`, `mobile_phone`, `email`, `sktm`, `kks`, `kps`, `kip`, `kis`, `citizenship`, `country`, `father_name`, `father_birth_year`, `father_education_id`, `father_employment_id`, `father_monthly_income_id`, `father_special_need_id`, `mother_name`, `mother_birth_year`, `mother_education_id`, `mother_employment_id`, `mother_monthly_income_id`, `mother_special_need_id`, `guardian_name`, `guardian_birth_year`, `guardian_education_id`, `guardian_employment_id`, `guardian_monthly_income_id`, `mileage`, `traveling_time`, `height`, `weight`, `sibling_number`, `student_status_id`, `end_date`, `reason`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 0, 0, 0, NULL, NULL, NULL, 0, 0, 'dd56496ade21918baa80cbbf6b682ba6.jpg', NULL, 'false', 'false', 'true', 'false', NULL, NULL, '532421077', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Chrisnaldy', 'M', NULL, '2002-10-03', 0, 0, 'tuntung', '', '', '', '', '', '', '', 0, 0, '082291323045', '082291323045', 'chirisnaldyt@gmail.com', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2018-06-20', '', '2024-05-27 10:59:39', '2024-05-31 14:03:58', NULL, NULL, NULL, 1, 0, 0, 'false'),
(2, 0, 0, 0, '2023000001', NULL, NULL, 0, 187, '4ff1add631157f65836b5c78df43dcb2.jpg', NULL, 'false', 'true', 'false', 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'game', 'pengusaha', 'chrisnaldi', 'M', 'saiu', '2002-10-03', 89, 23, 'trans sulawesi', NULL, NULL, NULL, 'tuntung', 'pinogaluman', 'bolaang mogondow utara', '976565', 74, 81, '0987654', '09876543', 'aldym@gmail.com', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'naldy', 1988, 45, 11, 69, 23, 'ani', 1990, 45, 10, 68, 23, NULL, NULL, 0, 0, 0, 8000, 15, 167, 87, 2, 0, NULL, NULL, '2024-06-01 10:49:58', '2024-06-01 03:56:19', '2024-06-01 10:56:19', NULL, 0, 1, 1, 0, 'true'),
(3, 0, 0, 0, '2023000002', NULL, NULL, 0, 187, '3408c5d2f12c2387fb84388c5fa8fe1e.jpg', NULL, 'false', 'true', 'false', 'false', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'banyak', 'pengusaha', 'chrisnaldi', 'M', 'swiss', '2002-10-03', 89, 23, 'jalan trans sulawesi', NULL, NULL, NULL, 'tuntung', 'pinogaluman', 'bolaang mongondow utara', '65456', 74, 81, '098765487654', '098765487654', 'chrisnaldy@gmail.com', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'Naldy', 1988, 45, 11, 69, 23, 'ani', 1990, 45, 10, 0, 23, NULL, NULL, 0, 0, 0, 8000, 15, 169, 87, 2, 0, NULL, NULL, '2024-06-01 11:03:33', '2024-06-02 14:37:55', '2024-06-02 21:37:55', NULL, 0, 0, 1, 0, 'true');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tags`
--

INSERT INTO `tags` (`id`, `tag`, `slug`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Berita', 'berita', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Pengumuman', 'pengumuman', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Sekilas Info', 'sekilas-info', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'Asesmensumatif2024', 'asesmensumatif2024', '2024-05-28 06:24:38', '2024-05-27 23:24:38', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `themes`
--

CREATE TABLE `themes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `theme_name` varchar(255) NOT NULL,
  `theme_folder` varchar(255) DEFAULT NULL,
  `theme_author` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_folder`, `theme_author`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Sky Light', 'sky_light', 'Anton Sofyan', 'false', '2023-01-15 21:23:22', '2024-05-28 14:28:54', NULL, NULL, 1, 1, 0, 0, 'false'),
(2, 'Blue Sky', 'blue_sky', 'Anton Sofyan', 'false', '2023-01-15 21:23:22', '2024-05-28 23:31:32', NULL, NULL, 1, 1, 0, 0, 'false'),
(3, 'Green Land', 'green_land', 'chrisnaldi', 'false', '2023-01-15 21:23:22', '2024-05-31 11:39:01', NULL, NULL, 1, 1, 0, 0, 'false'),
(4, 'orange', 'orange', 'chrisnaldy', 'false', '2024-05-26 21:38:52', '2024-05-27 03:27:29', NULL, NULL, 1, 1, 0, 0, 'false'),
(5, 'Barka', 'barka', 'chrisnaldy', 'true', '2024-05-28 20:44:35', '2024-05-31 11:39:01', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_full_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_url` varchar(100) DEFAULT NULL,
  `user_group_id` bigint(20) DEFAULT 0,
  `user_type` enum('super_user','administrator','employee','student') NOT NULL DEFAULT 'administrator',
  `user_profile_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'student_id OR employee_id',
  `user_biography` text DEFAULT NULL,
  `user_forgot_password_key` varchar(100) DEFAULT NULL,
  `user_forgot_password_request_date` date DEFAULT NULL,
  `has_login` enum('true','false') DEFAULT 'false',
  `last_logged_in` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_password`, `user_full_name`, `user_email`, `user_url`, `user_group_id`, `user_type`, `user_profile_id`, `user_biography`, `user_forgot_password_key`, `user_forgot_password_request_date`, `has_login`, `last_logged_in`, `ip_address`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'administrator', '$2y$10$6jtRndlVjf7yTXeZy7kuZ.RLf2lYMsSiuYJ3uvclHRm573Yzd3MA.', 'Administrator', 'admin@admin.com', 'sekolahku.web.id', 0, 'super_user', NULL, NULL, NULL, NULL, 'true', '2024-06-13 02:21:24', '::1', '2023-01-15 21:23:22', '2024-06-13 00:21:24', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_groups`
--

CREATE TABLE `user_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_groups`
--

INSERT INTO `user_groups` (`id`, `user_group`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Admin', '2024-05-30 06:48:29', '2024-05-29 23:48:29', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_privileges`
--

CREATE TABLE `user_privileges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group_id` bigint(20) DEFAULT 0,
  `module_id` bigint(20) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_privileges`
--

INSERT INTO `user_privileges` (`id`, `user_group_id`, `module_id`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, 2, '2024-05-30 06:48:53', '2024-05-29 23:48:53', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 1, 3, '2024-05-30 06:49:00', '2024-05-29 23:49:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 1, 4, '2024-05-30 06:49:06', '2024-05-29 23:49:06', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, 1, 5, '2024-05-30 06:49:12', '2024-05-29 23:49:12', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, 1, 6, '2024-05-30 06:49:19', '2024-05-29 23:49:19', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `_sessions`
--

CREATE TABLE `_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `_sessions`
--

INSERT INTO `_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('908478gp15u8b3fc5i4vamm3f9mvsf9q', '::1', 1718249824, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731383234393738323b746f6b656e7c733a33323a226134653139303039643461346535333232343631633163373336613838323236223b637372665f746f6b656e7c733a33323a226134653139303039643461346535333232343631633163373336613838323236223b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323032342d30352d3238223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a31343a22736d706e316174696e67676f6c61223b6d6574615f6b6579776f7264737c733a31343a22736d706e316174696e67676f6c61223b6d61705f6c6f636174696f6e7c733a303a22223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31353a226a70672c6a6e672c706e672c676966223b75706c6f61645f6d61785f66696c6573697a657c733a343a2235303030223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22353030223b696d6167655f736c696465725f77696474687c733a333a22393030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313430223b6c6f676f5f77696474687c733a333a22313430223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22333030223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a323a227961223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a36333a2268747470733a2f2f7777772e66616365626f6f6b2e636f6d2f6875626d61732e7370656e73616174696e67676f6c613f6d696265787469643d5a62574b774c223b747769747465727c733a313a2223223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a34373a2268747470733a2f2f7777772e796f75747562652e636f6d2f40736d706e6567657269316174696e67676f6c61323935223b696e7374616772616d7c733a3131323a2268747470733a2f2f7777772e696e7374616772616d2e636f6d2f706d735f6d626b6d5f736d706e316174696e67676f6c61323032343f75746d5f736f757263653d69675f7765625f627574746f6e5f73686172655f736865657426696773683d5a444e6c5a4463304d7a49784e773d3d223b736d74705f706f72747c733a303a22223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a32323a22534d50204e45474552492031204154494e47474f4c41223b686561646d61737465727c733a32303a22417372617479204962726168696d2c20532e5064223b686561646d61737465725f70686f746f7c733a33373a2239396338306263303962633031396364643163343432663163643965646338332e6a706567223b7363686f6f6c5f6c6576656c7c733a313a224d223b7363686f6f6c5f7374617475737c733a313a2231223b6f776e6572736869705f7374617475737c733a313a2231223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323032332d30312d3135223b7461676c696e657c733a34323a2250656e646964696b616e204265726b75616c6974617320756e74756b2047656e657261736920456d6173223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a313a2233223b76696c6c6167657c733a383a226b6f7461206a696e223b7375625f64697374726963747c733a393a224174696e67676f6c61223b64697374726963747c733a31353a22476f726f6e74616c6f205574617261223b706f7374616c5f636f64657c733a353a223936323533223b7374726565745f616464726573737c733a37383a22573432392b4333342c204b6f7461204a696e2c204b65632e204174696e67676f6c612c204b616275706174656e20476f726f6e74616c6f2055746172612c20476f726f6e74616c6f203936323533223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32343a22736d706e316174696e67676f6c6140676d61696c2e636f6d223b776562736974657c733a33323a22687474703a2f2f7777772e736d706e316174696e67676f6c612e7363682e6964223b6c6f676f7c733a33363a2263356439303363366438626462353665653432663236363537613432636539342e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303233223b61646d697373696f6e5f73746172745f646174657c733a31303a22323032342d30362d3031223b61646d697373696f6e5f656e645f646174657c733a31303a22323032342d30362d3330223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323032342d30372d3034223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323032342d30372d3032223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a373a224a75727573616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a353a226261726b61223b61646d697373696f6e5f73656d65737465725f69647c733a313a2231223b61646d697373696f6e5f73656d65737465727c733a393a22323032332d32303234223b63757272656e745f61636164656d69635f796561725f69647c733a313a2231223b63757272656e745f61636164656d69635f796561727c733a393a22323032332d32303234223b63757272656e745f61636164656d69635f73656d65737465727c733a343a226576656e223b61646d697373696f6e5f70686173655f69647c733a313a2231223b61646d697373696f6e5f70686173657c733a373a2250657274616d61223b6d616a6f725f636f756e747c623a303b757365725f69647c733a313a2231223b757365725f6e616d657c733a31333a2261646d696e6973747261746f72223b757365725f656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f747970657c733a31303a2273757065725f75736572223b757365725f70726f66696c655f69647c4e3b6861735f6c6f67696e7c623a313b757365725f70726976696c656765737c613a31343a7b693a303b733a393a2264617368626f617264223b693a313b733a31353a226368616e67655f70617373776f7264223b693a323b733a31313a226d61696e74656e616e6365223b693a333b733a353a227573657273223b693a343b733a393a2261646d697373696f6e223b693a353b733a31303a22617070656172616e6365223b693a363b733a343a22626c6f67223b693a373b733a393a22656d706c6f79656573223b693a383b733a353a226d65646961223b693a393b733a373a22706c7567696e73223b693a31303b733a393a227265666572656e6365223b693a31313b733a383a2273657474696e6773223b693a31323b733a383a2261636164656d6963223b693a31333b733a373a2270726f66696c65223b7d736d74705f686f73747c733a303a22223b736d74705f757365727c733a303a22223b736d74705f706173737c733a303a22223b),
('1ojdd4s64eg2od4kgq4kjuavr3qj9so7', '::1', 1718272746, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731383237323734363b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323032342d30352d3238223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a31343a22736d706e316174696e67676f6c61223b6d6574615f6b6579776f7264737c733a31343a22736d706e316174696e67676f6c61223b6d61705f6c6f636174696f6e7c733a303a22223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31353a226a70672c6a6e672c706e672c676966223b75706c6f61645f6d61785f66696c6573697a657c733a343a2235303030223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22353030223b696d6167655f736c696465725f77696474687c733a333a22393030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313430223b6c6f676f5f77696474687c733a333a22313430223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22333030223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a323a227961223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a36333a2268747470733a2f2f7777772e66616365626f6f6b2e636f6d2f6875626d61732e7370656e73616174696e67676f6c613f6d696265787469643d5a62574b774c223b747769747465727c733a313a2223223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a34373a2268747470733a2f2f7777772e796f75747562652e636f6d2f40736d706e6567657269316174696e67676f6c61323935223b696e7374616772616d7c733a3131323a2268747470733a2f2f7777772e696e7374616772616d2e636f6d2f706d735f6d626b6d5f736d706e316174696e67676f6c61323032343f75746d5f736f757263653d69675f7765625f627574746f6e5f73686172655f736865657426696773683d5a444e6c5a4463304d7a49784e773d3d223b736d74705f706f72747c733a303a22223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a32323a22534d50204e45474552492031204154494e47474f4c41223b686561646d61737465727c733a32303a22417372617479204962726168696d2c20532e5064223b686561646d61737465725f70686f746f7c733a33373a2239396338306263303962633031396364643163343432663163643965646338332e6a706567223b7363686f6f6c5f6c6576656c7c733a313a224d223b7363686f6f6c5f7374617475737c733a313a2231223b6f776e6572736869705f7374617475737c733a313a2231223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323032332d30312d3135223b7461676c696e657c733a34323a2250656e646964696b616e204265726b75616c6974617320756e74756b2047656e657261736920456d6173223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a313a2233223b76696c6c6167657c733a383a226b6f7461206a696e223b7375625f64697374726963747c733a393a224174696e67676f6c61223b64697374726963747c733a31353a22476f726f6e74616c6f205574617261223b706f7374616c5f636f64657c733a353a223936323533223b7374726565745f616464726573737c733a37383a22573432392b4333342c204b6f7461204a696e2c204b65632e204174696e67676f6c612c204b616275706174656e20476f726f6e74616c6f2055746172612c20476f726f6e74616c6f203936323533223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32343a22736d706e316174696e67676f6c6140676d61696c2e636f6d223b776562736974657c733a33323a22687474703a2f2f7777772e736d706e316174696e67676f6c612e7363682e6964223b6c6f676f7c733a33363a2263356439303363366438626462353665653432663236363537613432636539342e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303233223b61646d697373696f6e5f73746172745f646174657c733a31303a22323032342d30362d3031223b61646d697373696f6e5f656e645f646174657c733a31303a22323032342d30362d3330223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323032342d30372d3034223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323032342d30372d3032223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a373a224a75727573616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a353a226261726b61223b61646d697373696f6e5f73656d65737465725f69647c733a313a2231223b61646d697373696f6e5f73656d65737465727c733a393a22323032332d32303234223b63757272656e745f61636164656d69635f796561725f69647c733a313a2231223b63757272656e745f61636164656d69635f796561727c733a393a22323032332d32303234223b63757272656e745f61636164656d69635f73656d65737465727c733a343a226576656e223b61646d697373696f6e5f70686173655f69647c733a313a2231223b61646d697373696f6e5f70686173657c733a373a2250657274616d61223b6d616a6f725f636f756e747c623a303b746f6b656e7c733a33323a223361353336356662303533646437666566353637303536633736666230663032223b637372665f746f6b656e7c733a33323a223361353336356662303533646437666566353637303536633736666230663032223b);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `academic_year` (`academic_year`);

--
-- Indeks untuk tabel `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `achievements_student_id__idx` (`student_id`) USING BTREE;

--
-- Indeks untuk tabel `admission_phases`
--
ALTER TABLE `admission_phases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`phase_name`),
  ADD KEY `admission_phases_academic_year_id__idx` (`academic_year_id`) USING BTREE;

--
-- Indeks untuk tabel `admission_quotas`
--
ALTER TABLE `admission_quotas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`admission_type_id`,`major_id`),
  ADD KEY `admission_quotas_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  ADD KEY `admission_quotas_admission_type_id__idx` (`admission_type_id`) USING BTREE,
  ADD KEY `admission_quotas_major_id__idx` (`major_id`) USING BTREE;

--
-- Indeks untuk tabel `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `album_title` (`album_title`);

--
-- Indeks untuk tabel `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`question_id`,`answer`),
  ADD KEY `answers_question_id__idx` (`question_id`) USING BTREE;

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`category_name`,`category_type`);

--
-- Indeks untuk tabel `class_groups`
--
ALTER TABLE `class_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`class_group`,`sub_class_group`,`major_id`),
  ADD KEY `class_groups_major_id__idx` (`major_id`) USING BTREE;

--
-- Indeks untuk tabel `class_group_settings`
--
ALTER TABLE `class_group_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`class_group_id`),
  ADD KEY `class_group_settings_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  ADD KEY `class_group_settings_class_group_id__idx` (`class_group_id`) USING BTREE;

--
-- Indeks untuk tabel `class_group_students`
--
ALTER TABLE `class_group_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`class_group_setting_id`,`student_id`),
  ADD KEY `class_group_students_class_group_setting_id__idx` (`class_group_setting_id`) USING BTREE,
  ADD KEY `class_group_students_student_id__idx` (`student_id`) USING BTREE;

--
-- Indeks untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_comment_post_id__idx` (`comment_post_id`) USING BTREE;

--
-- Indeks untuk tabel `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_nik__idx` (`nik`) USING BTREE,
  ADD KEY `employees_full_name__idx` (`full_name`) USING BTREE,
  ADD KEY `employees_email__idx` (`email`) USING BTREE,
  ADD KEY `employees_religion_id__idx` (`religion_id`) USING BTREE,
  ADD KEY `employees_marriage_status_id__idx` (`marriage_status_id`) USING BTREE,
  ADD KEY `employees_spouse_employment_id__idx` (`spouse_employment_id`) USING BTREE,
  ADD KEY `employees_employment_status_id__idx` (`employment_status_id`) USING BTREE,
  ADD KEY `employees_employment_type_id__idx` (`employment_type_id`) USING BTREE,
  ADD KEY `employees_institution_lifter_id__idx` (`institution_lifter_id`) USING BTREE,
  ADD KEY `employees_rank_id__idx` (`rank_id`) USING BTREE,
  ADD KEY `employees_salary_source_id__idx` (`salary_source_id`) USING BTREE,
  ADD KEY `employees_laboratory_skill_id__idx` (`laboratory_skill_id`) USING BTREE,
  ADD KEY `employees_special_need_id__idx` (`special_need_id`) USING BTREE;

--
-- Indeks untuk tabel `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_file_category_id__idx` (`file_category_id`) USING BTREE;

--
-- Indeks untuk tabel `image_sliders`
--
ALTER TABLE `image_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`link_url`,`link_type`);

--
-- Indeks untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `major_name` (`major_name`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_name` (`module_name`);

--
-- Indeks untuk tabel `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`option_group`,`option_name`),
  ADD KEY `options_option_group__idx` (`option_group`) USING BTREE;

--
-- Indeks untuk tabel `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_photo_album_id__idx` (`photo_album_id`) USING BTREE;

--
-- Indeks untuk tabel `pollings`
--
ALTER TABLE `pollings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pollings_answer_id__idx` (`answer_id`) USING BTREE;

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_post_author__idx` (`post_author`) USING BTREE;

--
-- Indeks untuk tabel `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question` (`question`);

--
-- Indeks untuk tabel `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`quote`,`quote_by`);

--
-- Indeks untuk tabel `scholarships`
--
ALTER TABLE `scholarships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scholarships_student_id__idx` (`student_id`) USING BTREE;

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`setting_group`,`setting_variable`);

--
-- Indeks untuk tabel `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_registration_number__idx` (`registration_number`) USING BTREE,
  ADD KEY `students_identity_number__idx` (`identity_number`) USING BTREE,
  ADD KEY `students_full_name__idx` (`full_name`) USING BTREE,
  ADD KEY `students_first_choice_id__idx` (`first_choice_id`) USING BTREE,
  ADD KEY `students_second_choice_id__idx` (`second_choice_id`) USING BTREE,
  ADD KEY `students_major_id__idx` (`major_id`) USING BTREE,
  ADD KEY `students_admission_phase_id__idx` (`admission_phase_id`) USING BTREE,
  ADD KEY `students_admission_type_id__idx` (`admission_type_id`) USING BTREE,
  ADD KEY `students_student_status_id__idx` (`student_status_id`) USING BTREE;

--
-- Indeks untuk tabel `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag` (`tag`);

--
-- Indeks untuk tabel `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `theme_name` (`theme_name`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD KEY `users_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `users_user_profile_id__idx` (`user_profile_id`) USING BTREE;

--
-- Indeks untuk tabel `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_group` (`user_group`);

--
-- Indeks untuk tabel `user_privileges`
--
ALTER TABLE `user_privileges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`user_group_id`,`module_id`),
  ADD KEY `user_privileges_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `user_privileges_module_id__idx` (`module_id`) USING BTREE;

--
-- Indeks untuk tabel `_sessions`
--
ALTER TABLE `_sessions`
  ADD KEY `ci_sessions_TIMESTAMP` (`timestamp`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `admission_phases`
--
ALTER TABLE `admission_phases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `admission_quotas`
--
ALTER TABLE `admission_quotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `class_groups`
--
ALTER TABLE `class_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `class_group_settings`
--
ALTER TABLE `class_group_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `class_group_students`
--
ALTER TABLE `class_group_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `image_sliders`
--
ALTER TABLE `image_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `majors`
--
ALTER TABLE `majors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT untuk tabel `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pollings`
--
ALTER TABLE `pollings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `scholarships`
--
ALTER TABLE `scholarships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT untuk tabel `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user_privileges`
--
ALTER TABLE `user_privileges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
