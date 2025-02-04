WITH RankedPlayers AS (
    SELECT
        p.PLAYER_ID,
        p.PLAYER_NAME,
        p.TEAM,
        p.POSITION,
        s.WEEK,
        s.FANTASY_POINTS
    FROM {{ ref('dim_players') }} p
    JOIN {{ ref('fact_player_stats') }} s ON p.PLAYER_ID = s.PLAYER_ID
)
SELECT *
FROM RankedPlayers