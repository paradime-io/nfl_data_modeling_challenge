WITH seasonal_rosters AS (
    SELECT
        SEASON,
        TEAM,
        POSITION,
        PLAYER_NAME,
        PLAYER_ID,
        YEARS_EXP,
        AGE
    FROM
        {{ source('nfl_data_py', 'SEASONAL_ROSTERS') }}
)
SELECT
    *
FROM
    seasonal_rosters