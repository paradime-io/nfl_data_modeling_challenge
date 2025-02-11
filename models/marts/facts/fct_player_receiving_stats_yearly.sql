SELECT 
    year,
    player_id,
    player_name,
    team,
    age,
    position,
    CASE WHEN position in ('WR', 'TE', 'RB') then TRUE else FALSE END AS is_rb_wr_or_te,
    entry_year,
    rookie_year,
    CASE WHEN rookie_year = year then TRUE else FALSE END AS is_rookie_year,
    draft_number,

    --Receiving stats
    games_played,
    targets,
    receptions,
    receiving_yds,
    touchdowns,
    first_downs,
    yds_after_catch,
    air_yds,
    target_share,
    air_yds_share,
    wopr_x,
    fantasy_points,
    fantasy_points_ppr,

    --Snap count stats (for 2023 only)
    offensive_snaps,
    avg_targets_per_snap,
    avg_receptions_per_snap,

    --Receiving calculations
    receptions / targets as pct_targets_caught,
    touchdowns / targets as pct_targets_that_were_tds,
    targets / games_played AS avg_targets_per_game,
    receptions / games_played AS avg_receptions_per_game,
    
    fantasy_points / games_played AS avg_fantasy_pts_per_game,
    fantasy_points_ppr / games_played AS avg_ppr_fantasy_pts_per_game

FROM {{ ref('int_player_receiving_stats') }}

