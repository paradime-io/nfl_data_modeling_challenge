with injuries as (
    select
        gsis_id,
        cast(season as integer) as season,
        game_type,
        team,
        cast(week as integer) as week,
        position,
        full_name as player_name,
        first_name,
        last_name,
        report_primary_injury,
        report_secondary_injury,
        report_status,
        practice_primary_injury,
        practice_secondary_injury,
        practice_status,
        date_modified
    from {{source('external', 'NFL_INJURIES_2015_2024')}}
)
select 
    *
from injuries