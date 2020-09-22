SELECT 이수.교과목번호 FROM 이수 
  JOIN 교과목 ON 이수.교과목번호 = 교과목.교과목번호
 WHERE 학과명 = "소프트웨어개발과"
 GROUP BY 이수.교과목번호
HAVING (SELECT count(*) from 학생) = count(학번)
