WITH dominance_rate AS (
    SELECT
        p.PLAYER_ID,
        SUM(p.FANTASY_POINTS) * 1.0 / SUM(t.TEAM_FANTASY_POINTS) AS DOMINANCE_RATE
    FROM
        {{ ref('fact_player_stats') }} p
    JOIN
        (SELECT TEAM, SUM(FANTASY_POINTS) AS TEAM_FANTASY_POINTS FROM {{ ref('fact_player_stats') }} GROUP BY 1) t
    ON
        p.TEAM = t.TEAM
    GROUP BY
        1
)
SELECT
    *
FROM
    dominance_rate