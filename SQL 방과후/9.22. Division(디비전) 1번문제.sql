SELECT 교과목번호 FROM 이수
 GROUP BY 교과목번호
 HAVING (SELECT count(*) from 학생) = count(학번)