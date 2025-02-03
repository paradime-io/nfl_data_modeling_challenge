WITH nfl_salary AS (
    SELECT
        NAME as PLAYER_NAME,
        TEAM,
        SALARY
    FROM
        {{ source('web_scraping', 'NFL_SALARIES_2023') }}
)
SELECT
    *
FROM
    nfl_salary