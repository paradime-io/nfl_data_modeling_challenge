select
    player_id,
    player_name,
    player_position,
    fantasy_site,
    sum(TOTAL_PTS) as total_season_points,
    RANK() OVER (
        PARTITION BY player_position,
        fantasy_site
        ORDER BY
            total_season_points DESC
    ) AS site_rank
from
    {{ ref('stg_fantasy_ppg_by_site') }}
where player_position in ('QB', 'WR', 'RB', 'TE')
GROUP BY
    player_id,
    player_name,
    player_position,
    fantasy_site
ORDER BY
    player_position,
    fantasy_site,
    site_rank