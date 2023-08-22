SELECT  *
FROM    PLACES
WHERE   HOST_ID IN (
    SELECT  HOST_ID
    FROM    PLACES
    GROUP BY HOST_ID
    HAVING  COUNT(HOST_ID) > 1
)
ORDER BY ID

-- JOIN으로 풀면...
SELECT  a.*
FROM    PLACES a
        INNER JOIN (
            SELECT  HOST_ID
            FROM    PLACES
            GROUP BY HOST_ID
            HAVING  COUNT(HOST_ID) > 1
        ) b
ON a.HOST_ID = b.HOST_ID
ORDER BY a.ID
