CREATE DATABASE praktikum_pbd;
USE praktikum_pbd

CREATE TABLE produk (
id_produk INT PRIMARY KEY,
nama_produk VARCHAR (100),
kategori VARCHAR (50),
harga INT,
stok INT
);

INSERT INTO produk VALUES
(101, 'laptop asus', 'laptop', 8500000, 10),
(102, 'laptop lenovo', 'laptop', 7500000, 8),
(103, 'iphone 13', 'smartphone', 12000000, 5),
(104, 'mouse logitech', 'aksesoris', 150000, 30),
(105, 'keyboard gaming', 'aksesoris', 500000,15);
SELECT*FROM produk;

SELECT nama_produk, harga FROM produk;

SELECT *FROM produk
WHERE harga > 800000;

SELECT * FROM produk
WHERE harga > 5000000 AND stok > 5;

SELECT * FROM produk
WHERE nama_produk LIKE 'laptop%';

SELECT * FROM produk
WHERE nama_produk LIKE '%gaming%';

SELECT * FROM produk
WHERE nama_produk LIKE '_a%';

SELECT * FROM produk
WHERE nama_produk LIKE '_%s';

SELECT * FROM produk
WHERE kategori IN ('laptop', 'aksesoris');

SELECT * FROM produk 
WHERE harga BETWEEN 500000 AND 9000000;

SELECT * FROM produk
ORDER BY stok ASC;

SELECT * FROM produk
LIMIT 4;

SELECT * FROM produk
WHERE kategori IS NOT NULL;

SELECT DISTINCT nama_produk FROM produk;

SELECT nama_produk, harga,
CASE
WHEN harga >= 10000000 THEN 'mahal'
WHEN harga >= 5000000 THEN 'sedang'
ELSE 'murah'
END AS kategori_harga
FROM produk;

SELECT nama_produk, harga,
CASE
WHEN harga >= 20 THEN 'banyak'
WHEN harga >= 10 THEN 'sedang'
ELSE 'sedikit'
END AS kategori_stok
FROM produk;

SELECT * FROM produk 
WHERE kategori = 'aksesoris' AND harga < 1000000;
 