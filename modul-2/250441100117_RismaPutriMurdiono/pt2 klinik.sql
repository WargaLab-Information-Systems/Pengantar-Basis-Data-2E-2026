CREATE DATABASE klinik_sehat_bersama2;
USE klinik_sehat_bersama2

CREATE TABLE dokter(
id_dokter INT PRIMARY KEY,
nama_dokter VARCHAR(100),
spesialis VARCHAR(100)
);

DESC dokter
INSERT INTO dokter VALUES
(6, 'dr.risma', 'anak'),
(7, 'dr.putri', 'umum');

UPDATE dokter
SET spesialis = 'gigi'
WHERE id_dokter = 7;

SELECT * FROM dokter;

CREATE TABLE pasien(
id_pasien INT PRIMARY KEY,
nama_pasien VARCHAR(100),
tanggal_lahir DATE,
no_telepon VARCHAR(15)
);
DESC pasien
INSERT INTO pasien VALUES
(103, 'nina', '2006-11-18', '0881036073753'),
(104, 'nana', '2007-10-11', '088534232455');

UPDATE pasien
SET no_telepon = '0871345354453'
WHERE id_pasien = 104;

SELECT * FROM pasien;

CREATE TABLE rekam_medis(
id_rekam INT PRIMARY KEY,
id_pasien INT,
id_dokter INT,
tanggal_periksa DATE,
diagnosis TEXT,
FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien) ON DELETE RESTRICT,
FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter) ON DELETE RESTRICT
);
DESC rekam_medis

INSERT INTO rekam_medis VALUES
(1005, 103, 6, '2026-04-02', 'batuk'),
(1006, 104, 7, '2026-04-03', 'flu');

INSERT INTO rekam_medis VALUES
(1007, 105, 8, '2026-02-29', 'demam');

DELETE FROM rekam_medis
WHERE id_rekam = 1005;

SELECT * FROM rekam_medis;

DROP TABLE rekam_medis;

CREATE TABLE rekam_medis (
    id_rekam INT PRIMARY KEY,
    id_pasien INT,
    id_dokter INT,
    tanggal_periksa DATE,
    diagnosis TEXT,
    FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien) ON DELETE RESTRICT,
    FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter) ON DELETE CASCADE
);

DESC rekam_medis
INSERT INTO rekam_medis VALUES
(2003, 103, 6, '2025-05-13', 'gigi'),
(2004, 104, 6, '2025-02-12', 'perut');

DELETE FROM dokter WHERE id_dokter = 6

SELECT * FROM rekam_medis;

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

DESC rekam_medis

INSERT INTO rekam_medis VALUES
(3002, 103, 7, '2023-03-12', 'pilek'),
(3003, 104, 7, '2023-03-14', 'dahak');

SELECT * FROM rekam_medis;

TRUNCATE TABLE rekam_medis;
TRUNCATE TABLE pasien;