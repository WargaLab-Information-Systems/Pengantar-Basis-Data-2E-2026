CREATE DATABASE toko;
USE toko

CREATE TABLE kategori(
id_kategori INT PRIMARY KEY,
nama_kategori VARCHAR (50)
);

CREATE TABLE produk (
id_produk INT PRIMARY KEY,
nama_produk VARCHAR (100),
harga INT,
id_kategori INT,
FOREIGN KEY (id_kategori)
REFERENCES kategori(id_kategori)
);


CREATE TABLE transaksi(
id_transaksi INT PRIMARY KEY,
id_produk INT,
jumlah INT,
FOREIGN KEY (id_produk)
REFERENCES produk(id_produk)
);

INSERT INTO kategori VALUES 
(1,'laptop'),
(2,'smartphone'),
(3,'aksesoris');

INSERT INTO produk v   alues
(101, 'laptop asus', 750000, 1),
(102, 'laptop lenovo', 6000000, 1),
(103, 'iphone 13', 12000000, 2),
(104, 'mouse', 120000, 3),
(105, 'keyboard', 500000, 3);

INSERT INTO transaksi VALUES
(201,102,2),
(202,104,5),
(203,103,1),
(204,103,3);

SELECT
produk.id_produk,
produk.nama_produk,
kategori.nama_kategori,
transaksi.jumlah
FROM produk
RIGHT JOIN kategori
ON produk.id_kategori = kategori.id_kategori
RIGHT JOIN transaksi
ON produk.id_produk = transaksi.id_produk;
