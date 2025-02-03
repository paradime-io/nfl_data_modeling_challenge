    SELECT 
        team_id,
        team_name,
        abbreviation
    FROM {{ source('nfl_ella', 'NFL_TEAM') }}