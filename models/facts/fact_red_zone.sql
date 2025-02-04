WITH red_zone AS (
    SELECT
        FANTASY_PLAYER_ID as PLAYER_ID,
        FANTASY_PLAYER_NAME as PLAYER_NAME,
        GAME_ID,
        SUM(CASE WHEN YARDLINE_100 <= 20 AND PLAY_TYPE = 'pass' THEN 1 ELSE 0 END) AS RED_ZONE_TARGETS,
        SUM(CASE WHEN YARDLINE_100 <= 20 AND PLAY_TYPE = 'pass' AND TOUCHDOWN = 1 THEN 1 ELSE 0 END) AS RED_ZONE_TDS
    FROM
        {{ ref('stg_player_by_player_data') }}
    GROUP BY
        1, 2, 3
)
SELECT
    *
FROM
    red_zone