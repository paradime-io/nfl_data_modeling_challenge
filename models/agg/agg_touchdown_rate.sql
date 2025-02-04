WITH touchdown_rate AS (
    SELECT
        PLAYER_ID,
        CASE 
            WHEN SUM(ATTEMPTS + CARRIES + TARGETS) = 0 THEN 0
            ELSE SUM(PASSING_TDS + RUSHING_TDS + RECEIVING_TDS) * 1.0 / SUM(ATTEMPTS + CARRIES + TARGETS) 
        END AS TOUCHDOWN_RATE
    FROM
        {{ ref('fact_player_stats') }}
    GROUP BY
        1
)
SELECT
    *
FROM
    touchdown_rate