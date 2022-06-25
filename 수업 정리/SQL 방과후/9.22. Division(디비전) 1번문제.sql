SELECT 교과목번호 FROM 이수
 GROUP BY 교과목번호
 HAVING (SELECT count(*) from 학생) = count(학번);

 -- NOT EXISTS * 2
SELECT 교과목명 FROM 교과목
 WHERE NOT EXISTS (
	SELECT 학생.학번 FROM 학생
	 WHERE NOT EXISTS ( 
		 SELECT 이수.학번 FROM 이수
		  WHERE 교과목.교과목번호 = 이수.교과목번호
            AND 학생.학번 = 이수.학번));

-- NOT EXISTS, NOT IN
SELECT 교과목명 FROM 교과목
 WHERE NOT EXISTS (
	SELECT 학생.학번 FROM 학생
	 WHERE 학번 NOT IN (
		SELECT 학번 FROM 이수
		 WHERE 이수.교과목번호 = 교과목.교과목번호));
