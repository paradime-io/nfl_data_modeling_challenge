WITH injury_data AS (
    SELECT
        SEASON,
        TEAM,
        WEEK,
        GSIS_ID AS PLAYER_ID,
        FULL_NAME AS PLAYER_NAME,
        REPORT_PRIMARY_INJURY,
        REPORT_STATUS,
        DATE_MODIFIED
    FROM
        {{ source('nfl_data_py', 'INJURY_DATA') }}
)
SELECT
    *
FROM
    injury_data