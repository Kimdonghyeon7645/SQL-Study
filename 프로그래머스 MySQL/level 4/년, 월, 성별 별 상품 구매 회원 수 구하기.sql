SELECT YEAR
     , MONTH
     , GENDER
     , COUNT(*) AS USERS
  FROM (
        SELECT YEAR(s.SALES_DATE) AS YEAR
             , MONTH(s.SALES_DATE) AS MONTH
             , i.GENDER AS GENDER
             , s.USER_ID AS USER_ID
          FROM ONLINE_SALE s
         INNER JOIN USER_INFO i
            ON s.USER_ID = i.USER_ID
         WHERE i.GENDER IS NOT NULL
         GROUP BY YEAR, MONTH, USER_ID
  ) a
 GROUP BY YEAR, MONTH, GENDER
 ORDER BY YEAR, MONTH, GENDER;