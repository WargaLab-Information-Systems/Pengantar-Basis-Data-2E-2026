DROP TABLE rekam_medis ;

CREATE TABLE rekam_medis (
    id_rekam INT PRIMARY KEY,
    id_pasien INT,
    id_dokter INT,
    tanggal_periksa DATE,
    diagnosis TEXT,
    FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien) ON DELETE RESTRICT,
    FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter) ON DELETE RESTRICT
); 

SELECT * FROM rekam_medis; 

INSERT INTO rekam_medis VALUES (501, 101, 3, '2024-03-01', 'Flu'), (502, 102, 4, '2024-03-02', 'Batuk');

TRUNCATE TABLE rekam_medis;
TRUNCATE TABLE pasien;
