-- no1
DROP DATABASE klinik_sehat
CREATE DATABASE klinik_sehat
USE klinik_sehat
CREATE TABLE dokter (
    id_dokter INT PRIMARY KEY,
    nama_dokter VARCHAR(100),
    spesialisasi VARCHAR(100)
);

CREATE TABLE pasien (
    id_pasien INT PRIMARY KEY,
    nama_pasien VARCHAR(100),
    tanggal_lahir DATE,
    no_telepon VARCHAR(12)
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

-- no2
INSERT INTO dokter VALUES
(1, 'Dr. Andi', 'Umum'),
(2, 'Dr. Siti', 'Pernafasan');

INSERT INTO pasien VALUES
(1, 'Budi', '2006-01-01', '08123456789'),
(2, 'Ani', '2003-01-03', '08234567890');

INSERT INTO rekam_medis VALUES
(1, 1, 1, '2026-01-10', 'Flu'),
(2, 2, 2, '2026-01-11', 'TBC');
-- eror
INSERT INTO rekam_medis VALUES
(3, 1, 10, '2026-01-12', 'Demam');


-- no3
UPDATE pasien
SET no_telepon = '087893294958'
WHERE id_pasien = 1;

UPDATE dokter
SET spesialisasi = 'Asma'
WHERE id_dokter = 1;

DELETE FROM rekam_medis
WHERE id_rekam = 1;

-- NO4
DROP TABLE rekam_medis
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
(1, 1, 1, '2026-01-16', 'Flu'),
(2, 2, 1, '2026-01-18', 'Batuk');

DELETE FROM dokter
WHERE id_dokter = 1;

SELECT * FROM rekam_medis;

-- no5
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
(1, 1, 1, '2026-01-20', 'Diare'),
(2, 2, 1, '2026-01-22', 'Hipotermia');

TRUNCATE TABLE rekam_medis;
TRUNCATE TABLE pasien;