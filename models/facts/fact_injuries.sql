WITH injuries AS (
    SELECT
        PLAYER_ID,
        PLAYER_NAME,
        COUNT(*) AS GAMES_MISSED
    FROM
        {{ ref('stg_injury_data') }}
    WHERE
        REPORT_STATUS = 'Out'
    GROUP BY
        1, 2
)
SELECT
    *
FROM
    injuries