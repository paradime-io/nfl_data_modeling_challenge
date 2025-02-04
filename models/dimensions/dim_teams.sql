WITH seasonal_rosters AS (
    SELECT
        distinct TEAM
    FROM
        {{ ref('stg_seasonal_rosters') }}
),
teams as (
    SELECT
        s.TEAM,
        t.TEAM_NAME,
        t.TEAM_CONF,
        t.TEAM_DIVISION
    FROM
        seasonal_rosters s
    LEFT JOIN
        {{ ref('stg_teams_data') }} t
    ON
        s.TEAM = t.TEAM_ABBR
)
SELECT
    *
FROM
    teams