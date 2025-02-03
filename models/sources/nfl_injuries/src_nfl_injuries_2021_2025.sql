
    SELECT
        year,
        team_id,
        player_id,
        injury_status,
        injury_type,
        injury_details,
        fantasy_status
    FROM {{ source('nfl_ella', 'NFL_INJURY_DATA_2021_2025') }}