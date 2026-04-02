-- soal no 1
CREATE DATABASE perpustakaan_db;
USE perpustakaan_db;
CREATE TABLE koleksi_langka(
	id_buku BIGINT PRIMARY KEY,
    judul_buku VARCHAR(250),
    tahun_terbit YEAR,
    estimasi_harga DECIMAL(15,2)
);
DESCRIBE koleksi_langka;
DROP DATABASE perpustakaan_db;

CREATE DATABASE pelanggan_toko;
USE pelanggan_toko;
CREATE TABLE pelanggan_setia (
    id INT PRIMARY KEY,
    nama VARCHAR(100),
    nomor_identitas INT
);
-- soal no2
ALTER TABLE pelanggan_setia
MODIFY nomor_identitas VARCHAR(20);
DESCRIBE pelanggan_setia;
DROP DATABASE pelanggan_toko;


CREATE DATABASE transaksi;
USE transaksi;
-- soal no 3
CREATE TABLE transaksi_harian (
    id_transaksi INT,
    total INT
);
TRUNCATE TABLE transaksi_harian;
DESCRIBE transaksi_harian;
DROP TABLE transaksi_harian;
DROP DATABASE transaksi;


CREATE DATABASE platform_berita;
USE platform_berita;
-- soal no 4
CREATE TABLE umpan_balik (
    id_komentar INT PRIMARY KEY,
    nama_pengguna VARCHAR(100),
    isi_komentar TEXT,
    tanggal DATETIME DEFAULT CURRENT_TIMESTAMP
);
DESCRIBE umpan_balik