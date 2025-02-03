select
    player_id,
    player_name,
    player_position,
    min(
        case
            when fantasy_site = 'ESPN' then site_rank
        end
    ) as espn_site_rank,
    sum(
        case
            when fantasy_site = 'ESPN' then total_season_points
        end
    ) as espn_total_season_points,
    min(
        case
            when fantasy_site = 'YAHOO' then site_rank
        end
    ) as yahoo_site_rank,
    sum(
        case
            when fantasy_site = 'YAHOO' then total_season_points
        end
    ) as yahoo_total_season_points,
    min(
        case
            when fantasy_site = 'SLEEPER' then site_rank
        end
    ) as sleeper_site_rank,
    sum(
        case
            when fantasy_site = 'SLEEPER' then total_season_points
        end
    ) as sleeper_total_season_points,
    avg(site_rank) as average_site_rank,
    avg(total_season_points) as average_season_points,
    median(site_rank) as median_site_rank,
    median(total_season_points) as median_season_points
from
    {{ ref('int_player_stats_by_site') }}
group by
    player_id,
    player_name,
    player_position
