use sql_study;

-- 학번이 짝수면 짝수, 홀수면 홀수 출력하는 쿼리문
# if(조건문, 참일때 값, 거짓일때 값) : if 문
select 학번, if(학번 % 2 = 0, '짝수', '홀수') as 결과 from 이수;


-- 기말 성적에 따라서 A~E를 출력하는 쿼리문
# CASE 조건 or 값 when 값1 then 표시값 when 값2 then 표시값 ... else 표시값 END : switch 문 
select 기말성적,
		CASE truncate(기말성적 / 10, 0)
			WHEN 10 THEN 'A'
			WHEN 9 THEN 'A'
			WHEN 8 THEN 'B'
			WHEN 7 THEN 'C'
			WHEN 6 THEN 'D'
			ELSE 'E'
		END as 결과 from 이수;

# CASE when 조건식1 then 표시값 when 조건식2 then 표시값 ... else 표시값 END : if, elif 문 
select 기말성적,
		CASE 
			WHEN truncate(기말성적, 0) >= 90 THEN 'A'
			WHEN truncate(기말성적, 0) >= 80 THEN 'B'
			WHEN truncate(기말성적, 0) >= 70 THEN 'C'
			WHEN truncate(기말성적, 0) >= 60 THEN 'D'
			ELSE 'E'
		END as 결과 from 이수;