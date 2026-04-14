-- jawaban 1
CREATE DATABASE e_library;
USE e_library;
CREATE TABLE koleksi_langka (
    id_buku BIGINT PRIMARY KEY,
    judul VARCHAR(250),
    tahun_terbit YEAR,
    estimasi_harga DECIMAL(19, 2)
)

-- jawaban 2
CREATE TABLE pelanggan_setia (
    nomor_identitas INT
)

ALTER TABLE pelanggan_setia
MODIFY nomor_identitas VARCHAR(20)


-- jawaban 3
CREATE TABLE transaksi_harian (
    id_transaksi INT,
    total_belanja INT
)
TRUNCATE TABLE transaksi_harian
DROP TABLE transaksi_harian

-- jawaban 4
CREATE TABLE umpan_balik (
    username VARCHAR(50),
    isi_komentar TEXT
);