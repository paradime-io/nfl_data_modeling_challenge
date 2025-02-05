WITH injuries AS (
    SELECT
        PLAYER_ID,
        PLAYER_NAME,
        TEAM,
        REPORT_PRIMARY_INJURY,
        REPORT_STATUS
    FROM
        {{ ref('stg_injury_data') }}
    WHERE
        REPORT_STATUS is not NULL
)
SELECT
    *
FROM
    injuries