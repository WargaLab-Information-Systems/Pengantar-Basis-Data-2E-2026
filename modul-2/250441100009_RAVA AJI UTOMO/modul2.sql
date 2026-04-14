CREATE DATABASE klinik_sehat;
USE klinik_sehat;
CREATE TABLE dokter (
id_dokter INT PRIMARY KEY,
nama_dokter VARCHAR(100),
spesialisasi VARCHAR(50)
)

CREATE TABLE pasien (
id_pasien INT PRIMARY KEY,
nama_pasien VARCHAR(100),
tanggal_lahir DATE,
no_telpon CHAR(13)
)

CREATE TABLE rekam_medis (
id_rekam INT PRIMARY KEY,
id_pasien INT,
id_dokter INT,
tanggal_periksa DATE,
diagnosis VARCHAR(250),
FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien)
ON DELETE RESTRICT,
FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter)
ON DELETE RESTRICT
);

DESCRIBE 				
SELECT * FROM pasien
-- jawaban 2
INSERT INTO dokter VALUES
(1, 'Dr. Rava', 'Bedah Saraf'),
(2, 'Dr. Anton', 'Radiologi');

INSERT INTO pasien VALUES
(1, 'Slamet', '1986-03-12', '081233239876'),
(2, 'Rusdi', '1990-12-12', '089812341903');

INSERT INTO rekam_medis VALUES
(1, 1, 1, '2026-03-12', 'Saraf Putus Satu'),
(2, 2, 2, '2026-05-09', 'Patah Tulang');
-- kalau tidak ada id dokter nya
INSERT INTO rekam_medis VALUES
(3, 1, 3, '2026-06-06', 'Kencing Manis');

-- jawaban 3
UPDATE pasien
SET no_telpon = '081123451986'
WHERE id_pasien = 1;

UPDATE dokter
SET spesialisasi = 'Kesehatan Anak'
WHERE id_dokter = 2;

SELECT * FROM rekam_medis

DELETE FROM rekam_medis
WHERE id_rekam = 2;

-- jawaban 4
DROP TABLE rekam_medis

CREATE TABLE rekam_medis (
id_rekam INT PRIMARY KEY,
id_pasien INT,
id_dokter INT,
tanggal_periksa DATE,
diagnosis VARCHAR(250),
FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter) ON DELETE CASCADE,
FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien) ON DELETE RESTRICT
);

INSERT INTO rekam_medis VALUES
(1, 1, 1, '2026-01-07', 'Saraf Putus Satu'),
(2, 2, 1, '2026-03-04', 'Tulang Retak');

DELETE FROM dokter
WHERE id_dokter = 1;

SELECT * FROM rekam_medis

-- jawaban 5
DROP TABLE rekam_medis;
CREATE TABLE rekam_medis (
id_rekam INT PRIMARY KEY,
id_pasien INT,
id_dokter INT,
tanggal_periksa DATE,
diagnosis VARCHAR(250),
FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien) ON DELETE RESTRICT,
FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter) ON DELETE RESTRICT
);


INSERT INTO rekam_medis VALUES
(1, 1, 1, '2026-03-12', 'Saraf Putus Satu'),
(2, 2, 2, '2026-05-09', 'Patah Tulang');

TRUNCATE TABLE rekam_medis;

TRUNCATE TABLE pasien;
