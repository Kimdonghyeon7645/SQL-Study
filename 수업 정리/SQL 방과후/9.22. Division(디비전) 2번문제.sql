SELECT 성명 FROM 학생 JOIN (SELECT 학번 FROM 이수 JOIN 교과목 
							  ON 이수.교과목번호 = 교과목.교과목번호
						   WHERE 학과명 = "소프트웨어개발과"
						   GROUP BY 학번
						  HAVING count(*) = (SELECT count(*) from 교과목 WHERE 학과명 = "소프트웨어개발과")
                          ) AS 뷰 ON 뷰.학번 = 학생.학번; 

 -- NOT EXISTS * 2
SELECT 성명 FROM 학생
 WHERE NOT EXISTS (
	SELECT * FROM 교과목 A 
     WHERE 학과명 = "소프트웨어개발과" 
	   AND NOT EXISTS (
			SELECT * FROM 이수 B 
             WHERE A.교과목번호 = B.교과목번호
               AND B.학번 = 학생.학번));

-- NOT EXISTS, NOT IN
SELECT 성명 FROM 학생
 WHERE NOT EXISTS (
	SELECT * FROM 교과목
	 WHERE 학과명 = "소프트웨어개발과" 
       AND 교과목번호 NOT IN (
		SELECT 교과목번호 FROM 이수
		 WHERE 학생.학번 = 이수.학번));