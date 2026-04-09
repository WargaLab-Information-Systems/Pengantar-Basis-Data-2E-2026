-- SOAL 1
CREATE DATABASE klinik_db;
USE klinik_db;

CREATE TABLE dokter (
    id_dokter INT PRIMARY KEY,
    nama_dokter VARCHAR(100),
    spesialisasi VARCHAR(100)
);

CREATE TABLE pasien (
    id_pasien INT PRIMARY KEY,
    nama_pasien VARCHAR(100),
    tanggal_lahir DATE,
    no_telepon VARCHAR(15)
);

CREATE TABLE rekam_medis (
    id_rekam INT PRIMARY KEY,
    id_pasien INT,
    id_dokter INT,
    tanggal_periksa DATE,
    diagnosis TEXT,
    FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien)
        ON DELETE RESTRICT,
    FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter)
        ON DELETE RESTRICT
);

-- SOAL 2
INSERT INTO dokter VALUES
(101, 'Dr. Andi', 'Umum'),
(203, 'Dr. Siti', 'Gigi'),
(202, 'Dr. Intan', 'jantung');


INSERT INTO pasien VALUES
(1011, 'Budi', '2000-05-10', '08123456789'),
(1057, 'Ani', '1999-08-21', '08987654321'),
(1001, 'Nurul', '2001-06-12', '08333891110');

INSERT INTO rekam_medis VALUES
(123, 1011, 101, '2024-01-10', 'Flu'),
(234, 1057, 203, '2024-01-11', 'Sakit gigi'),
(22, 1001, 203, '2024-09-11','jantung');

SELECT * FROM dokter;
SELECT * FROM pasien;
SELECT * FROM rekam_medis;

DROP DATABASE rekam_medis;
 
INSERT INTO rekam_medis VALUES
(304, 11, 999, '2024-01-12', 'Demam');

-- SOAL 3
UPDATE pasien
SET no_telepon = '08334456789'
WHERE id_pasien = 1011;

UPDATE dokter
SET spesialisasi = 'Penyakit Dalam'
WHERE id_dokter = 101;

DELETE FROM rekam_medis
WHERE id_rekam = 123;

-- SOAL 4
DROP TABLE rekam_medis;

CREATE TABLE rekam_medis (
    id_rekam INT PRIMARY KEY,
    id_pasien INT,
    id_dokter INT,
    tanggal_periksa DATE,
    diagnosis TEXT,
    FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien)
        ON DELETE RESTRICT,
    FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter)
        ON DELETE CASCADE
);

INSERT INTO rekam_medis VALUES
(1, 1011, 101, '2024-01-10', 'Flu'),
(2, 1057, 101, '2024-01-11', 'Batuk'),
(3, 1001, 202,  '2024-02-12', 'serangan jantung');

DELETE FROM dokter
WHERE id_dokter = 202;

SELECT * FROM rekam_medis;

-- SOAL 5
DROP TABLE rekam_medis;

CREATE TABLE rekam_medis (
    id_rekam INT PRIMARY KEY,
    id_pasien INT,
    id_dokter INT,
    tanggal_periksa DATE,
    diagnosis TEXT,
    FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien)
        ON DELETE RESTRICT,
    FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter)
        ON DELETE RESTRICT
);

INSERT INTO rekam_medis VALUES
(12, 1011, 101, '2024-01-10', 'Flu'),
(23, 1057, 203, '2024-01-11', 'Sakit gigi'),
(14, 1001, 202, '2024-02-02', 'penyakit jantung bawaan');


TRUNCATE TABLE rekam_medis;
TRUNCATE TABLE pasien;

