SELECT CAR_ID
     , IF(SUM(AVAILABILITY) = 0,'대여 가능','대여중') AS AVAILABILITY
  FROM (
    SELECT CAR_ID
     , IF(
         DATEDIFF(START_DATE, '2022-10-16') <= 0 AND DATEDIFF(END_DATE, '2022-10-16') >= 0,1,0
       ) AS AVAILABILITY
      FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
  ) c
 GROUP BY CAR_ID
 ORDER BY CAR_ID DESC;