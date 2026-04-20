-- jawaban no 1--
CREATE TABLE dokter (
    id_dokter INT PRIMARY KEY,
    nama_dokter VARCHAR(100),
    spesialisasi VARCHAR(50)
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
    FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien) ON DELETE RESTRICT,
    FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter) ON DELETE RESTRICT
    
);

-- jawaban no 2 --
INSERT INTO dokter VALUES 
(1, 'dr. Andi', 'Umum'), 
(2, 'dr. Budi', 'Anak');
INSERT INTO pasien VALUES 
(101, 'Siti', '1995-05-20', '0812345'), 
(102, 'Budi', '1990-10-12', '0856789');
INSERT INTO rekam_medis VALUES
(501, 101, 1, '2026-04-01', 'Flu Ringan'), 
(502, 102, 2, '2026-04-02', 'Demam');

INSERT INTO rekam_medis VALUES (503, 101, 99, '2026-04-03', 'Sakit Gigi');

-- jawaban no 3 --
UPDATE FROM pasien
SET no_telepon = '088898989'
WHERE id_pasien = 101;


UPDATE FROM dokter
SET spesialisasi = 'Dewass'
WHERE id_dokter = 1;

DELETE FROM rekam_medis
WHERE id_rekam = 501;


-- jawaban no 4 --
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

INSERT INTO rekam_medis VALUES
(501, 101, 1, '2026-04-01', 'Flu Ringan'), 
(502, 102, 1, '2026-04-02', 'Demam');

DELETE FROM rekam_medis
WHERE id_dokter = 1;

SELECT * FROM rekam_medis;

-- jawaban no 5 --
DROP TABLE rekam_medis;
CREATE TABLE rekam_medis (
    id_rekam INT PRIMARY KEY,
    id_pasien INT,
    id_dokter INT,
    tanggal_periksa DATE,
    diagnosis TEXT,
    FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien) ON DELETE RESTRICT,
    FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter) ON DELETE RESTRICT
);


TRUNCATE pasien;

TRUNCATE rekam_medis;