with game_data as (
    select * from {{ ref('int_nfl_games_enhanced') }}
),

final as (
    select
        -- Dimensions
        game_timestamp,
        current_moon_phase,
        moon_phase_timestamp,
        
        -- Game details
        round_number as week_number,
        location,
        home_team,
        home_team_name,
        away_team,
        away_team_name,
        
        -- Game outcomes
        home_team_score,
        away_team_score,
        total_points,
        winning_team,
        losing_team,
        
        -- Calculated fields
        case 
            when home_team_score > away_team_score then true
            else false 
        end as is_home_team_win,
        case 
            when home_team_score < away_team_score then true
            else false 
        end as is_away_team_win,
        
        abs(home_team_score - away_team_score) as score_differential,
        
        case 
            when abs(home_team_score - away_team_score) <= 7 then true
            else false
        end as is_close_game,
        
        case 
            when total_points > 45 then 'High Scoring'
            when total_points between 30 and 45 then 'Medium Scoring'
            else 'Low Scoring'
        end as scoring_category
        
    from game_data
)

select * from final 