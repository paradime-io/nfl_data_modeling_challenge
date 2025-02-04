SELECT 
    team_id,
    team_name,
    position,
    body_area,
    injury_status,
    injury_details,

    -- Count total injuries per team, position, year, and body area
    COUNT(*) AS injuries,

    -- Count injuries by severity
    COUNT(CASE WHEN injury_severity = 'Severe' THEN 1 END) AS severe_injuries,
    COUNT(CASE WHEN injury_severity = 'Moderate' THEN 1 END) AS moderate_injuries,
    COUNT(CASE WHEN injury_severity = 'Minor' THEN 1 END) AS minor_injuries,

    -- Injury Impact Index (Severity Weight)
    SUM(CASE 
        WHEN injury_severity = 'Severe' THEN 3  
        WHEN injury_severity = 'Moderate' THEN 2
        WHEN injury_severity = 'Minor' THEN 1
        ELSE 0
    END) AS injury_impact_index

FROM {{ ref('int_player_injury_status') }}
GROUP BY team_id, team_name, position, body_area, injury_status, injury_details
