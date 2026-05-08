CREATE TABLE dokter (
    id_dokter INT PRIMARY KEY,
    nama_dokter VARCHAR(100),
    spesialisasi VARCHAR(50)
);
SHOW TABLES;
DESCRIBE dokter;

CREATE TABLE pasien (
    id_pasien INT PRIMARY KEY,
    nama_pasien VARCHAR(100),
    tanggal_lahir DATE,
    no_telepon VARCHAR(15)
);
SHOW TABLES;
DESCRIBE pasien;

CREATE TABLE rekam_medis (
    id_rekam INT PRIMARY KEY,
    id_pasien INT,
    id_dokter INT,
    tanggal_periksa DATE,
    diagnosis TEXT,
    FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien) ON DELETE RESTRICT,
    FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter) ON DELETE RESTRICT
);
SHOW TABLES;
DESCRIBE rekam_medis;


INSERT INTO dokter VALUES (3, 'dr. Andi', 'Umum'), (4, 'dr. Budi', 'Anak');
SELECT *FROM dokter

INSERT INTO pasien VALUES (101, 'Siti', '1995-05-10', '0812345'), (102, 'Iwan', '1990-12-20', '0856789');
SELECT *FROM pasien

INSERT INTO rekam_medis VALUES (501, 101, 3, '2024-03-01', 'Flu'), (502, 102, 4, '2024-03-02', 'Batuk');
SELECT *FROM rekam_medis

INSERT INTO rekam_medis VALUES (503, 101, 99, '2024-03-03', 'Pusing');
SELECT *FROM rekam_medis

