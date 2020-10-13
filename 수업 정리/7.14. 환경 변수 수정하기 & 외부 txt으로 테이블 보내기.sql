SELECT @@max_allowed_packet;
SHOW variables;
SHOW variables LIKE 'secure%';
SELECT @@secure_file_priv;

show databases;
use pj_db;
show tables;
select * from gu_0;

SELECT * INTO OUTFILE 'C:/TEMP/gu_0.txt' FROM gu_0;
