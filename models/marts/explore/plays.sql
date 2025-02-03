select 
    -- General
    UUID_STRING() as unique_play_id,
    play_id as game_play_id,
    play_description,
    game_id,
    play_type,
    yards_gained,
    penalty,
    penalty_type,
    score_differential,

    -- Teams
    possession_team,
    possession_team_score,
    possession_team_timeouts,
    possession_team_type,
    
    defending_team,
    defending_team_score,
    defending_team_timeouts,
    case when possession_team_type = 'home' then 'away' else 'home' end as defending_team_type,

    -- Drive
    drive,
    down,
    side_of_field,
    yard_line,
    yards_to_go,
    drive_net_yards,
    distance_to_goal,
    goal_to_go,
    in_red_zone,

    -- Clock
    game_clock,
    quarter,
    quarter_seconds_remaining,
    quarter_end,
    game_half,
    half_seconds_remaining,
    game_seconds_remaining,
    
    
    -- Other
    shotgun,
    no_huddle,
    qb_dropback,
    qb_kneel,
    qb_spike,
    qb_scramble,

    -- Passing
    passer_player_id,
    pass_length,
    pass_attempt,
    incomplete_pass,
    complete_pass,
    pass_location,
    pass_touchdown,
    air_yards,
    yards_after_catch,
    
    -- Recieving
    receiver_player_id,
    pass_touchdown as receiving_touchdown,
    
    -- Rushing
    rusher_player_id,
    rush,
    rush_attempt,
    run_location,
    run_gap,
    rushing_yards,
    rush_touchdown,
    
        
    -- Score
    touchdown,
    two_point_conversion_result,

    -- Kicking
    kick_distance,
    field_goal_result,
    extra_point_result,
        
    -- Probabilities / Metrics
    win_probability as offensive_win_probability,
    win_probability_added as offensive_win_probability_added,
    defensive_win_probability,
    win_probability_added * -1 as defensive_win_probability_added,
    expected_points,
    expected_points_added,
    air_expected_points_added,
    yards_after_catch_expected_points_added,

    -- First Down
    case when yards_gained > yards_to_go then 1 else 0 end as first_down,
    case
        when rusher_player_id is not null then rusher_player_id
        else receiver_player_id
    end as first_down_player_id
    
        
from {{ ref('stg_play_by_play') }}