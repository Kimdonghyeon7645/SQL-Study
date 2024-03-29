SELECT AUTHOR_ID
     , AUTHOR_NAME
     , CATEGORY
     , SUM(TOTAL_SALES) AS TOTAL_SALES
  FROM (
    SELECT b.AUTHOR_ID
         , (
             SELECT a.AUTHOR_NAME
               FROM AUTHOR a
              WHERE a.AUTHOR_ID = b.AUTHOR_ID
         ) AS AUTHOR_NAME
         , b.CATEGORY
         , b.PRICE * s.SALES AS TOTAL_SALES
      FROM BOOK_SALES s
     INNER JOIN BOOK b
        ON s.BOOK_ID = b.BOOK_ID
     WHERE s.SALES_DATE BETWEEN '2022-01-01' AND '2022-01-31'
  ) t
 GROUP BY AUTHOR_ID, CATEGORY
 ORDER BY AUTHOR_ID, CATEGORY DESC;