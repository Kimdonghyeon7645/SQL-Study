-- 1번 문제
-- Show the total population of the world.
-- 세계의 모든 인구를 출력하세요.
SELECT SUM(population) FROM world


-- 2번 문제
-- List all the continents - just once each.
-- 모든 대륙을 한번씩만 출력하세요. 
SELECT continent FROM world
 GROUP BY continent


-- 3번 문제
-- Give the total GDP of Africa
-- 아프리카의 모든 GOD를 출력하세요.
SELECT SUM(gdp) FROM world
 WHERE continent = 'Africa'


-- 4번 문제
-- How many countries have an area of at least 1000000
-- 최소 1000000 이상의 면적을 가진 나라들의 총 개수를 출력하세요.
SELECT COUNT(name) FROM world
 WHERE area >= 1000000


-- 5번 문제
-- What is the total population of ('Estonia', 'Latvia', 'Lithuania')
-- 'Estonia', 'Latvia', 'Lithuania' 의 모든 인구수를 출력하세요.
SELECT SUM(population) FROM world
 WHERE name IN ('Estonia', 'Latvia', 'Lithuania')


-- 6번 문제
-- For each continent show the continent and number of countries.
-- 대륙과 대륙의 총 나라 개수를 출력하세요.
SELECT continent, COUNT(name) FROM world
 GROUP BY continent


-- 7번 문제
-- For each continent show the continent and number of countries with populations of at least 10 million.
-- 대륙, 최소 천만명 이상의 인구를 가진 대륙의 총 나라 개수를 출력하세요.
SELECT continent, COUNT(name) FROM world
 WHERE population >= 10000000
 GROUP BY continent


-- 8번 문제
-- List the continents that have a total population of at least 100 million.
-- 최소 1억 이상의 총 인구를 가진 대륙들을 출력하세요.
SELECT continent FROM world x
 WHERE 100000000 <= 
 (SELECT SUM(population) FROM world y
   WHERE x.continent = y.continent)
 GROUP BY continent