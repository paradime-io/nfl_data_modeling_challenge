SELECT
    team,
    CASE WHEN position IN ('QB', 'WR', 'TE', 'RB') THEN position
        ELSE 'Other position'
    END as scorer_position,
    game_type,
    SUM(CASE WHEN td_type = 'Rush TD' THEN 1 ELSE 0 END) AS num_rush_touchdowns,
    SUM(CASE WHEN td_type = 'Pass TD' THEN 1 ELSE 0 END) AS num_pass_touchdowns,
    SUM(CASE WHEN td_type = 'Other TD' THEN 1 ELSE 0 END) AS num_other_touchdowns,
    COUNT(DISTINCT play_id) AS num_total_touchdowns
FROM 
    {{ ref('int_touchdown_plays') }} as touchdown_plays
GROUP BY 
    team,
    scorer_position,
    game_type
