WITH seasonal_data AS (
    SELECT
        PLAYER_ID,
        SEASON,
        COMPLETIONS,
        ATTEMPTS,
        PASSING_YARDS,
        PASSING_TDS,
        INTERCEPTIONS,
        SACKS,
        CARRIES,
        RUSHING_YARDS,
        RUSHING_TDS,
        RECEPTIONS,
        TARGETS,
        RECEIVING_YARDS,
        RECEIVING_TDS,
        FANTASY_POINTS
    FROM
        {{ source('nfl_data_py', 'SEASONAL_DATA') }}
)
SELECT
    *
FROM
    seasonal_data