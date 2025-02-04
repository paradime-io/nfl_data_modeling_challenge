WITH roi AS (
    SELECT
        p.PLAYER_ID,
        SUM(p.FANTASY_POINTS) / MAX(s.SALARY) AS ROI
    FROM
        {{ ref('fact_player_stats') }} p
    JOIN
        {{ ref('fact_salaries') }} s
    ON
        p.PLAYER_ID = s.PLAYER_ID
    GROUP BY
        1
)
SELECT
    *
FROM
    roi