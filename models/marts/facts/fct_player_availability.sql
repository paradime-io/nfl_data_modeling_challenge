WITH player_availability AS (
    SELECT 
        PLAYER_NAME,
        SEASON,
        YEARS_EXPERIENCE,
        GAMES_PLAYED,
        TOTAL_FANTASY_POINTS_PPR,
        AVG_FANTASY_POINTS_PPR_PER_GAME,
        -- 3-Year Rolling Avg of Games Played
        CASE 
            WHEN COUNT(*) OVER (
                PARTITION BY PLAYER_NAME 
                ORDER BY SEASON 
                ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING
            ) = 3
            THEN AVG(GAMES_PLAYED) OVER (
                PARTITION BY PLAYER_NAME 
                ORDER BY SEASON 
                ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING
            )
            ELSE NULL
            END AS AVG_GAMES_PLAYED_PREV_3_SEASONS,
        -- Next Season’s Games Played
        LAG(GAMES_PLAYED, 1) OVER (
            PARTITION BY PLAYER_NAME 
            ORDER BY SEASON DESC
        ) AS NEXT_SEASON_GAMES
    FROM {{ref('int_fantasy_points')}}
    --where player_name = 'Russell Wilson'
), aggregated as (
    SELECT 
        PLAYER_NAME,
        count(season) as number_of_season,
        max(YEARS_EXPERIENCE) as YEARS_EXPERIENCE,
        avg(games_played) as avg_games_played,
        sum(games_played) as total_games_played,
        avg(total_fantasy_points_ppr) as avg_total_fantasy_points_ppr,
        avg(AVG_FANTASY_POINTS_PPR_PER_GAME) as avg_fantasy_points_per_ppr_per_game
    FROM player_availability
    group by PLAYER_NAME
)
select
    *
from aggregated