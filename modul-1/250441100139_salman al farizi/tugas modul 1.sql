CREATE TABLE koleksi_langka (
id_buku BIGINT PRIMARY KEY,
judul VARCHAR (250),
tahun_terbit YEAR,
estimasi_harga DECIMAL
);

CREATE TABLE pelanggan_setia (
nomor_identitas INT PRIMARY KEY
);

ALTER TABLE pelanggan_setia
MODIFY nomor_identitas CHAR(20);

CREATE TABLE transaksi_harian (
id_transaksi INT PRIMARY KEY,
jenis_transaksi VARCHAR(60)
);

TRUNCATE TABLE transaksi_harian;
DROP TABLE transaksi_harias;

CREATE TABLE umpan_balik(
isi_komentar TEXT
);
