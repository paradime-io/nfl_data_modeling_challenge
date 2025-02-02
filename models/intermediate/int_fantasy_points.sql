with player_stats as (
    select * from {{ ref('stg_player_stats_by_game') }}
),

game_moons as (
    select * from {{ ref('int_nfl_games_enhanced') }}
),

enriched_stats as (
    select
        ps.player_id,
        ps.player_name,
        ps.position,
        ps.recent_team,
        ps.season,
        ps.season_week,
        ps.targets,
        ps.fantasy_points,
        ps.fantasy_points_ppr,
        -- Add moon phase context
        gm.current_moon_phase,
        gm.moon_phase_timestamp
    from player_stats ps
    left join game_moons gm
        on ps.season_week = gm.round_number
        and ps.recent_team in (gm.home_team, gm.away_team)
    where ps.season_type = 'REG'
),

final as (
    select
        player_id,
        player_name,
        position,
        recent_team,
        season,
        season_week,
        current_moon_phase,
        moon_phase_timestamp,
        sum(targets) as total_targets,
        sum(fantasy_points) as total_fantasy_points,
        sum(fantasy_points_ppr) as total_fantasy_points_ppr,
        count(distinct season_week) as games_played,
        round(sum(fantasy_points) / count(distinct season_week), 2) as avg_fantasy_points_per_game,
        round(sum(fantasy_points_ppr) / count(distinct season_week), 2) as avg_fantasy_points_ppr_per_game
    from enriched_stats
    group by 
        player_id, 
        player_name, 
        position, 
        recent_team, 
        season, 
        season_week,
        current_moon_phase,
        moon_phase_timestamp
)

select * from final
