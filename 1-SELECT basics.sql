-- 1번 문제
-- Modify it to show the population of Germany
-- 독일의 인구를 출력하도록 sql문을 수정하세요.
SELECT population FROM world
  WHERE name = 'Germany'


-- 2번 문제
-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
-- 스웨덴, 노르웨이, 덴마크의 인구와 이름을 출력하세요.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark')


-- 3번 문제
-- Modify it to show the country and the area for countries with an area between 200,000 and 250,000.
-- 면적이 200000이상 250000이하인 나라의 이름과 지역을 출력하세요.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

