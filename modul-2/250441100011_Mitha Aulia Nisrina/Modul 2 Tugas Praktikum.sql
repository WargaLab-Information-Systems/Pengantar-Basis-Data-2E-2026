-- TUGAS PRAKTIKUM PBD (MODUL 2) Foreign Key dan DML Dasar.

-- 1.  Perintah SQL untuk membuat Tabel Dokter, Tabel Pasien, Tabel Rekam Medis (dengan 2 Foreign Key + ON DELETE RESTRICT).
CREATE DATABASE db_klinik;
USE db_klinik;

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

  FOREIGN KEY (id_pasien)
    REFERENCES pasien(id_pasien)
    ON DELETE RESTRICT,

  FOREIGN KEY (id_dokter)
    REFERENCES dokter(id_dokter)
    ON DELETE RESTRICT
);

-- Untuk menampilkan struktur tabel sesuai kebutuhan.
DESCRIBE dokter;
DESCRIBE pasien;
DESCRIBE rekam_medis;

-- 2. Tambahkan minimal 2 data dokter, 2 data pasien, dan 2 data rekam medis, dan tambahkan satu rekam medis dengan id_dokter yang tidak ada di tabel dokter.
INSERT INTO dokter VALUES
(1, 'Dr. Mitha', 'Umum'),
(2, 'Dr. Intan', 'Anak'),
(3, 'Dr. Udin', 'Gigi');

INSERT INTO pasien VALUES
(1, 'Puput Eka Putri', '2000-05-10', '08123456789'),
(2, 'Carissa Widiana', '1998-03-21', '08987654321'),
(3, 'Lailis Syafaah', '2001-07-15', '08211222333');

INSERT INTO rekam_medis VALUES
(1, 1, 1, '2025-04-01', 'Demam dan flu ringan'),
(2, 2, 2, '2025-04-02', 'Pemeriksaan tumbuh kembang anak'),
(3, 3, 3, '2025-04-03', 'Gigi berlubang');

-- Untuk menampilkan isi tabel sesuai kebutuhan.
SELECT * FROM dokter;
SELECT * FROM pasien;
SELECT * FROM rekam_medis;

INSERT INTO rekam_medis VALUES
(4, 1, 99, '2025-04-04', 'Flu');

-- 3. Perintah update untuk mengubah nomor telepon salah satu pasien, spesialisasi salah satu dokter, dan hapus rekam medis menggunakan perintah DELETE.
UPDATE pasien
SET no_telepon = '082220002334'
WHERE id_pasien = 1;

UPDATE dokter
SET spesialisasi = 'Penyakit Dalam'
WHERE id_dokter = 1;

DELETE FROM rekam_medis
WHERE id_rekam = 2;

-- 4. Buat ulang tabel rekam_medis dengan ON DELETE CASCADE untuk Foreign Key id_dokter. FK id_pasien tetap RESTRICT. Minimal 2 rekam medis menggunakan id_dokter sama, lalu hapus dokter tersebut.
DROP TABLE rekam_medis;

CREATE TABLE rekam_medis (
  id_rekam INT PRIMARY KEY,
  id_pasien INT,
  id_dokter INT,
  tanggal_periksa DATE,
  diagnosis TEXT,

  FOREIGN KEY (id_pasien)
    REFERENCES pasien(id_pasien)
    ON DELETE RESTRICT,

  FOREIGN KEY (id_dokter)
    REFERENCES dokter(id_dokter)
    ON DELETE CASCADE
);

INSERT INTO rekam_medis VALUES
(1, 1, 1, '2025-04-01', 'Hipertensi'),
(2, 2, 1, '2025-04-02', 'Diabetes Melitus'),
(3, 3, 2, '2025-04-03', 'Pemeriksaan anak');

DELETE FROM dokter
WHERE id_dokter = 1;

-- 5. Buat ulang tabel rekam_medis dengan ON DELETE RESTRICT untuk kedua FK-nya, isi minimal 2 data rekam medis. Jalankan TRUNCATE TABLE rekam_medis dan pasien.
DROP TABLE rekam_medis;

CREATE TABLE rekam_medis (
  id_rekam INT PRIMARY KEY,
  id_pasien INT,
  id_dokter INT,
  tanggal_periksa DATE,
  diagnosis TEXT,

  FOREIGN KEY (id_pasien)
    REFERENCES pasien(id_pasien)
    ON DELETE RESTRICT,

  FOREIGN KEY (id_dokter)
    REFERENCES dokter(id_dokter)
    ON DELETE RESTRICT
);

INSERT INTO rekam_medis VALUES
(1, 1, 2, '2025-04-05', 'Pemeriksaan tumbuh kembang anak'),
(2, 2, 3, '2025-04-06', 'Gigi berlubang'),
(3, 3, 2, '2025-04-07', 'Imunisasi anak');

TRUNCATE TABLE rekam_medis;

TRUNCATE TABLE pasien;

DROP DATABASE db_klinik;