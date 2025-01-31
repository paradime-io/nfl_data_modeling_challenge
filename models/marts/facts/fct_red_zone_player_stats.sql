-- fct_red_zone_player_stats.sql

with aggregated_stats as (
    select
        fantasy_player_id,
        fantasy_player_name,
        count(case
            when play_type = 'run' and rush_attempt = 1 then 1
        end) as total_rush_attempts,
        count(case
            when
                play_type = 'pass'
                and (incomplete_pass = 1 or complete_pass = 1)
                then 1
        end) as total_targets,
        count(case
            when play_type = 'pass' and complete_pass = 1 then 1
        end) as total_pass_completions,
        count(case
            when touchdown = 1 then 1
        end) as total_touchdowns
    from {{ ref('int_red_zone_plays') }}
    group by 1, 2
)

select
    fantasy_player_id,
    fantasy_player_name,
    total_rush_attempts,
    total_targets,
    total_pass_completions,
    total_touchdowns,
    (total_rush_attempts + total_targets) as total_opportunities,
    -- Adding calculated fields for Lightdash metrics
    round(
        cast(total_pass_completions as float) / nullif(total_targets, 0) * 100,
        2
    ) as completion_percentage,
    round(
        cast(total_touchdowns as float)
        / nullif((total_rush_attempts + total_targets), 0)
        * 100,
        2
    ) as touchdown_rate
from aggregated_stats
order by total_opportunities desc
