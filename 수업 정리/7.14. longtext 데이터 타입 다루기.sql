USE sqldb;

drop table if exists maxtbl;
CREATE TABLE maxtbl ( col1 LONGTEXT, col2 LONGTEXT );
INSERT INTO maxtbl VALUES (repeat('ㅋ', 10000000), repeat('A', 10000000));
SELECT * FROM maxtbl;
select length(col1), length(col2) from maxtbl;
