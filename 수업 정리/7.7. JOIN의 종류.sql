DROP database if exists test;
CREATE database test;
USE test;

-- 상품 테이블 만들기
CREATE TABLE product(
	no		INT			NOT NULL	primary key,
    name	CHAR(20)	NOT NULL,
    price	INT			NOT NULL
);

INSERT INTO product values (1, '외출권', 20000);
INSERT INTO product values (2, '자유외출권', 40000), (3, '자유외박권', 80000), (4, '학교탈출권', 160000);

-- 판매 테이블 만들기
CREATE TABLE sale(
	no		INT			NOT NULL	primary key,
    id		CHAR(8)		NOT NULL,
    name 	CHAR(20)	NOT NULL
);

INSERT INTO sale values (1, '1번', '외출권');
INSERT INTO sale values (2, '12번', '외출권'), (3, '3번', '자유외출권'), (4, '1번', '자유외박권');
INSERT INTO sale values (5, '9번', '자유외박권'), (6, '3번', '외박권');

-- 잘 나왔는지 확인
SELECT * FROM product;
SELECT * FROM sale;


-- 이제 조인 들어갑니다!	
-- JOIN(조인)의 문법과 종류


-- Cross JOIN(크로스 조인), 카티전 조인, 교차 결합 (product와 sale의 모든 레코드끼리 모두 조인)
SELECT * FROM product JOIN sale;	
SELECT * FROM sale JOIN product;	-- 앞에 sale 테이블이 오는 크로스 조인	

-- INNER JOIN(이너 조인), 
SELECT * FROM product p JOIN sale s ON p.name = s.name;		-- ON 대신에 WHERE 를 써도 됨(ON이 최신 방법)
                        
-- OUTTER JOIN(아우터 조인),
SELECT * FROM product p LEFT JOIN sale s ON p.name = s.name;	-- 왼쪽 테이블의 레코드와 매칭되지 않는 값은 NULL 이 들어감
SELECT * FROM product p RIGHT JOIN sale s ON p.name = s.name;	-- 오른쪽 테이블의 레코드와 매칭되지 않는 값은 NULL 로 들어감
