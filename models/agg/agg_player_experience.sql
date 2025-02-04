SELECT
    CASE
        WHEN YEARS_EXP = 0 THEN 'Rookie'
        WHEN YEARS_EXP BETWEEN 1 AND 2 THEN '1-2 Years'
        WHEN YEARS_EXP BETWEEN 3 AND 5 THEN '3-5 Years'
        ELSE '6+ Years'
    END AS experience_level,
    COUNT(*) AS player_count
FROM {{ ref('stg_seasonal_rosters') }}
GROUP BY 1
ORDER BY 1  