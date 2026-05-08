CREATE DATABASE gudang;
USE gudang

CREATE TABLE inventaris_gudang_pusat(
id_barang INT PRIMARY KEY,
nama_barang VARCHAR(100),
kode_sku VARCHAR(50),
kategori VARCHAR (50),
harga_satuan DECIMAL (15,2),
stok INT,
lokasi_rak VARCHAR(20),
status_qc VARCHAR (20)
);

INSERT INTO inventaris_gudang_pusat VALUES
(101, 'gaming laptop G5', 'ELEC-442-X' , 'laptop', 15500000, 12, 'A-10', 'lulus'),
(102, 'wireless mouse', 'ACC-101-Y', 'aksesoris', 250000, 150, NULL, 'lulus'),
(103, 'ultra wide monitor', 'ELEC-881-X', 'monitor', 7200000, 0, 'B-05', 'pending'),
(104, 'mechanical keyboard', 'ACC-202-Z', 'aksesoris', 1200000, 45, 'B-02', 'lulus'),
(105, 'offfice chair pro', 'FURN-991-P', 'furniture', 3500000, 8, 'C-10', NULL),
(106, 'USB-C hub 10-in-1', 'ACC-303-X', 'aksesoris', 850000, 0, NULL, 'gagal'),
(107, 'smartphone Z flip', 'ELEC-112-Y', 'smartphone', 14000000, 4, 'A-03', 'lulus'),
(108, 'standing desk', 'FURN-882-Q', 'furniture', 5000000, 15, 'C-02', 'lulus'),
(109, 'headset gaming RGB', 'ACC-404-X', 'aksesoris', 1100000, 25, NULL, 'lulus'),
(110, 'thunderbolt cable', 'ACC-505-Z', 'aksesoris', 450000, 100, 'B-03', 'lulus');
SELECT * FROM inventaris_gudang_pusat;

#soal no 1
SELECT nama_barang, kategori, kode_sku FROM inventaris_gudang_pusat
WHERE lokasi_rak IS NULL  AND stok > 0 AND status_qc = 'lulus';

#soal no 2
SELECT DISTINCT kategori FROM inventaris_gudang_pusat
WHERE kode_sku LIKE '%ELEC%' AND kode_sku LIKE '%X' AND harga_satuan > 5000000;

#soal no 3
 SELECT nama_barang, stok ,
 CASE
 WHEN stok = 0 AND kategori = 'aksesoris' THEN 'urgent - restock Segera'
 WHEN stok < 10 AND stok > 0 AND (kategori = 'laptop' OR kategori = 'smartphone') THEN 'high priority'
 WHEN stok BETWEEN 10 AND 50 THEN 'medium'
 ELSE 'aman'
 END AS prioritas_restock
 FROM  inventaris_gudang_pusat
 ORDER BY stok ASC;
 
 #soal no 4
 SELECT * FROM inventaris_gudang_pusat
 WHERE lokasi_rak LIKE 'B%' AND harga_satuan NOT BETWEEN 1000000 AND 5000000 AND kategori NOT IN ('monitor');
 
 #soal no 5
 SELECT nama_barang, harga_satuan, status_qc FROM inventaris_gudang_pusat
 WHERE kategori NOT IN ('furniture') AND status_qc = 'lulus'
 ORDER BY harga_satuan DESC
 LIMIT 3;
 
 