WITH injury_propensity AS (
    SELECT
        PLAYER_ID,
        AVG(GAMES_MISSED) AS INJURY_PROPENSITY
    FROM
        {{ ref('fact_injuries') }}
    GROUP BY
        1
)
SELECT
    *
FROM
    injury_propensity