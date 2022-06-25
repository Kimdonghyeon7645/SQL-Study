use sql_study;
# 다양한 조인 기법 : https://wisoft.tistory.com/entry/database-sql-join-method

-- (동등조인) 2학년 학생들이 이수한 교과목번호를 구하는 쿼리문
# inner join () = () : 동등 조인
select 교과목번호 from 이수 i inner join (select * from 학생 where 학번 like '2%') s on s.학번 = i.학번;
select 교과목번호 from 이수 i join (select * from 학생 where 학번 like '2%') s on s.학번 = i.학번;
select 교과목번호 from 이수, 학생 where 학번 like '2%';		# 묵시적으로 join 표현을 생략 -> 교차조인(곱)이 됨 (동등 조인이 아님!)
select 교과목번호 from 이수 where 학번 like '2%';	# join 없이도 해결 가능


-- (자연조인) 데이터베이스 과목을 이수한 학생의 학번과 중간성적, 기말성적을 구하는 쿼리문
# natural join () = () : 자연 조인
select 학번, 중간성적, 기말성적 from 이수 natural join 교과목 where 교과목명 = "데이터베이스";
select 학번, 중간성적, 기말성적 from 이수 where 교과목번호 = (select 교과목번호 from 교과목 where 교과목명 = "데이터베이스");	# join 없이도 해결 가능


# (학생과 교과목 테이블에 각각 하나의 튜플을 삽입)
insert into 학생 value (3324, "이원영", "임베디드소프트웨어과", 2019);
insert into 교과목 value ("C500", "인공지능", "소프트웨어개발과", 3);


-- (외부조인) 전체학생이 이수한 과목에 대한 정보를 포함하는 테이블이 생성되는 쿼리문
# left outer join 또는 right outer join : 외부 조인 (outer 명시를 생략할 수 있음)
select * from 학생 left join 이수 on 학생.학번 = 이수.학번;


-- (완전외부조인) 학생 테이블과 이수 테이블을 완전외부조인하는 쿼리문
# full outter join : mysql
(select * from 학생 left join 이수 on 학생.학번 = 이수.학번) union 
(select * from 학생 right join 이수 on 학생.학번 = 이수.학번);
