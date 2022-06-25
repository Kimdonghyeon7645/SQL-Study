use sql_study;

-- 학번 순으로 3명의 학생을 구하는 쿼리문
select * from 학생 order by 학번 asc limit 3;	


-- 중간성적 높은 순으로 학번, 교과목 번호 구하는 쿼리문
# limit 개수 : 주어진 개수만큼 상위 행만 출력 (desc : 내림차순, asc : 오름차순)
select 학번, 교과목번호 from 이수 order by 중간성적 desc;
