-- 1번 문제
-- List each country name where the population is larger than that of 'Russia'.
-- : 인구가 러시아보다 큰 나라의 이름을 리스트로 출력하세요.
SELECT name FROM world
 WHERE population >
    (SELECT population FROM world
      WHERE name='Russia')


-- 2번 문제
-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
-- : 영국보다 인구당 GDP가 큰 유럽의 나라들을 출력하세요.
SELECT name FROM world
 WHERE continent = 'Europe'
   AND GDP / population > 
    (SELECT GDP / population FROM world
      WHERE name='United Kingdom')
      

-- 3번 문제
-- List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
-- 아르헨티나와 오스트렐리아 둘 중 하나를 포함하는 대륙의 나라의 이름과, 그 나라의 대륙을 리스트로 출력하세요. 나라의 이름은 정렬하세요(오름차순).
SELECT name, continent FROM world
 WHERE continent IN 
    (SELECT continent FROM world
     WHERE name IN ('Argentina', 'Australia'))
 ORDER BY name ASC


-- 4번 문제
-- Which country has a population that is more than Canada but less than Poland? Show the name and the population.
-- 폴란드보단 적지만, 캐나다보단 많은 인구를 가진 나라가 있나요? 그나라의 인구와 이름을 출력하세요.
SELECT name, population FROM world
 WHERE population > (SELECT population FROM world WHERE name = 'Poland')
   AND population < (SELECT population FROM world WHERE name = 'Canada')


-- 5번 문제
-- Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
-- 유럽의 나라의 이름과 인구를 출력하세요, 인구는 독일 인구의 퍼센트로 출력하세요.
-- 힌트 : ROUND()로 반올림을 할 수 있으며, CONCAT()으로 문자열을 합칠 수 있습니다.
SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany') * 100, 0), '%') AS percentage FROM world
 WHERE continent = 'Europe'


-- 6번 문제
-- Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
-- 유럽의 모든 나라보다 GDP가 큰 나라의 이름을 출력하세요. (어떤 나라는 GDP 값이 NULL일 수도 있습니다.)
SELECT name FROM world
 WHERE gdp > 
    (SELECT gdp FROM world 
      WHERE continent = 'Europe' 
      ORDER BY gdp DESC LIMIT 1)
-- (참고: ALL, ANY와 같은 내장함수를 활용할 수 있음, 여기선 ALL으로 괄호 안의 모든 값들보다 가장 큰 값을 추출함.)
SELECT name FROM world
 WHERE gdp > ALL(
    (SELECT gdp FROM world 
     WHERE continent = 'Europe'
       AND gdp > 0))


-- 7번 문제
-- Find the largest country (by area) in each continent, show the continent, the name and the area
-- 대륙들마다의 가장 큰 나라(area로 비교했을 때)를 찾고, 그나라의 대륙과, 이름, 면적을 출력하세요.
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
      WHERE y.continent=x.continent
        AND area > 0)
-- 위의 상관쿼리(world 테이블을 x라는 별칭으로 붙이는 방법)을 사용해도 되고, 아래처럼 해도 된다.
SELECT continent, name, area FROM world
 WHERE area IN (SELECT MAX(area) FROM world GROUP BY continent)


-- 8번 문제
-- List each continent and the name of the country that comes first alphabetically.
-- 알파벳순(alphabetically)으로 첫번째에 오는 나라의 대륙과 이름을 출력하세요.
SELECT continent, name FROM world
 GROUP BY continent


-- 9번 문제
-- Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
-- 모든 나라가 인구수 25000000(2천5백만)명보다 작은 대륙을 찾아서, 대륙에 대한 나라들의 이름들을 찾아서, 그나라의 이름과 대륙, 인구를 출력하세요.
SELECT name, continent, population FROM world x
 WHERE 25000000 >= 
 ALL(SELECT population FROM world y
     WHERE x.continent = y.continent)


-- 10번 문제
-- Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
-- 어떤 나라들은 같은 대륙의 이웃나라보다 3배이상의 인구를 가지고 있습니다. 그 나라와 대륙을 출력하세요.
SELECT name, continent FROM world x
 WHERE population / 3 > 
    ALL(SELECT population FROM world y
      WHERE x.continent = y.continent
        AND x.name != y.name)