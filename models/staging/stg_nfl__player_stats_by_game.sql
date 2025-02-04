with
    src_player_stats as (
        select
            player_id
            , player_display_name as player_nm
            , position_x as player_position_desc
            , season_x as season_nr
            , week_x as week_nr
            , team as team_abbr_desc
            , passing_yards as passing_yards_nr
            , passing_tds as passing_tds_nr
            , rushing_yards as rushing_yards_nr
            , rushing_tds as rushing_tds_nr
            , receptions as receptions_nr
            , receiving_yards as receiving_yards_nr
            , receiving_tds as receiving_tds_nr
            , fantasy_points as fantasy_points_nr
            , fantasy_points_ppr as fantasy_points_ppr_nr
        from {{ source('nfl', 'nfl_player_stats_by_game') }} 
    )

select *
from src_player_stats
