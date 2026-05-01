DROP TABLE rekam_medis ;

CREATE TABLE rekam_medis (
    id_rekam INT PRIMARY KEY,
    id_pasien INT,
    id_dokter INT,
    tanggal_periksa DATE,
    diagnosis TEXT,
    FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien) ON DELETE RESTRICT,
    FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter) ON DELETE CASCADE
); 

SELECT * FROM rekam_medis; 

SELECT * FROM dokter;

DELETE FROM dokter
WHERE id_dokter  = 3 ;

INSERT INTO dokter VALUES (3, 'dr. Andi', 'Umum'), (4, 'dr. Budi', 'Anak');
SELECT *FROM dokter

INSERT INTO pasien VALUES (101, 'Siti', '1995-05-10', '0899999'), (102, 'Iwan', '1990-12-20', '0856789');
SELECT *FROM pasien

INSERT INTO rekam_medis VALUES (501, 101, 3, '2024-03-01', 'Flu'), (502, 102, 4, '2024-03-02', 'Batuk');
SELECT *FROM rekam_medis

INSERT INTO dokter VALUES (3, 'dr. Andi', 'kulit')

UPDATE rekam_medis SET id_dokter = '3' WHERE id_rekam = 502;
SELECT *FROM rekam_medis



