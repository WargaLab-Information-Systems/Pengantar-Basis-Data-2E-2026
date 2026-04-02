-- TUGAS PRAKTIKUM PBD (MODUL 1)

-- 1. PERANCANGAN SKEMA DAN INTEGRITAS DATA (KASUS E-LIBRARY)
-- Membuat tabel bernama koleksi_langka
CREATE DATABASE perpustakaan_digital;
USE perpustakaan_digital;
CREATE TABLE koleksi_langka (
    id_buku BIGINT PRIMARY KEY,
    judul VARCHAR(250),
    tahun_terbit YEAR,
    estimasi_harga DECIMAL(15,2)
);
DESCRIBE koleksi_langka;

-- 2. EVOLUSI STRUKTUR TABEL DAN MIGRASI TIPE DATA
CREATE DATABASE db_pelanggan;
USE db_pelanggan;
-- Tabel awal (sebelum perubahan)
CREATE TABLE pelanggan_setia (
    nomor_identitas INT
);
DESCRIBE pelanggan_setia;
-- Mengubah tipe data kolom nomor_identitas
ALTER TABLE pelanggan_setia
MODIFY nomor_identitas VARCHAR(20);

-- 3. ANALISIS DAMPAK PERINTAH DESTRUKTIF (DROP VS TRUNCATE) 
CREATE DATABASE db_transaksi;
USE db_transaksi;
-- Membuat tabel transaksi_harian dengan 2 kolom
CREATE TABLE transaksi_harian (
    id_transaksi INT PRIMARY KEY,
    jumlah INT
);
-- Perintah TRUNCATE (menghapus semua data)
TRUNCATE TABLE transaksi_harian;
DESCRIBE transaksi_harian;
-- Perintah DROP (menghapus tabel)
DROP TABLE transaksi_harian;

-- 4. OPTIMASI PENYIMPANAN DAN EFISIENSI KARAKTER
CREATE DATABASE db_komentar;
USE db_komentar;
-- Membuat tabel umpan_balik dengan tipe data karakter TEXT
CREATE TABLE umpan_balik (
    id_komentar INT PRIMARY KEY,
    isi_komentar TEXT
);
DESCRIBE umpan_balik;

-- Membuat tabel umpan_balik dengan tipe data karakter VARCHAR(1000)
CREATE TABLE umpan_balik (
    id_komentar INT PRIMARY KEY, 
    isi_komentar VARCHAR(1000)
);
