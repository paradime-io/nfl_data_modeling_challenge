-- fct_team_yards.sql
WITH game_details AS (
    SELECT
        *
    FROM
        {{ ref('int_game_details')}}
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
        1, 2, 3, 4, 5
),

/*
The number for total_passing_yards + total_rushing_yards do not always =
total_yards_gained, so adjust here
*/

adjusted_stats AS (
    SELECT
        *,
        CASE
            WHEN 
                total_passing_yards + total_rushing_yards != total_yards_gained
            THEN
                round(total_passing_yards * (total_yards_gained / (total_passing_yards + total_rushing_yards)), 0)
            ELSE
                total_passing_yards
        END as total_adj_passing_yards,
        CASE
            WHEN
                total_passing_yards + total_rushing_yards != total_yards_gained
            THEN
                round(total_rushing_yards * (total_yards_gained / (total_passing_yards + total_rushing_yards)), 0)
            ELSE
                total_rushing_yards
        END AS total_adj_rushing_yards
    FROM
        aggregated_stats            
),

stats_with_game_details AS (
    SELECT
        aggs.*,
        gd.game_date                        AS game_date,
        gd.game_details                     AS game_details,
        CAST(gd.home_score AS INT)          AS home_score,
        CAST(gd.away_score AS INT)          AS away_score,
        CAST(
            CASE
                WHEN
                    home_or_away = 'H'
                THEN
                    home_score
                ELSE
                    away_score
            END AS INT)                     AS offense_score,
        CAST(
            CASE
                WHEN
                    home_or_away = 'A'
                THEN
                    home_score
                ELSE
                    away_score
            END AS INT)                     AS opponent_score
    FROM 
        adjusted_stats aggs
    LEFT JOIN
        game_details gd
    ON
        aggs.game_id = gd.game_id
),

home_win_or_loss AS (
        SELECT
            *,
            CASE
                WHEN
                    home_score > away_score
                THEN
                    1
                ELSE
                    0
            END AS home_win,
            CASE
                WHEN
                    home_score < away_score
                THEN
                    1
                ELSE
                    0
            END AS home_loss,
            CASE
                WHEN
                    home_score = away_score
                THEN
                    1
                ELSE
                    0
            END AS tie,
            0 AS away_win,
            0 AS away_loss,
            home_win + home_loss + tie + away_win + away_loss AS games_played
        FROM
            stats_with_game_details
        WHERE
            home_or_away = 'H'
),

away_win_or_loss AS (
        SELECT
            *,
            0 as home_win,
            0 as home_loss,
            CASE
                WHEN
                    home_score = away_score
                THEN
                    1
                ELSE
                    0
            END AS tie,            
            CASE
                WHEN
                    home_score < away_score
                THEN
                    1
                ELSE
                    0
            END AS away_win,
            CASE
                WHEN
                    home_score > away_score
                THEN
                    1
                ELSE
                    0
            END AS away_loss,
            home_win + home_loss + tie + away_win + away_loss   AS games_played
        FROM
            stats_with_game_details
        WHERE
            home_or_away = 'A'
),

home_and_away AS (
    SELECT
        *   
    FROM
        home_win_or_loss
    UNION
    SELECT
        *
    FROM
        away_win_or_loss
)

SELECT
    *,
    CAST(offense_score - opponent_score AS INT)                 AS score_differential 
FROM
    home_and_away
