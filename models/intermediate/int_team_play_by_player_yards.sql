-- int_team_play_by_player.sql
WITH game_details AS (
    SELECT
        *
    FROM
        {{ ref('int_game_details')}}
),

play_by_play AS (
    SELECT
        *
    FROM
        {{ ref('int_play_by_play_yards') }}
),

aggregated_stats AS (
    SELECT
        offense_team,
        offense_team_name,
        season_type,
        game_id,
        CASE 
            WHEN offense_team = home_team 
                THEN 'H'
            ELSE
                'A'
        END AS home_or_away,
        passer_player_name,
        rusher_player_name,
        SUM(yards_gained)       AS total_yards_gained,
        SUM(passing_yards)      AS total_passing_yards,
        SUM(rushing_yards)      AS total_rushing_yards,
        SUM(penalty_yards)      AS total_penalty_yards,
        COUNT(CASE 
            WHEN 
                play_type = 'run' AND rush_attempt = 1 
            THEN 1 
        END) AS total_rush_attempts,
        COUNT(CASE 
            WHEN 
                play_type = 'pass' AND (incomplete_pass = 1 OR complete_pass = 1) 
            THEN 1 
        END) AS total_targets,
        COUNT(CASE 
            WHEN 
                play_type = 'pass' AND complete_pass = 1 
            THEN 1 
        END) AS total_pass_completions
    FROM 
        {{ ref('int_play_by_play_yards') }}
    GROUP BY 
        1, 2, 3, 4, 5, 6, 7
),

adjusted_stats AS (
    SELECT
        *,
        CASE
            WHEN 
                total_yards_gained > 0 AND
                total_yards_gained != total_passing_yards
            THEN
                total_yards_gained
            ELSE
                total_passing_yards
        END as total_adj_passing_yards,
        CASE
            WHEN
                total_yards_gained > 0 AND
                total_yards_gained != total_rushing_yards
            THEN
                total_yards_gained
            ELSE
                total_rushing_yards
        END AS total_adj_rushing_yards
    FROM
        aggregated_stats            
)

SELECT
    *
FROM
    adjusted_stats

