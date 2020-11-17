use sql_study;

create table 교수(
	no		smallint	not null,
    name	varchar(10),
	primary key(no)
);
create table 이론(
	no		smallint	not null,
    title	varchar(10),
	primary key(no)
);
create table 공부(
	번호		smallint	not null,
    내용		varchar(10),
	primary key(번호)
);

insert into 교수 values 
	(1, "피아제"),
	(2, "가네"),
	(3, "비고츠키"),
    (4, "켈러");
insert into 이론 values
	(1, "인지구성"),
    (2, "수업"),
    (3, "사회구성"),
    (5, "수업");
insert into 공부 values
	(1, "인지구성"),
    (3, "사회구성");
    
select * from 교수;
select * from 이론;
select * from 공부;
