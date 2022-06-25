use sql_study;


# 학생 테이블에 학번 열을 참조하는 외래키 '멘토' 열 추가
-- alter table 테이블이름 add FOREIGN KEY(columnName) REFERENCES 참조테이블(참조컬럼);
alter table 학생 add 멘토 smallint;
alter table 학생 add foreign key(멘토) references 학생(학번);
select * from 학생;
desc 학생;

update 학생 set 멘토 = 3121 where 학번 = 1122;
update 학생 set 멘토 = 3121 where 학번 = 1343;
update 학생 set 멘토 = 3232 where 학번 = 2130;
update 학생 set 멘토 = 3121 where 학번 = 2225;
update 학생 set 멘토 = 3324 where 학번 = 2330;


-- 멘토가 있는 학생의 학번, 성명과 멘토의 학번, 성명을 구하는 쿼리문
select 멘티.학번, 멘티.성명, 멘토.학번, 멘토.성명 from 학생 as 멘티, 학생 as 멘토 where 멘티.멘토 = 멘토.학번;


-- 학생별 멘티의 수를 구하는 쿼리문
select 멘토.학번 as 학번, count(멘티.학번) as "멘티의 수" from 학생 멘토 left join 학생 멘티 on 멘토.학번 = 멘티.멘토 group by 멘토.학번;
