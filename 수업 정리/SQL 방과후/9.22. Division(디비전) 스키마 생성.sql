# database 생성 단계
create database if not exists sql_study;
use sql_study;
drop table if exists 학생;
drop table if exists 교과목;
drop table if exists 이수;

# 테이블 create 단계
create table if not exists 학생(
	학번	SMALLINT	not null,
    성명	TINYTEXT	not null,
    학과명	TEXT	not null,
    입학년도 SMALLINT not null,
    PRIMARY KEY (학번)
);

create table if not exists 교과목(
	교과목번호	CHAR(4)		not null,
    교과목명	TINYTEXT	not null,
    학과명	TEXT		not null,
    주당수업시간 TINYINT 	not null,
    PRIMARY KEY (교과목번호)
);

create table if not exists 이수(
	학번		SMALLINT	not null,
    교과목번호	CHAR(4)		not null,
    중간성적	TINYINT		not null,
    기말성적	TINYINT		not null,
	PRIMARY KEY (학번, 교과목번호),
    FOREIGN KEY (학번) REFERENCES 학생(학번),
    FOREIGN KEY (교과목번호) REFERENCES 교과목(교과목번호)
);

# 테이블 잘 생성됬는지 확인 단계
show tables;
desc 학생;
desc 교과목;
desc 이수;

# 테이블에 실제 데이터 insert 단계
insert into 학생 values 
	(1122, "정소화", "공통과정", 2020),
	(1343, "원희석", "공통과정", 2020),
	(2130, "김선우", "소프트웨어개발과", 2019),
	(2225, "김철수", "소프트웨어개발과", 2019),
	(2330, "채광주", "임베디드소프트웨어과", 2019),
	(3121, "성원용", "소프트웨어개발과", 2018),
	(3232, "오형준", "소프트웨어개발과", 2017),
	(3424, "고명석", "정보보안과", 2018);

insert into 교과목 values
	("C111", "자료구조", "공통과정", 7),
	("C123", "프로그래밍", "공통과정", 7),
	("C234", "데이터베이스", "소프트웨어개발과", 3),
	("C356", "운영체제", "소프트웨어개발과", 3),
	("C366", "네트워크", "정보보안과", 3),
	("C412", "컴퓨터구조", "임베디드소프트웨어과", 2);
    
insert into 이수 values
	(1122, "C111", 100, 80),
	(1122, "C123", 93, 96),
	(1122, "C234", 52, 47),
	(1122, "C356", 60, 50),
	(1122, "C366", 86, 68),
	(1122, "C412", 100, 59),
	(1343, "C111", 70, 100),
	(1343, "C234", 66, 56),
	(2130, "C234", 72, 82),
	(2225, "C234", 46, 64),
	(2225, "C356", 65, 89),
	(2330, "C234", 100, 97),
	(3121, "C234", 56, 70),
	(3121, "C366", 88, 50),
	(3121, "C412", 91, 73),
	(3232, "C111", 76, 38),
	(3232, "C234", 80, 90),
	(3424, "C234", 100, 95),
	(3424, "C356", 98, 79);
    
# 테이블에 데이터가 잘 들어갔는지 확인 단계
select * from 학생;
select * from 교과목;
select * from 이수;
