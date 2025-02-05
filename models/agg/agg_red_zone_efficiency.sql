WITH red_zone_efficiency AS (
    SELECT
        s.PLAYER_ID,
        p.PLAYER_NAME,
        p.TEAM,
        p.POSITION,
        SUM(RED_ZONE_TARGETS) as TOTAL_TARGETS,
        SUM(RED_ZONE_TDS) as TOTAL_TDS,
        CASE
            WHEN SUM(RED_ZONE_TARGETS) = 0 THEN 0
            ELSE SUM(RED_ZONE_TDS) * 1.0 / SUM(RED_ZONE_TARGETS)
        END AS RED_ZONE_EFFICIENCY
    FROM {{ ref('dim_players') }} p
    JOIN {{ ref('fact_red_zone') }} s ON p.PLAYER_ID = s.PLAYER_ID
    GROUP BY
        1, 2, 3, 4
)
SELECT
    *
FROM
    red_zone_efficiency