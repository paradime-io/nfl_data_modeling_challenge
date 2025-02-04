WITH consistency AS (
    SELECT
        PLAYER_ID,
        STDDEV(FANTASY_POINTS) AS CONSISTENCY_SCORE
    FROM
        {{ ref('fact_player_stats') }}
    GROUP BY
        1
)
SELECT
    *
FROM
    consistency