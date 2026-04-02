CREATE DATABASE perpustakaan;
 USE perpustakaan;
 CREATE TABLE koleksi_langka (
	id_buku BIGINT PRIMARY KEY,
    judul VARCHAR(250),
    tahun_terbit YEAR,
    estimasi_harga DECIMAL(15,2)
); 
DESCRIBE koleksi_langka;
DROP DATABASE perpustakaan;

CREATE DATABASE toko_dila;
USE toko_dila;
CREATE TABLE pelanggan_setia (
nomor_identitas int
);
ALTER TABLE pelanggan_setia
MODIFY nomor_identitas VARCHAR(20); 
DESCRIBE pelanggan_setia;
DROP DATABASE toko_dila;

CREATE DATABASE bank_bri;
USE bank_bri;
CREATE TABLE transaksi_harian (
	id_transaksi INT,
    jumlah INT
);
TRUNCATE TABLE transaksi_harian;
DESCRIBE transaksi_harian;
DROP TABLE transaksi_harian; 
DROP DATABASE bank_bri;

CREATE DATABASE siaran_berita;
USE siaran_berita;
CREATE TABLE umpan_balik (
	id INT PRIMARY KEY,
    isi_komentar TEXT
);
DESCRIBE umpan_balik;
DROP DATABASE siaran_berita;