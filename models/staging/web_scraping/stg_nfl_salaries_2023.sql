WITH nfl_salaries AS (
    SELECT
        NAME AS PLAYER_NAME,
        TEAM,
        SALARY
    FROM
        {{ source('web_scraping', 'NFL_SALARIES_2023') }}
)
SELECT
    *
FROM
    nfl_salaries