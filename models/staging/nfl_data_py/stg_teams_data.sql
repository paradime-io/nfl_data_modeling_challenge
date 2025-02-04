WITH teams AS (
    SELECT
        TEAM_ABBR,
        TEAM_NAME,
        TEAM_ID,
        TEAM_NICK,
        TEAM_CONF,
        TEAM_DIVISION
    FROM
        {{ source('nfl_data_py', 'TEAMS_DATA') }}
)
SELECT
    *
FROM
    teams