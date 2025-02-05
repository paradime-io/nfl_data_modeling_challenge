SELECT 
    POSTEAM AS TEAM, 
    'offense' as type,
    EPA,
    game_id
FROM {{ref('stg_play_by_play_all')}}
WHERE POSTEAM IS NOT NULL

UNION ALL

SELECT 
    DEFTEAM AS TEAM, 
    'defense' as type,
    EPA,
    game_id
FROM {{ref('stg_play_by_play_all')}}
WHERE DEFTEAM IS NOT NULL