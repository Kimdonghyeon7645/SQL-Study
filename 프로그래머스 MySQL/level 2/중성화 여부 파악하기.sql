SELECT    ANIMAL_ID	
        , NAME	
        , CASE
            WHEN SEX_UPON_INTAKE IN ('Neutered Male', 'Spayed Female') THEN 'O'
            ELSE 'X'
        END '중성화'
FROM    ANIMAL_INS