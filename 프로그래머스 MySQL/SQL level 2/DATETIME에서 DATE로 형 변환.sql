# SELECT  ANIMAL_ID,  NAME,   SUBSTR(DATETIME, 1, 10) '날짜'
SELECT  ANIMAL_ID,  NAME,   DATE_FORMAT(DATETIME, '%Y-%m-%d') '날짜'
FROM    ANIMAL_INS