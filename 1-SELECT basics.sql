-- 1번 문제
-- Read the notes about this table. Observe the result of running this SQL command to show the name, continent and population of all countries.
-- 이 표에 대한 참고 사항을 읽어 보세요. 이 SQL 문을 실행한 결과를 보고 모든 국가의 이름, 대륙 및 인구를 출력하세요.
SELECT name, continent, population FROM world


-- 2번 문제
-- How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
-- 최소 2억보다 많은 인구를 가진 나라들의 이름을 출력하세요.
SELECT name FROM world
WHERE population >= 200000000


-- 3번 문제
-- Give the name and the per capita GDP for those countries with a population of at least 200 million.
-- 최소 2억보다 많은 인구를 가진 나라들의 이름과 1인당 gdp (gdp/population)를 출력하세요. 
SELECT name, gdp/population FROM world
WHERE population >= 200000000


-- 4번 문제
-- Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
-- 남미 대륙에 속하는 나라들의 이름과 인구를 백만단위로 나눈 값을 출력하세요.
SELECT name, population/1000000 FROM world
WHERE continent = 'South America'


-- 5번 문제
-- Show the name and population for France, Germany, Italy
-- 프랑스, 독일, 이탈리아의 이름과 인구를 출력하세요.
SELECT name, population FROM world
 WHERE name IN ('France', 'Germany', 'Italy')


-- 6번 문제
-- Show the countries which have a name that includes the word 'United'
-- 나라이름 중 United를 포함하는 이름을 가진 나라를 출력하세요.
SELECT name FROM world
 WHERE name LIKE '%United%'


-- 7번 문제
-- Show the countries that are big by area or big by population. Show name, population and area.
-- 면적이 3백만보다 크거나, 인구 수가 2억5천만보다 크면 큰 나라라고 할때, 큰 나라들의 이름과 인구, 면적을 출력하세요.
SELECT name, population, area FROM world
 WHERE population > 250000000 OR area > 3000000


-- 8번 문제
-- Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
-- 면적만 3백만보다 큰 나라 또는, 인구 수만 2억5천만보다 큰 나라를 (XOR) 출력하세요.
SELECT name, population, area FROM world
 WHERE population > 250000000 XOR area > 3000000


-- 9번 문제
-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. 
-- 남미 대륙의 나라들의 이름과 인구를 백만명으로 나눈 값, GOD를 10억명으로 나눈 값을 소수점 셋째짜리에서 반올림해서 각각 출력하세요. (ROUND 내장함수를 활용)
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world
 WHERE continent = 'South America'


-- 10번 문제
-- Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
-- gdp가 최소 1조보다 많은 나라들의 이름과 1인당 gdp를 백의 자리에서 반올림해서 출력하세요.
SELECT name, ROUND(gdp/population, -3) FROM world
 WHERE gdp > 1000000000000


-- 11번 문제
-- Show the name and capital where the name and the capital have the same number of characters.
-- 수도와 나라의 이름 글자수가 동일한 나라의 이름과 수도를 출력하세요. (LENGTH 내장함수를 활용)
SELECT name, capital FROM world
 WHERE LENGTH(name) = LENGTH(capital)

