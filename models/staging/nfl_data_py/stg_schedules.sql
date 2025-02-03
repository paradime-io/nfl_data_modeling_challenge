WITH schedules AS (
    SELECT
        GAME_ID,
        SEASON,
        WEEK,
        AWAY_TEAM,
        HOME_TEAM,
        GAMEDAY AS GAME_DATE,
        AWAY_SCORE,
        HOME_SCORE
    FROM
        {{ source('nfl_data_py', 'SCHEDULES') }}
)
SELECT
    *
FROM
    schedules