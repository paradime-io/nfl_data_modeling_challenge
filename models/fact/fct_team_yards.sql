-- fct_team_yards.sql
WITH game_details AS (
    SELECT
        *
    FROM
        {{ ref('int_game_details')}}
    ),

aggregated_stats AS (
    SELECT
        possession_team,
        possession_team_name,
        season_type,
        game_id,
        CASE 
            WHEN possession_team = home_team 
                THEN 'H'
            ELSE
                'A'
        END AS home_or_away,
        play_type,
        SUM(yards_gained)       AS total_yards_gained,
        SUM(passing_yards)      AS total_passing_yards,
        SUM(rushing_yards)      AS total_rushing_yards,
        SUM(penalty_yards)      AS total_penalty_yards,
        COUNT(CASE 
            WHEN play_type = 'run' AND rush_attempt = 1 THEN 1 
        END) AS total_rush_attempts,
        COUNT(CASE 
            WHEN play_type = 'pass' AND (incomplete_pass = 1 OR complete_pass = 1) THEN 1 
        END) AS total_targets,
        COUNT(CASE 
            WHEN play_type = 'pass' AND complete_pass = 1 THEN 1 
        END) AS total_pass_completions
    FROM 
        {{ ref('int_play_by_play_yards') }}
    GROUP BY 
        1, 2, 3, 4, 5, 6
    ),

stats_with_game_details AS (
    SELECT
        aggs.*,
        gd.game_date            AS game_date,
        gd.game_details         AS game_details,
        gd.home_score           AS home_score,
        gd.away_score           AS away_score
    FROM 
        aggregated_stats aggs
    LEFT JOIN
        {{ ref('int_game_details') }} gd
    ON
        aggs.game_id = gd.game_id
    )

SELECT
    *
FROM
    stats_with_game_details
