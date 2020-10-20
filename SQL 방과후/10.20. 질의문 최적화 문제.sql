use sql_study;


-- 소프트웨어개발과 학생 중 중간고사 성적이 80점 이상인 학생의 학번과 이름
select 학번, 성명 from 학생
 where 학번 in (select 학번 from 이수 where 중간성적 >= 80)
   and 학과명="소프트웨어개발과";		# join 없이 풀이
select distinct 부분학생.학번, 성명 
  from (select 학번 from 이수 where 중간성적 >= 80) as 부분이수 join (select 학번, 성명 from 학생 where 학과명="소프트웨어개발과") as 부분학생
	on 부분이수.학번 = 부분학생.학번;	# join + 최적화 풀이

 
-- 소프트웨어개발과 과목의 중간고사 성적이 80점 이상인 학생의 학번
select 학번 from 이수
 where 중간성적 >= 80
   and 교과목번호 in (select 교과목번호 from 교과목 where 학과명="소프트웨어개발과");		# join 안쓴 풀이
select 학번 
  from (select 교과목번호 from 교과목 where 학과명="소프트웨어개발과") as 부분교과목 join (select 교과목번호, 학번 from 이수 where 중간성적 >= 80) as 부분이수
	on 부분교과목.교과목번호 = 부분이수.교과목번호;	# join 문 풀이
    

-- 교과목번호가 C234인 과목을 수강하는 2학년 학생의 학번과 이름
select 학번, 성명 from 학생
 where 학번 like "2%"
   and 학번 in (select 학번 from 이수 where 교과목번호="C234");	# join 없는 풀이
select 부분학생.학번, 성명 
  from (select 학번, 성명 from 학생 where 학번 like "2%")as 부분학생 join (select 학번 from 이수 where 교과목번호="C234")as 부분이수
    on 부분학생.학번 = 부분이수.학번;		# join 문 풀이
    
    
-- 정소화 학생이 이수한 교과목 중 평균 80점 이상의 교과목번호와 평균점수
select 교과목번호, round((중간성적+기말성적)/2 ,0)as 평균점수 from 이수
 where 학번 = (select 학번 from 학생 where 성명="정소화");	# join 없는 풀이
select 교과목번호, round((중간성적+기말성적)/2, 0)as 평균점수
  from 이수 join (select 학번 from 학생 where 성명="정소화")as 부분학생 
    on 부분학생.학번 = 이수.학번;		# join 문 풀이
    
    
-- 2019년 입학 학생중 데이터베이스과목 중간고사 성적이 80점 이상인 학생 학번
select 학번 from 학생
 where 학번 in (select 학번 from 이수 where 중간성적 >= 80 and 교과목번호 = (select 교과목번호 from 교과목 where 교과목명="데이터베이스"))
   and 입학년도 = 2019;	# join 없는 풀이
select 부분학생.학번
from (select 학번 from 학생 where 입학년도 = 2019)as 부분학생
	join ((select 교과목번호, 학번 from 이수 where 중간성적 >= 80)as 부분이수 join (select 교과목번호 from 교과목 where 교과목명='데이터베이스')as 부분과목 ON 부분이수.교과목번호=부분과목.교과목번호)
   ON 부분이수.학번 = 부분학생.학번;	# FIXME 무슨 이유로 이 sql문이 굴러가고, 원래대로 하면 에러가 날까?
   
   
-- 
