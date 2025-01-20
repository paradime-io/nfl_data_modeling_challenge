-- int_red_zone_plays.sql

WITH red_zone_plays AS (
    SELECT
        --play_id is not a unique ID, need to pull in game_id as well
        CONCAT(game_id, ' ', play_id) as play_id,
        --play_id,
        fantasy_player_id,
        fantasy_player_name,
        possession_team,
        play_type,
        incomplete_pass,
        complete_pass,
        pass_attempt,
        rush,
        rush_attempt,
        touchdown,
        penalty,
        penalty_type
    FROM {{ ref('stg_play_by_play') }}
    WHERE 
        in_red_zone = TRUE
        AND play_type NOT IN ('no_play')
        AND (penalty_type NOT LIKE 'Offensive Holding' OR penalty_type IS NULL)
        AND season_type LIKE '%REG%'
)

SELECT * FROM red_zone_plays
