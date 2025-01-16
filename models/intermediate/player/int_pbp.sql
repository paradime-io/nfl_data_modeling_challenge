{%- set years = [2020, 2021, 2022, 2023] -%}

{% for year in years %}
    select *, 
        {{ year }} as year
    from {{ ref('stg_pbp_' ~ year) }}
    union all
{% endfor %}

select
    NULL AS nflverse_game_id,
    NULL AS old_game_id_y,
    NULL AS possession_team,
    NULL AS offense_formation,
    NULL AS offense_personnel,
    NULL AS defenders_in_box,
    NULL AS defense_personnel,
    NULL AS number_of_pass_rushers,
    NULL AS players_on_play,
    NULL AS offense_players,
    NULL AS defense_players,
    NULL AS n_offense,
    NULL AS n_defense,
    NULL AS ngs_air_yards,
    NULL AS time_to_throw,
    NULL AS was_pressure,
    NULL AS route,
    NULL AS defense_man_zone_type,
    NULL AS defense_coverage_type,
    *, 
    2024 as year
from {{ ref('stg_pbp_2024') }}
