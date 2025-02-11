WITH player_stats as
    (
        SELECT
            player_id,
            team,
            position,
            rookie_year,
            years_experience,
            draft_number,
            draft_team,
            draft_team = team as plays_for_draft_team
        FROM {{ ref('stg_player_stats_by_game') }}
        GROUP BY
            player_id,
            team,
            position,
            rookie_year,
            years_experience,
            draft_number,
            draft_team
    )


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
    player_stats.plays_for_draft_team,

    --Touchdown information
    --play_id is not a unique ID, need to pull in game_id as well
    CONCAT(game_id, ' ', play_id) as play_id,
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
LEFT JOIN player_stats
    ON coalesce(play_by_play.rusher_player_id, play_by_play.receiver_player_id) = player_stats.player_id
WHERE touchdown = 1
AND play_type NOT IN ('no_play')
AND (penalty_type NOT LIKE 'Offensive Holding' OR penalty_type IS NULL)