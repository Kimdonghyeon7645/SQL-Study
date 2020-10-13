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
-- Show all details of the presidential winners
-- 대통령 수상자들의 모든 정보를 출력하세요.
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')


-- 7번 문제
-- Show the winners with first name John
-- 첫번째 이름(성)이 John으로 시작하는 수상자들의 이름을 출력하세요.
SELECT winner FROM nobel
 WHERE winner LIKE 'John%'


-- 8번 문제
-- Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
-- 1984년도 화학 노벨 수상자와 1980년도 물리 노벨 수상자의 연도, 항목의 이름을 출력하세요.
SELECT yr, subject, winner FROM nobel
 WHERE subject = 'Physics' AND yr = 1980 
    OR subject = 'Chemistry' AND yr = 1984 


-- 9번 문제
-- Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
-- 화학과 의학 노벨상을 제외한 1980년도에 수상한 수상자의 년도, 항목, 이름을 출력하세요.
SELECT yr, subject, winner FROM nobel
 WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine')


-- 10번 문제
-- Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
-- 일찍(1910년도 미만) 의학 노벨상을 수상한 수상자들과, 최근(2004년도 이상)에 문학 노벨상을 수상한 수상자들의 연도, 항목, 이름을 출력하세요.
SELECT yr, subject, winner FROM nobel
 WHERE subject = 'Medicine' AND yr < 1910 
    OR subject = 'Literature' AND yr >= 2004 


-- 11번 문제
-- Find all details of the prize won by PETER GRÜNBERG
-- PETER GRÜNBERG 가 탄 상의 모든 정보를 출력하세요.
SELECT * FROM nobel
 WHERE winner = 'PETER GRÜNBERG' 


-- 12번 문제
-- Find all details of the prize won by EUGENE O'NEILL
-- EUGENE O'NEILL 가 탄 상의 모든 정보를 출력하세요.
SELECT * FROM nobel
 WHERE winner = 'EUGENE O\'NEILL'
-- 아래와 같이 이스케이프 처리를 안하고도 처리할 수 있다.
SELECT * FROM nobel
 WHERE winner = "EUGENE O'NEILL"


-- 13번 문제
-- List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
-- 이름이 Sir로 시작하는 수상자들의 이름과 년도, 항목을 최근순과 우승자 이름순으로 출력하세요.
SELECT winner, yr, subject FROM nobel
 WHERE winner LIKE 'Sir%'


-- 14번 문제
-- Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
-- 1984년에 수상한 우승자의 이름과 항목을 항목순과 우승자 이름순으로 출력하세요, 여기서 화학과 물리는 마지막에 출력하세요.
SELECT winner, subject FROM nobel
 WHERE yr = 1984
 ORDER BY subject IN ('Physics','Chemistry'), subject, winner
