WITH consistency AS (
    SELECT
        s.PLAYER_ID,
        p.PLAYER_NAME,
        p.TEAM,
        p.POSITION,
        STDDEV(FANTASY_POINTS) AS CONSISTENCY_SCORE
    FROM {{ ref('dim_players') }} p
    JOIN {{ ref('fact_player_stats') }} s ON p.PLAYER_ID = s.PLAYER_ID
    GROUP BY
        1, 2, 3, 4
), 
total_cte as(

    select 
        c.*,
        FANTASY_POINTS
    FROM consistency c
    JOIN {{ ref('fact_player_stats') }} s ON c.PLAYER_ID = s.PLAYER_ID
)
SELECT
    *
FROM
    total_cte