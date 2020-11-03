use sql_study;
create table if not exists SQLD_21_01(
	N1	SMALLINT	not null,
    V1  CHAR(1),
    primary key (N1)
);
create table if not exists SQLD_21_02(
	N1	SMALLINT	not null,
    V1  CHAR(1),
    primary key (N1)
);


insert into SQLD_21_01 values
	(1, 'A'),
    (2, null),
    (3, 'B'),
    (4, 'C');
insert into SQLD_21_02 values
	(1, 'A'),
    (2, null),
    (3, 'B');
    
SELECT * FROM SQLD_21_01 
 WHERE V1 IN (SELECT V1 FROM SQLD_21_02);

SELECT * FROM SQLD_21_01 
 WHERE V1 NOT IN (SELECT V1 FROM SQLD_21_02);

SELECT * FROM SQLD_21_01 A 
 WHERE EXISTS (SELECT V1 FROM SQLD_21_02 B
				   WHERE A.V1 = B.V1);
 
SELECT * FROM SQLD_21_01 A
 WHERE NOT EXISTS (SELECT V1 FROM SQLD_21_02 B
					   WHERE A.V1 = B.V1);
                       
