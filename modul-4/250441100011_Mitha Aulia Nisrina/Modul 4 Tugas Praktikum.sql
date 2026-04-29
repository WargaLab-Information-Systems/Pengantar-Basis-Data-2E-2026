-- TUGAS PRAKTIKUM PBD (MODUL 4) QUERY MULTI TABLE (JOIN).

CREATE DATABASE siakad_sandbox;
USE siakad_sandbox;

CREATE TABLE dosen (
    id_dosen INT PRIMARY KEY,
    nama_dosen VARCHAR(100),
    bidang_keahlian VARCHAR(50)
);

CREATE TABLE mahasiswa (
    id_mahasiswa INT PRIMARY KEY,
    nama_mahasiswa VARCHAR(100),
    program_studi VARCHAR(50),
    angkatan INT
);

CREATE TABLE mata_kuliah (
    id_mk VARCHAR(10) PRIMARY KEY,
    nama_mk VARCHAR(100),
    sks INT,
    id_dosen INT,
    FOREIGN KEY (id_dosen) REFERENCES dosen(id_dosen)
);

CREATE TABLE krs (
    id_krs INT PRIMARY KEY,
    id_mahasiswa INT,
    id_mk VARCHAR(10),
    semester_ambil INT,
    FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
    FOREIGN KEY (id_mk) REFERENCES mata_kuliah(id_mk)
);

DESCRIBE dosen;
DESCRIBE mahasiswa;
DESCRIBE mata_kuliah;
DESCRIBE krs;

INSERT INTO dosen VALUES 
(1, 'Dr. Budi', 'Pemrograman'),
(2, 'Prof. Siti', 'Basis Data'),
(3, 'Ir. Ahmad', 'Jaringan'),
(4, 'Dian, M.Kom', 'Pemrograman'),
(5, 'Eko, S.T', 'Kecerdasan Buatan'),
(6, 'Rina, M.T', 'Basis Data'),
(7, 'Hadi, Ph.D', 'Keamanan Siber'),
(8, 'Siska, M.SI', 'Sistem Informasi'),
(9, 'Bambang, M.Kom', 'Pemrograman'),
(10, 'Laila, M.T', 'Manajemen Proyek');

INSERT INTO mahasiswa VALUES 
(2201, 'Dhani Kusuma', 'Sistem Informasi', 2022),
(2202, 'Rizky Pratama', 'Sistem Informasi', 2022),
(2301, 'Andi Wijaya', 'Sistem Informasi', 2023),
(2302, 'Bunga Citra', 'Sistem Informasi', 2023),
(2303, 'Dimas Anggara', 'Sistem Informasi', 2023),
(2401, 'Candra Gupta', 'Sistem Informasi', 2024),
(2402, 'Dedi Kurniawan', 'Sistem Informasi', 2024),
(2501, 'Farah Nabila', 'Sistem Informasi', 2025),
(2502, 'Gibran Rakabumi', 'Sistem Informasi', 2025),
(2503, 'Hani Safira', 'Sistem Informasi', 2025),
(2504, 'Irfan Bachdim', 'Sistem Informasi', 2025),
(2505, 'Joko Anwar', 'Sistem Informasi', 2025);

INSERT INTO mata_kuliah VALUES 
('MK01', 'Algoritma & Pemrograman', 4, 1),
('MK02', 'Basis Data Terdistribusi', 3, 2),
('MK03', 'Struktur Data', 3, 4),
('MK04', 'Jaringan Komputer', 3, 3),
('MK05', 'Kecerdasan Buatan', 3, 5),
('MK06', 'Sistem Informasi Akuntansi', 2, 8),
('MK07', 'Pemrograman Web Native', 3, 9),
('MK08', 'Keamanan Informasi', 3, 7),
('MK09', 'Etika Profesi IT', 2, 10),
('MK10', 'Administrasi Basis Data', 3, 6);

INSERT INTO krs VALUES 
(101, 2301, 'MK01', 3),
(102, 2301, 'MK02', 3),
(103, 2201, 'MK05', 5),
(104, 2302, 'MK04', 3),
(105, 2401, 'MK01', 1),
(106, 2402, 'MK07', 2),
(107, 2202, 'MK10', 5),
(108, 2303, 'MK06', 4),
(109, 2201, 'MK08', 6),
(110, 2401, 'MK03', 1);

SELECT * FROM dosen;
SELECT * FROM mahasiswa;
SELECT * FROM mata_kuliah;
SELECT * FROM krs;

-- 1. Query menampilkan kolom nama_mk, sks, dan nama_dosen. Saring data hasil penggabungan agar hanya menampilkan mata kuliah yang diampu oleh dosen dengan bidang_keahlian 'Pemrograman' atau 'Basis Data'.
SELECT mk.nama_mk, mk.sks, d.nama_dosen
FROM mata_kuliah mk
JOIN dosen d ON mk.id_dosen = d.id_dosen
WHERE d.bidang_keahlian IN ('Pemrograman', 'Basis Data');

-- 2. Tampilkan kolom nama_mahasiswa beserta id_mk dari riwayat pengambilan mata kuliah di tabel transaksi. Data mahasiswa yang belum pernah mengambil mata kuliah sama sekali harus tetap ditampilkan dalam hasil pencarian (menghasilkan nilai NULL pada atribut mata kuliah).
SELECT m.nama_mahasiswa, k.id_mk
FROM mahasiswa m
LEFT JOIN krs k ON m.id_mahasiswa = k.id_mahasiswa;

-- 3. Menampilkan nama_mahasiswa, nama_mk, dan semester_ambil. Batasi data hanya pada mahasiswa yang mengambil mata kuliah di rentang semester 3 sampai semester 5. Urutkan hasil akhir berdasarkan semester_ambil dari urutan paling awal (terkecil).
SELECT m.nama_mahasiswa, mk.nama_mk, k.semester_ambil
FROM krs k
JOIN mahasiswa m ON k.id_mahasiswa = m.id_mahasiswa
JOIN mata_kuliah mk ON k.id_mk = mk.id_mk
WHERE k.semester_ambil BETWEEN 3 AND 5
ORDER BY k.semester_ambil ASC;

-- 4. Tampilkan nama_mahasiswa, nama_mk, dan sks. Sistem hanya menampilkan mahasiswa dari program studi 'Sistem Informasi' dengan mata kuliah bobot lebih dari 2 SKS. Urutkan laporan berdasarkan sks paling besar, lalu secara alfabetis berdasarkan nama_mahasiswa.
SELECT m.nama_mahasiswa, mk.nama_mk, mk.sks
FROM krs k
JOIN mahasiswa m ON k.id_mahasiswa = m.id_mahasiswa
JOIN mata_kuliah mk ON k.id_mk = mk.id_mk
WHERE m.program_studi = 'Sistem Informasi'
  AND mk.sks > 2
ORDER BY mk.sks DESC, m.nama_mahasiswa ASC;

-- 5. Menampilkan nama_mahasiswa, angkatan, nama_mk, dan nama_dosen. Hanya mencakup mahasiswa dari rentang angkatan tahun 2023 hingga 2025. Mata kuliah wajib diampu oleh 'Dr. Budi' atau 'Prof. Siti'. Urutkan hasilnya berdasarkan tahun angkatan mahasiswa yang paling baru.
SELECT m.nama_mahasiswa, m.angkatan, mk.nama_mk, d.nama_dosen
FROM krs k
JOIN mahasiswa m ON k.id_mahasiswa = m.id_mahasiswa
JOIN mata_kuliah mk ON k.id_mk = mk.id_mk
JOIN dosen d ON mk.id_dosen = d.id_dosen
WHERE m.angkatan BETWEEN 2023 AND 2025
  AND d.nama_dosen IN ('Dr. Budi', 'Prof. Siti')
ORDER BY m.angkatan DESC;

DROP DATABASE siakad_sandbox;