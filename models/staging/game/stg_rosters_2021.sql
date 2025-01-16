SELECT 
    "player_id" as player_id, 
    "player_name" as player_name, 
    "position" as position, 
    "recent_team" as recent_team 
FROM {{ source('nfl', 'rosters_2021') }}