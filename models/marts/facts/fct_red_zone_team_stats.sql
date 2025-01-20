SELECT
    red_zone.possession_team as team,
    
    -- Counts and sums
    COUNT(DISTINCT red_zone.play_id) AS num_red_zone_plays,
    SUM(red_zone.incomplete_pass) AS num_incomplete_passes,
    SUM(red_zone.complete_pass) AS num_complete_passes,
    SUM(red_zone.pass_attempt) AS num_pass_attempts,
    SUM(red_zone.rush_attempt) AS num_rush_attempts,
    SUM(red_zone.touchdown) as num_total_touchdowns,
    SUM(CASE WHEN play_type = 'run' and touchdown = 1 THEN 1 ELSE 0 END) as num_rush_touchdowns,
    SUM(CASE WHEN play_type = 'pass' and touchdown = 1 THEN 1 ELSE 0 END) as num_pass_touchdowns,

    --Rank number of red zone touchdowns
    RANK() OVER (ORDER BY num_total_touchdowns DESC) AS red_zone_td_rank,

    --Percentages
    num_pass_attempts / num_red_zone_plays AS pct_pass_plays,
    num_rush_attempts / num_red_zone_plays AS pct_rush_plays,
    num_pass_touchdowns / num_pass_attempts as pct_pass_attempt_td_conversion,
    num_rush_touchdowns / num_rush_attempts as pct_rush_attempt_td_conversion,
    num_total_touchdowns / num_red_zone_plays AS pct_total_td_conversions,
    num_rush_touchdowns / num_total_touchdowns AS pct_tds_that_were_rushes,
    num_pass_touchdowns / num_total_touchdowns AS pct_tds_that_were_passes
    
FROM {{ ref('int_red_zone_plays') }} as red_zone
--  LEFT JOIN td_play_type as tds ON red_zone.possession_team = tds.possession_team
WHERE play_type in ('run', 'pass') --Remove extra point plays
GROUP BY possession_team
