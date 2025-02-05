WITH CoverageImpact AS (
    SELECT 
        p.SEASON_X as Season, 
        p.WEEK_X AS Week, 
        p.PLAYER_DISPLAY_NAME AS Player_name, 
        p.POSITION_X AS Position, 
        p.TEAM, 
        pb.DEFENSE_COVERAGE_TYPE, 
        AVG(p.FANTASY_POINTS) AS AVG_FANTASY_POINTS
    FROM {{ ref('stg_player_stats_by_game') }} p
    JOIN {{ ref('stg_play_by_play') }} pb 
        ON p.PLAYER_ID = pb.PASSER_ID OR p.PLAYER_ID = pb.RECEIVER_ID
    WHERE p.POSITION_X IN ('QB', 'WR')
    GROUP BY p.SEASON_X, p.WEEK_X, p.PLAYER_DISPLAY_NAME, p.POSITION_X, p.TEAM, pb.DEFENSE_COVERAGE_TYPE
)

SELECT 
    DEFENSE_COVERAGE_TYPE, 
    POSITION_X, 
    AVG(AVG_FANTASY_POINTS) AS OVERALL_AVG_FANTASY
FROM CoverageImpact
GROUP BY DEFENSE_COVERAGE_TYPE, POSITION_X
ORDER BY OVERALL_AVG_FANTASY DESC;
