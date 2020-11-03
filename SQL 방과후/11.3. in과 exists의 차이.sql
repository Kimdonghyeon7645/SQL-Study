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


-- IN 과 EXISTS
-- IN : 서브쿼리 수행후 -> 메인쿼리 수행
-- EXISTS : 메인쿼리 수행후 -> 서브쿼리 수행

SELECT * FROM SQLD_21_01 A
 WHERE EXISTS (SELECT V1 FROM SQLD_21_02 B
				   WHERE A.V1 = B.V1);

SELECT * FROM SQLD_21_01 A
 WHERE NOT EXISTS (SELECT V1 FROM SQLD_21_02 B
					   WHERE A.V1 = B.V1);


SELECT * FROM SQLD_21_01 
 WHERE V1 IN (SELECT V1 FROM SQLD_21_02);

SELECT * FROM SQLD_21_01 
 WHERE V1 NOT IN (SELECT V1 FROM SQLD_21_02);
-- 이 쿼리문을 실행하면, 4와 C가 나올것이란 예상과 다르게, 아무것도 출력되지 않는다.
-- 그 이유는 NOT IN 자체가, 서브쿼리에서 출력한 결과들을 하나 하나씩 존재하는지 비교해보는데, 서브쿼리에서 만약 'A', 'B'가 나왔다면,
# SELECT * FROM SQLD_21_01
#  WHERE V1 NOT IN (SELECT V1 FROM SQLD_21_02);
-- 위의 쿼리문은,
# SELECT * FROM SQLD_21_01
#  WHERE V1 NOT IN ('A', 'B');
-- 위와 동일하고,
# SELECT * FROM SQLD_21_01
#  WHERE V1 != 'A'
#    AND V1 != 'B';
-- 위와 결국 똑같다.
-- 그런데 서브쿼리에서 NULL이 나왔다면,
#    AND V1 != NULL;
-- 와 같이 NULL도 일치하는지 비교해볼텐데,
-- 기억을 더듬어보면, NULL이 들어간 모든 연산은 참이든 거짓이든, UNKNOWN이라서 TRUE가 될 수 없다.
-- 그래서 NOT IN 했을때 아무 것도 출력되지 않은 것이다.

-- 따라서 원래 원하는 역할을 하고 싶으면,
SELECT * FROM SQLD_21_01
 WHERE V1 NOT IN (SELECT V1 FROM SQLD_21_02
                   WHERE V1 IS NOT NULL);
-- 이처럼 IS NOT NULL 옵션을 붙여주자.