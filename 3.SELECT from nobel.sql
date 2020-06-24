-- 1번 문제
-- Change the query shown so that it displays Nobel prizes for 1950.
-- 1950년도 노벨상 수상자들이 보여지도록 쿼리(query)를 수정하세요.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950


-- 2번 문제
-- Show who won the 1962 prize for Literature.
-- 1962년에 문학 노벨상을 수상한 수상자의 이름을 출력하세요.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'


-- 3번 문제
-- Show the year and subject that won 'Albert Einstein' his prize.
-- Albert Einstein이 수상했던 년도와 항목을 출력하세요.
SELECT yr, subject FROM nobel
 WHERE winner = 'Albert Einstein'


-- 4번 문제
-- Give the name of the 'Peace' winners since the year 2000, including 2000.
-- 2000년도부터, 평화 노벨상을 수상한 수상자들의 이름을 출력하세요.
SELECT winner FROM nobel
 WHERE subject = 'Peace'
   AND yr >= 2000


-- 5번 문제
-- Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
-- 1980년도와 1989년도 사이에 문학 노벨상을 수상한 수상자들의 정보(년도, 항목, 이름)을 출력하세요.
SELECT yr, subject, winner FROM nobel
 WHERE yr BETWEEN 1980 AND 1989 
   AND subject = 'Literature'


-- 6번 문제
-- 
-- 
