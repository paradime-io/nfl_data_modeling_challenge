with source as (
    select * from {{ ref('nfl_23_24_fixtures_results') }}
),

staged as (
    select
        round_number,
        date::date as game_date,
        time::time as game_time,
        timestamp_from_parts(date::date, time::time) as game_timestamp,
        location,
        home_team,
        away_team,
        home_team_score::integer as home_team_score,
        away_team_score::integer as away_team_score,
        case 
            when home_team_score > away_team_score then home_team
            when away_team_score > home_team_score then away_team
            else null -- for ties
        end as winning_team,
        case 
            when home_team_score > away_team_score then away_team
            when away_team_score > home_team_score then home_team
            else null -- for ties
        end as losing_team,
        (home_team_score + away_team_score) as total_points
    from source
)

select * from staged 