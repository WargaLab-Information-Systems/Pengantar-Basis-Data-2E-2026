CREATE DATABASE klinik_sehat_bersama;
USE klinik_sehat_bersama

CREATE TABLE  dokter(
 id_dokter INT PRIMARY KEY,
 nama_dokter VARCHAR(100),
 spesialisasi VARCHAR (1000)
 );
 
 INSERT INTO dokter VALUES
 (1, 'dr.dani', 'THT'),
 (4, 'dr.rafi', 'jantung'),
 (6, 'dr.yuda', 'mata');
 SELECT*FROM dokter; 
 
 UPDATE dokter
 SET spesialisasi = 'kulit'
 WHERE id_dokter = 6
 SELECT*FROM dokter;
 
CREATE TABLE pasien(
id_pasien INT PRIMARY KEY,
nama_pasien VARCHAR (100),
tanggal_lahir DATE,
no_telepon VARCHAR (13)
);

INSERT INTO pasien VALUES
(101, 'amel', '2007-10-02', '087223516833'),
(104, 'iim', '2000-02-09', '075621923546'),
(106, 'rika', '2011-11-06', '081294576487');

UPDATE pasien 
SET no_telepon = '087555666467'
WHERE id_pasien = 104
SELECT*FROM pasien;

CREATE TABLE rekam_medis(
id_rekam INT PRIMARY KEY,
id_pasien INT,
id_dokter INT,
tanggal_periksa DATE,
diagnosis TEXT,
FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien) ON DELETE RESTRICT,
FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter) ON DELETE RESTRICT
 );
 
INSERT INTO rekam_medis VALUES
(1001, 101, 1, '2026-10-02', 'sakit telinga'),
(1002, 104, 4, '2026-01-02', 'serangan jantung'),
(1003, 106, 6, '2025-07-08', 'minus');
SELECT*FROM rekam_medis;

INSERT INTO rekam_medis VALUES
(1004, 103, 3, '2026-02-09', 'gila');

DELETE FROM rekam_medis
WHERE id_rekam = 1003;
SELECT*FROM rekam_medis

DROP TABLE rekam_medis;

CREATE TABLE rekam_medis(
id_rekam INT PRIMARY KEY,
id_pasien INT,
id_dokter INT,
tanggal_periksa DATE,
diagnosis TEXT,
FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien) ON DELETE RESTRICT,
FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter) ON DELETE CASCADE
 );
 
 INSERT INTO rekam_medis VALUES
 (2001, 101, 1, '2026-10-11', 'vertigo'),
 (2003, 104, 1, '2025-05-09', 'alegi hidung');
 DELETE FROM dokter WHERE id_dokter = 1;
 
  SELECT*FROM rekam_medis;
 
 #no 5
 DROP TABLE rekam_medis;
 CREATE TABLE rekam_medis(
id_rekam INT PRIMARY KEY,
id_pasien INT,
id_dokter INT,
tanggal_periksa DATE,
diagnosis TEXT,
FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien) ON DELETE RESTRICT,
FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter) ON DELETE RESTRICT
 );
 
INSERT INTO rekam_medis VALUES
(1001, 101, 6, '2026-10-02', 'sakit telinga'),
(1002, 104, 4, '2026-01-02', 'serangan jantung'),
(1003, 106, 6, '2025-07-08', 'minus');
SELECT*FROM rekam_medis;

TRUNCATE TABLE rekam_medis;
TRUNCATE TABLE pasien;
 
