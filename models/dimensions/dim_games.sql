WITH games AS (
    SELECT
        GAME_ID,
        SEASON,
        GAME_TYPE,
        WEEK,
        AWAY_TEAM,
        HOME_TEAM,
        GAME_DATE
    FROM
        {{ ref('stg_schedules') }}
)
SELECT
    *
FROM
    games