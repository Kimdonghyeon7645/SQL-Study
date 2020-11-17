use sql_study;

create table 학생1(
	학번		int	    not null,
    이름	    varchar(3),
    전공	    varchar(10),
	primary key(학번)
);
create table 과목1(
	과목번호	varchar(4)  not null,
    과목명	varchar(10),
    학점	    smallint,
	primary key(과목번호)
);
create table 등록1(
	학번		int	    not null,
    과목번호	varchar(4)  not null,
    성적	    varchar(1),
	primary key(학번, 과목번호)
);

insert into 학생1 values
	(100, "홍길동", "컴퓨터"),
	(101, "최민우", "컴퓨터"),
	(102, "박준석", "컴퓨터"),
	(103, "김인식", "수학"),
    (104, "안성호", "수학");
insert into 과목1 values
	("C100", "자료구조", 3),
	("C200", "컴퓨터구조", 3),
	("P100", "심리학", 3),
	("M100", "미적분", 3),
	("M200", "대수학", 3);
insert into 등록1 values
    (100, "C100", "A"),
    (101, "C100", "A"),
    (101, "C200", "A"),
    (102, "M100", "C"),
    (102, "C200", "C"),
    (103, "M200", "B"),
    (104, "C200", "C"),
    (104, "M100", "A");

select * from 학생1;
select * from 과목1;
select * from 등록1;
