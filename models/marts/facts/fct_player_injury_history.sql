SELECT 
        team_id,
        team_name,
        position,
        year,
        body_area,
        COUNT(*) AS injuries_in_year,  -- Counting injuries per team per position per year
        COUNT(CASE WHEN injury_severity = 'Severe' THEN 1 END) AS severe_injuries,
        COUNT(CASE WHEN injury_severity = 'Moderate' THEN 1 END) AS moderate_injuries,
        COUNT(CASE WHEN injury_severity = 'Minor' THEN 1 END) AS minor_injuries
    FROM {{ ref('int_player_injury_status') }}
    GROUP BY team_id, team_name, position, year, body_area, injury_details
