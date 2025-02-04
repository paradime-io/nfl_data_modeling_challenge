WITH player_stats AS (
    SELECT
        PLAYER_ID,
        RECENT_TEAM as TEAM,
        SEASON,
        WEEK,
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
        {{ ref('stg_player_stats') }}
)
SELECT
    *
FROM
    player_stats