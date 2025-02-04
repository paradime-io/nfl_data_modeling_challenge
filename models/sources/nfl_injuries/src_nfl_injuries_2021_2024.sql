
    SELECT
        player_name,
        team_id,
        position,
        injury_status,
        injury_type,
        injury_details,
        fantasy_status
    FROM {{ source('nfl_ella', 'NFL_INJURY_DATA_2021_2024') }}