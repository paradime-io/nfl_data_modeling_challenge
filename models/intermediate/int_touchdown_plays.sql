SELECT
    coalesce(play_by_play.rusher_player_id, play_by_play.receiver_player_id) as player_id,
    coalesce(play_by_play.rusher_player_name, play_by_play.receiver_player_name) as player_name,

    --Player information
    player_stats.team,
    player_stats.position,
    player_stats.rookie_year,
    player_stats.years_experience,
    player_stats.draft_number,
    player_stats.draft_team,
    player_stats.draft_team = player_stats.team as plays_for_draft_team,

    --Touchdown information
    play_by_play.play_id,
    case when play_by_play.play_type = 'run' then 'Rush TD'
         when play_by_play.play_type = 'pass' then 'Pass TD'
         else 'Other TD'
    end as td_type,
    play_by_play.quarter,
    play_by_play.down,
    play_by_play.distance_to_goal,
    play_by_play.home_team,
    play_by_play.away_team,
    play_by_play.possession_team_type,
    play_by_play.season_type as game_type
FROM 
    {{ ref('stg_play_by_play') }} as play_by_play
LEFT JOIN 
    {{ ref('stg_player_stats_by_game') }} as player_stats
    ON coalesce(play_by_play.rusher_player_id, play_by_play.receiver_player_id) = player_stats.player_id
WHERE touchdown = 1
