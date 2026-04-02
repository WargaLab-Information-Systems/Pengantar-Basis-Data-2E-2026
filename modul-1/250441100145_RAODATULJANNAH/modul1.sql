CREATE DATABASE tuprak 1;
USE tuprak 1;

CREATE TABLE koleksi_langka(
id_buku BIGINT PRIMARY KEY,
judul VARCHAR(250),
tahun_terbit YEAR,
estimasi_harga DECIMAL(18,2)
);

CREATE TABLE pelanggan_setia(
id INT PRIMARY KEY,
nama VARCHAR (100)
);

ALTER TABLE pelanggan_setia(
MODIFY nomor_identitas VARCHAR(20),   
);

CREATE TABLE transaksi_harian(
id_transaksi INT PRIMARY KEY,
jumlah INT
);

TRUNCATE TABLE transaksi_harian;
DROP TABLE transaksi_harian;

CREATE TABLE umpan_balik(
id_komentar INT AUTO_INCREMENT PRIMARY KEY,
nama_pengguna VARCHAR(100),
isi_komentar TEXT
);

