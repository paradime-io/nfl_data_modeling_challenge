WITH red_zone_efficiency AS (
    SELECT
        PLAYER_ID,
        CASE
            WHEN SUM(RED_ZONE_TARGETS) = 0 THEN 0
            ELSE SUM(RED_ZONE_TDS) * 1.0 / SUM(RED_ZONE_TARGETS)
        END AS RED_ZONE_EFFICIENCY
    FROM
        {{ ref('fact_red_zone') }}
    GROUP BY
        1
)
SELECT
    *
FROM
    red_zone_efficiency