use sql_study;

-- 뷰 생성하기 (https://kkamikoon.tistory.com/172)
create view 성적뷰(전공, 학생수) as 
select 학생1.전공, count(학생1.학번) from 학생1, 등록1
 where 학생1.학번 = 등록1.학번
   and 등록1.성적 = "A"
 group by 학생1.전공;
 
-- 생성된 뷰 조회
SELECT * FROM 성적뷰;
