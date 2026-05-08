CREATE TABLE pelanggan_setia (
		nomor_identitas INT PRIMARY KEY
    );
    
SHOW TABLES;
DESCRIBE pelanggan_setia;

ALTER TABLE pelanggan_setia
MODIFY COLUMN nomor_identitas VARCHAR(20);
