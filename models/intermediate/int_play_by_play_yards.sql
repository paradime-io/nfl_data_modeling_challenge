-- int_play_by_play_yards.sql

WITH home_team_plays AS (
    SELECT
        pbp.*,
        nt.name AS home_team_name
    FROM {{ ref('stg_play_by_play_yards') }} pbp
    JOIN
        {{ ref('nfl_teams') }} nt 
    ON
        pbp.home_team = nt.abbreviation
    ),

away_team_plays AS (
    SELECT
        pbp.*,
        nt.name AS away_team_name
    FROM home_team_plays pbp
    JOIN
        {{ ref('nfl_teams') }} nt 
    ON
        pbp.away_team = nt.abbreviation        
    ),

pos_team_plays AS (
    SELECT
        pbp.*,
        nt.name AS possession_team_name
    FROM away_team_plays pbp
    JOIN
        {{ ref('nfl_teams') }} nt 
    ON
        pbp.possession_team = nt.abbreviation        
    ),

def_team_plays AS (
    SELECT
        pbp.*,
        nt.name AS defending_team_name
    FROM pos_team_plays pbp
    JOIN
        {{ ref('nfl_teams') }} nt 
    ON
        pbp.defending_team = nt.abbreviation        
    )

SELECT * FROM def_team_plays
