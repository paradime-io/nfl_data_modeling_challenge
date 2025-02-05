WITH clutch_plays AS (
    SELECT
        fantasy_player_id,
        fantasy_player_name,
        COUNT(CASE WHEN game_seconds_remaining <= 300 AND score_differential BETWEEN -3 AND 3 THEN 1 END) AS clutch_play_count,
        SUM(expected_points_added) AS clutch_epa,
        COUNT(CASE WHEN touchdown = 1 AND game_seconds_remaining <= 300 AND score_differential BETWEEN -3 AND 3 THEN 1 END) AS clutch_touchdowns
    FROM {{ ref('stg_play_by_play') }}
    WHERE game_seconds_remaining <= 300  -- Last 5 minutes of the game
    GROUP BY fantasy_player_id, fantasy_player_name
)

SELECT 
    fantasy_player_id,
    fantasy_player_name,
    clutch_play_count,
    clutch_epa,
    clutch_touchdowns
FROM clutch_plays
