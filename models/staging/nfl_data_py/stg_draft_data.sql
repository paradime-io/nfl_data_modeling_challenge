WITH draft_data AS (
    SELECT
        SEASON,
        ROUND,
        PICK,
        TEAM,
        GSIS_ID AS PLAYER_ID,
        PFR_PLAYER_NAME AS PLAYER_NAME,
        POSITION,
        COLLEGE,
        AGE,
        ALLPRO,
        PROBOWLS,
        SEASONS_STARTED,
        GAMES,
        PASS_YARDS,
        RUSH_YARDS,
        REC_YARDS,
        DEF_SACKS
    FROM
        {{ source('nfl_data_py', 'DRAFT_DATA') }}
)
SELECT
    *
FROM
    draft_data