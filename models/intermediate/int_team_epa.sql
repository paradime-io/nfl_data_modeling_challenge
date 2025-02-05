SELECT 
    POSTEAM AS TEAM, 
    EPA AS OFFENSIVE_EPA,
    game_id
FROM {{ref('stg_play_by_play_all')}}
WHERE POSTEAM IS NOT NULL

UNION ALL

SELECT 
    DEFTEAM AS TEAM,
    EPA AS DEFENSIVE_EPA,
    game_id
FROM {{ref('stg_play_by_play_all')}}
WHERE DEFTEAM IS NOT NULL