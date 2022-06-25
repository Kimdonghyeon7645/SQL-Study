SELECT  COUNT(A.NAME)
FROM    (
SELECT  NAME
FROM    ANIMAL_INS
WHERE   NAME IS NOT NULL
GROUP BY NAME
) A
/*
`every derived table must have its own alias` => 서브쿼리에 별명이 없어서 그렇다.
Oracle에서는 별명이 없어도 되지만, MySQL에선 위같이 에러난다.
*/


-- or
SELECT  COUNT(DISTINCT NAME)
FROM    ANIMAL_INS
WHERE   NAME IS NOT NULL