select distinct
    player_id,
    player_name,
    headshot_url,
    jersey_number,
    height,
    player_weight as weight,
    age,
    birth_date,
    college,
    years_experience,
    entry_year,
    rookie_year,
    draft_team,
    draft_number,
    position,
    position_group,
    team,
    espn_id,
    yahoo_id,
    sleeper_id,
    rotowire_id,
    pff_id,
    pfr_id,
    sportradar_id,
    esb_id,
    gsis_it_id,
    smart_id
from {{ ref('stg_player_stats_by_game') }}
-- Note this is the latest game data
qualify row_number() over (
        partition by player_id
        order by
            season_week desc
    ) = 1
