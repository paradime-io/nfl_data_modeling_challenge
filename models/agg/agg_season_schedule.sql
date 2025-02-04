WITH regular_season_weeks AS (
    SELECT MAX(WEEK) AS regular_season_weeks
    FROM {{ ref('dim_games') }}
    WHERE GAME_TYPE = 'REG'
),
games_per_week AS (
    SELECT ROUND(AVG(games_per_week)) AS avg_games_per_week
    FROM (
        SELECT WEEK, COUNT(*) AS games_per_week
        FROM {{ ref('dim_games') }}
        GROUP BY WEEK
    )
),
total_games AS (
    SELECT COUNT(*) AS total_games
    FROM {{ ref('dim_games') }}
)
SELECT
    regular_season_weeks,
    avg_games_per_week,
    total_games
FROM regular_season_weeks, games_per_week, total_games