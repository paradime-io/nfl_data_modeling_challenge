-- int_penalties.sql
WITH game_details AS (
    SELECT
        *
    FROM
        {{ ref('int_game_details')}}
),

nfl_teams AS (
    SELECT
        *
    FROM
        {{ ref('nfl_teams') }}
),

player_stats_by_game AS (
    SELECT DISTINCT
        player_id,
        player_display_name        
    FROM
        {{ ref('player_stats_by_game')}}
),

pass_and_run AS (
    SELECT
        game_id,
        game_date,
        home_team,
        away_team,
        offense_team,
        defending_team,
        penalty_type,
        penalty_team,
        penalty_player_id,
        penalty_player_name,
        penalty_yards,
        in_red_zone
    FROM
        {{ ref('stg_play_by_play_yards')}}
    WHERE
        penalty = 1
),

player_display_name AS (
    SELECT
        par.*,
        psg.player_display_name             AS player_display_name
    FROM
        pass_and_run par
    LEFT JOIN
        player_stats_by_game psg
    ON
        par.penalty_player_id = psg.player_id
),

pos_team_plays AS (
    SELECT
        pdn.*,
        nt.name AS offense_team_name
    FROM 
        player_display_name pdn
    JOIN
        nfl_teams nt 
    ON
        pdn.offense_team = nt.abbreviation        
),

def_team_plays AS (
    SELECT
        pbp.*,
        nt.name AS defending_team_name
    FROM 
        pos_team_plays pbp
    JOIN
        nfl_teams nt 
    ON
        pbp.defending_team = nt.abbreviation        
),

pen_team_plays AS (
    SELECT
        dfp.*,
        nt.name AS penalty_team_name
    FROM
        def_team_plays dfp
    JOIN
        nfl_teams nt 
    ON
        dfp.penalty_team = nt.abbreviation      
),

offense_or_defense AS (
    SELECT
        ptp.*,
        CASE
            WHEN
                penalty_team = offense_team
            THEN 1
            ELSE 0
        END AS offense_penalty,
        CASE
            WHEN
                penalty_team = defending_team
            THEN 1
            ELSE 0
        END AS defense_penalty
    FROM
        pen_team_plays ptp
),

-- De-normalise scores for the penalty teams onto the table

pens_with_game_details AS (
    SELECT
        ood.*,
        gd.game_details                     AS game_details,
        CAST(gd.home_score AS INT)          AS home_score,
        CAST(gd.away_score AS INT)          AS away_score,
        CAST(
            CASE
                WHEN
                    penalty_team = home_team
                THEN
                    home_score
                ELSE
                    away_score
            END AS INT)                     AS penalty_team_score,
        CAST(
            CASE
                WHEN
                    penalty_team = away_team
                THEN
                    home_score
                ELSE
                    away_score
            END AS INT)                     AS opponent_score
    FROM 
        offense_or_defense ood
    LEFT JOIN
        game_details gd
    ON
        ood.game_id = gd.game_id
),

penalty_win_or_loss AS (
    SELECT
        pgd.*,
        CASE
            WHEN
                penalty_team_score > opponent_score
            THEN 1
            ELSE 0
        END AS penalty_team_win,
        CASE
            WHEN
                penalty_team_score < opponent_score
            THEN 1
            ELSE 0
        END AS penalty_team_loss,
    FROM
        pens_with_game_details pgd
)

SELECT 
    * 
FROM 
    penalty_win_or_loss

