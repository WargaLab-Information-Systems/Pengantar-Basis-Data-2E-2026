-- NO 1
CREATE TABLE koleksi_langka (
    id_buku BIGINT PRIMARY KEY,
    judul VARCHAR(250),
    tahun_terbit YEAR,
    estimasi_harga DECIMAL(15,2)
    );

-- NO 2
ALTER TABLE pelanggan_setia
MODIFY nomor_identitas VARCHAR(20);

-- NO 3
CREATE TABLE transaksi_harian (
    id_transaksi INT,
    total INT
    );
-- TRUNCATE isi tabel
TRUNCATE TABLE transaksi_harian;
-- DROP tabel
DROP TABLE transaksi_harian;

-- NO 4
CREATE TABLE umpan_balik (
    id_komentar INT PRIMARY KEY,
    isi_komentar TEXT
    );

