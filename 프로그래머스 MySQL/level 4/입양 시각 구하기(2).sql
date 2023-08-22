WITH RECURSIVE cte AS (
    SELECT  0 AS h
    UNION ALL
    SELECT  h + 1 FROM cte
    WHERE   h < 23
), data AS (
    SELECT  HOUR(DATETIME) AS h
          , COUNT(*) AS c
    FROM    ANIMAL_OUTS
    GROUP BY HOUR(DATETIME)
    ORDER BY HOUR(DATETIME)
)
SELECT  h.h AS HOUR
      , IFNULL(d.c, 0) AS COUNT
FROM    cte h
        LEFT OUTER JOIN DATA d
ON      h.h = d.h


/* WITH RECURSIVE 문 (재귀 쿼리)


0~10까지 있는 테이블을 만들 때, 재귀 퀴리
```sql
WITH RECURSIVE cte AS (
    SELECT  0 AS i
    UNION ALL
    SELECT  i + 1 FROM cte
    WHERE   i < 10
)
SELECT i FROM cte
```
위 소스가
```python3
cte = list(range(0, 10))
for i in cte:
    print(i)
```
와 같다.


> 참고 : https://inpa.tistory.com/entry/MYSQL-📚-RECURSIVE-재귀-쿼리
*/