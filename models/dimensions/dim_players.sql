WITH players AS (
    SELECT
        PLAYER_ID,
        PLAYER_NAME,
        TEAM,
        POSITION,
        YEARS_EXP,
        AGE
    FROM
        {{ ref('stg_seasonal_rosters') }}
)
SELECT
    *
FROM
    players