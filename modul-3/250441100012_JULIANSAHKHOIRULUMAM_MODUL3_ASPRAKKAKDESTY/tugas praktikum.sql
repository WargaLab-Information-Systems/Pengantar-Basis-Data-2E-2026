-- jawaban nomer 1
CREATE DATABASE klinik;
USE klinik;

CREATE TABLE dokter(
id_dokter INT PRIMARY KEY,
nama_dokter VARCHAR(50),
spesialis VARCHAR (50)
);

CREATE TABLE pasien(
id_pasien INT PRIMARY KEY,
nama_pasien VARCHAR(50),
tgl_lahir DATE,
no_telp CHAR (13)
);

CREATE TABLE rekam_medis(
id_rekam INT PRIMARY KEY,
 id_pasien INT,
 id_dokter INT,
 tanggal_periksa DATE,
 diagnosis VARCHAR (250),
 FOREIGN KEY (id_pasien)
 REFERENCES pasien (id_pasien),
 FOREIGN KEY (id_dokter)
 REFERENCES dokter(id_dokter)ON DELETE RESTRICT
 );

-- jawaban nomer 2 
INSERT INTO dokter VALUES
(1 ,"jul","mata"),
(2,"andi","Rehabilitas");

INSERT INTO pasien VALUES 
(1,"fuad",'2000-01-01',0813314415631),
(2,"kusfa","2045-09-15",087654311245);

INSERT INTO rekam_medis VALUES
(1,1,1, "2026-07-12","mata silinder"),
(2,2,2, "2026-07-13","waktu penyembuhan");

-- id dokter yang tidak ada
INSERT INTO rekam_medis VALUES
(3,2,3,"2026-07-14","agak stres")

-- jawaban nomer 3
UPDATE pasien 
SET no_telp = 086745312871
WHERE id_pasien = 2;

UPDATE dokter 
SET spesialis = "dokter kandungan"
WHERE id_dokter = 2;

DELETE FROM rekam_medis
WHERE id_rekam = 2;

-- jawaban nomer 4
DROP TABLE rekam_medis;
CREATE TABLE rekam_medis(
id_rekam INT PRIMARY KEY,
 id_pasien INT,
 id_dokter INT,
 tanggal_periksa DATE,
 diagnosis VARCHAR (250),
 FOREIGN KEY (id_pasien)
 REFERENCES pasien (id_pasien)ON DELETE RESTRICT,
 FOREIGN KEY (id_dokter)
 REFERENCES dokter(id_dokter)ON DELETE CASCADE 
 );

INSERT INTO rekam_medis VALUES
(1,2,1,"2026-11-12","penyakit mata"),
(2,1,1,"2026-11-13","mata kabur"),
(3,1,2,"2026-11-14","periksa kandungan");

DELETE FROM dokter
WHERE id_dokter = 1;

SELECT * FROM dokter;

-- Perbandingan 
DROP TABLE rekam_medis;
CREATE TABLE rekam_medis(
id_rekam INT PRIMARY KEY,
id_pasien INT,
id_dokter INT,
tanggal_periksa DATE,
diagnosis VARCHAR (250),
FOREIGN KEY (id_pasien)
REFERENCES pasien (id_pasien),
FOREIGN KEY (id_dokter)
REFERENCES dokter(id_dokter) ON DELETE SET NULL 
);
 
INSERT INTO rekam_medis VALUES
(1,1,1, "2026-07-12","mata silinder"),
(2,2,2, "2026-07-13","waktu penyembuhan");

DELETE FROM dokter
WHERE id_dokter = 1;
SELECT * FROM dokter;

-- jawaban nomer 5
DROP TABLE rekam_medis; 
CREATE TABLE rekam_medis(
id_rekam INT PRIMARY KEY,
id_pasien INT,
id_dokter INT,
tanggal_periksa DATE,
diagnosis VARCHAR (250),
FOREIGN KEY (id_pasien)
REFERENCES pasien (id_pasien) ON DELETE RESTRICT,
FOREIGN KEY (id_dokter) 
REFERENCES dokter(id_dokter) ON DELETE RESTRICT
 );
 
INSERT INTO rekam_medis VALUES
(1,1,1, "2026-07-12","mata silinder"),
(2,2,2, "2026-07-13","waktu penyembuhan");

TRUNCATE TABLE rekam_medis;
TRUNCATE TABLE pasien;
