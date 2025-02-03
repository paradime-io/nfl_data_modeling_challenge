with game_stats as (
    select *
    from
        {{ source('nfl', 'player_stats_by_game') }}
),

final as (
    select
        game_stats.player_id,
        game_stats.player_name_x as player_name,
        game_stats.headshot_url_x as headshot_url,
        game_stats.position_x as player_position,
        game_stats.recent_team as team,
        game_stats.season_x as season,
        game_stats.week_x as season_week,
        game_stats.season_type,
        game_stats.opponent_team as opponent,
        mults.site as fantasy_site,
        mults.fum_lost * (
            game_stats.sack_fumbles_lost
            + game_stats.rushing_fumbles_lost
            + game_stats.receiving_fumbles_lost
        ) as fum_lost_pts,
        mults.pass_2pt * game_stats.receiving_2pt_conversions as pass_2pt_pts,
        mults.pass_int * game_stats.interceptions as pass_int_pts,
        mults.pass_td * game_stats.passing_tds as pass_td_pts,
        mults.pass_yd * game_stats.passing_yards as pass_yd_pts,
        mults.rec * game_stats.receptions as rec_pts,
        mults.rec_2pt * game_stats.receiving_2pt_conversions as rec_2pt_pts,
        mults.rec_td * game_stats.receiving_tds as rec_td_pts,
        mults.rec_yd * game_stats.receiving_yards as rec_yd_pts,
        mults.rush_2pt * game_stats.rushing_2pt_conversions as rush_2pt_pts,
        mults.rush_td * game_stats.rushing_tds as rush_td_pts,
        mults.rush_yd * game_stats.rushing_yards as rush_yd_pts,
        (
            fum_lost_pts
            + pass_2pt_pts
            + pass_int_pts
            + pass_td_pts
            + pass_yd_pts
            + rec_pts
            + rec_2pt_pts
            + rec_td_pts
            + rec_yd_pts
            + rush_2pt_pts
            + rush_td_pts
            + rush_yd_pts
        ) as total_pts
    from game_stats
    inner join {{ ref('stg_site_multipliers_2023') }} as mults
)

select *
from final
