-- models/intermediate/int_team_performance.sql
WITH team_plays AS (
    SELECT 
        game_id,
        home_team,
        away_team,
        possession_team,
        play_type,
        yards_gained,
        expected_points_added,
        win_probability_added,
        touchdown,
        in_red_zone,
        CASE 
            WHEN possession_team = home_team THEN 'HOME'
            ELSE 'AWAY'
        END as team_location
    FROM {{ ref('stg_play_by_play') }}
    WHERE 
        season_type = 'REG'
        AND play_type NOT IN ('no_play')
        AND (home_team IN ('KC', 'PHI') OR away_team IN ('KC', 'PHI'))
),

team_stats AS (
    SELECT 
        game_id,
        CASE 
            WHEN team_location = 'HOME' THEN home_team
            ELSE away_team 
        END as team,
        AVG(expected_points_added) as avg_epa_per_play,
        SUM(CASE WHEN in_red_zone THEN 1 ELSE 0 END) as red_zone_attempts,
        SUM(CASE WHEN in_red_zone AND touchdown = 1 THEN 1 ELSE 0 END) as red_zone_tds,
        AVG(win_probability_added) as avg_wpa_per_play,
        COUNT(*) as total_plays
    FROM team_plays
    GROUP BY 1, 2
)

SELECT 
    team,
    AVG(avg_epa_per_play) as season_avg_epa,
    AVG(CASE WHEN red_zone_attempts > 0 
        THEN red_zone_tds::float / red_zone_attempts 
        ELSE 0 
    END) as red_zone_efficiency,
    AVG(avg_wpa_per_play) as season_avg_wpa,
    SUM(total_plays) as total_plays_run
FROM team_stats
GROUP BY 1