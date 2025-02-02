with nfl_games as (
    select * from {{ ref('stg_nfl_fixtures') }}
),

teams_home as (
    select * from {{ ref('stg_nfl_teams') }}
),

teams_away as (
    select * from {{ ref('stg_nfl_teams') }}
),

moon_phases as (
    select * from {{ ref('stg_moon_phases') }}
),

-- Get the most recent moon phase before each game
game_moon_phases as (
    select 
        nfl_games.*,
        moon_phases.moon_phase,
        moon_phases.phase_timestamp,
        row_number() over (
            partition by nfl_games.game_timestamp 
            order by moon_phases.phase_timestamp desc
        ) as rn
    from nfl_games
    left join moon_phases
        on moon_phases.phase_timestamp <= nfl_games.game_timestamp
),

final as (
    select
        games.round_number,
        games.game_date,
        games.game_time,
        games.game_timestamp,
        games.location,
        -- Home team details
        games.home_team,
        home.team_name as home_team_name,
        games.home_team_score,
        -- Away team details
        games.away_team,
        away.team_name as away_team_name,
        games.away_team_score,
        -- Game results
        games.winning_team,
        games.losing_team,
        games.total_points,
        -- Moon phase at game time
        gmp.moon_phase as current_moon_phase,
        gmp.phase_timestamp as moon_phase_timestamp
    from nfl_games games
    left join teams_home home 
        on games.home_team = home.team_abbreviation
    left join teams_away away 
        on games.away_team = away.team_abbreviation
    left join game_moon_phases gmp
        on games.game_timestamp = gmp.game_timestamp
        and gmp.rn = 1  -- Get only the most recent moon phase
)

select * from final 