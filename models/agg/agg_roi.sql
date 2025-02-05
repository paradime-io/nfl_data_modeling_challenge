WITH roi AS (
    SELECT
        p.PLAYER_ID,
        d.PLAYER_NAME,
        d.POSITION,
        d.TEAM,
        p.FANTASY_POINTS,
        s.SALARY
    FROM
        {{ ref('fact_player_stats') }} p
    JOIN
        {{ ref('fact_salaries') }} s
    ON
        p.PLAYER_ID = s.PLAYER_ID
    JOIN {{ ref('dim_players') }} d
    ON 
        p.PLAYER_ID = d.PLAYER_ID
)
SELECT
    *
FROM
    roi
