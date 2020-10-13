-- 1번문제 : Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
-- 모든 독일의 득점 골에 대해서 matchid와 선수이름을 출력하는 것을 수정하세요. 독일 선수를 식별하는 것은 teamid = 'GER'으로 식별하세요.
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'


-- 2번문제 : Show id, stadium, team1, team2 for just game 1012
-- 1012번째 게임의 id, 경기장, 팀1, 팀2를 출력하세요.
SELECT id, stadium, team1, team2 FROM game
 WHERE id = 1012

-- 3번문제 : Modify it to show the player, teamid, stadium and mdate for every German goal.
-- 모든 독일의 골의 선수, 팀id, 경기장, 날짜를 출력하는 것을 수정하세요.
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid) AND teamid = 'GER'


-- 4번문제 : Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
-- Mario 라 불리는 선수가 넣은 모든 골의 팀1과 팀2, 플레이어를 출력하세요.
SELECT team1, team2, player 
  FROM goal JOIN game ON id = matchid AND player LIKE 'Mario%'
-- 아래와 같이 필터링은 따로 WHERE 절을 사용한다.
SELECT team1, team2, player 
  FROM goal JOIN game ON id = matchid 
 WHERE player LIKE 'Mario%'


-- 5번문제 : Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10   -- 시험문제 나옴 --
-- 10분 전에 넣은 모든 골의 선수, 팀명, 코치명, 골넣은 시간을 출력하세요.
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON teamid = id AND gtime <= 10


-- 6번문제 : List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
-- Fernando Santos가 team1의 코치인 경기의 날짜와 팀이름을 출력하세요.
SELECT mdate, teamname 
  FROM game JOIN eteam ON game.team1 = eteam.id AND coach = 'Fernando Santos'


-- 7번문제 : List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
-- 'National Stadium, Warsaw' 경기장에서 골을 넣은 선수들을 출력하세요.
SELECT player 
  FROM goal JOIN game ON goal.matchid = game.id AND stadium = 'National Stadium, Warsaw'


-- 8번문제 : Instead show the name of all players who scored a goal against Germany.
-- 대신에, 독일을 상대로 골을 넣은 모든 선수들의 이름을 출력하세요.
SELECT DISTINCT player
  FROM goal JOIN game ON matchid = id 
 WHERE (team1 = 'GER' OR team2 = 'GER') 
   AND teamid != 'GER'


-- 9번문제 : Show teamname and the total number of goals scored.
-- 팀명과 그 팀이 얻은 총 점수를 출력하세요.
SELECT teamname, COUNT(teamname)
  FROM goal JOIN eteam ON id = teamid
 GROUP BY teamname


-- 10번문제 : Show the stadium and the number of goals scored in each stadium.
-- 각 경기장의 이름과, 경기장에서 얻은 총 점수를 출력하세요.
SELECT stadium, COUNT(stadium)
  FROM goal JOIN game ON id = matchid
 GROUP BY stadium


-- 11번문제 : For every match involving 'POL', show the matchid, date and the number of goals scored.
-- POL(폴란드)와 관련된 모든 매치에서, 매치id와 날짜, 넣은 골의 개수를 출력하세요.
SELECT matchid, mdate, COUNT(id)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
 GROUP BY id


-- 12번문제 : For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
-- GER(독일)이 점수를 딴 매치에서, 매치id와 날짜, 독일이 얻은 점수를 출력하세요.
SELECT matchid, mdate, COUNT(teamid)
  FROM goal JOIN game ON matchid = id
 WHERE teamid = 'GER'
 GROUP BY id


-- 13번문제 : List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
-- 
SELECT mdate,
  team1, sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,   -- score1 앞에 AS 가 생략
  team2, sum(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
  GROUP BY mdate, team1, team2
  ORDER BY mdate, team1, team2  -- 정렬은 생략해도 되긴 됨

-- ** CASE END 와, WHEN THEN ESLE 문 문법
-- CASE
--   WHEN (조건절)
--     then (참일 때의 실행절)
--     else (거짓일 때의 실행절)
--   WHEN (조건절)
--     then (참일 때의 실행절)
--     else (거짓일 때의 실행절)
-- END
