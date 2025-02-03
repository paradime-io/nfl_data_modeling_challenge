
SELECT
        year,
        s.team_id,
        p.team_name,
        position,
        injury_status,
        injury_type,
        injury_details,
        fantasy_status,
        -- Categorize the injury based on the body part
        CASE 
            -- Lower body injuries
            WHEN lower(injury_type) IN ('hip', 'lower_leg', 'knee', 'ankle', 'groin', 'achilles', 'calf', 'hamstring', 'foot') THEN 'Lower Body'
            -- There are many types of knee injuries
            WHEN lower(injury_type) LIKE '%knee%' THEN 'Lower Body'
            -- Upper body injuries
            WHEN lower(injury_type) IN ('shoulder', 'collarbone', 'ribs', 'pectoral', 'triceps', 'elbow', 'forearm', 'wrist', 'hand') THEN 'Upper Body'
            -- Core/Abdomen injuries
            WHEN lower(injury_type) IN ('abdomen', 'oblique', 'back', 'neck') THEN 'Core / Abdomen'
            -- Head injuries
            WHEN lower(injury_type) IN ('concussion', 'head') THEN 'Head'
            ELSE 'Other'
        END AS body_area,

        -- Categorize injury severity based on injury_type
        CASE 
            WHEN lower(injury_details) IN ('fracture', 'surgery', 'concussion', 'dislocated') THEN 'Severe'
            WHEN lower(injury_type) IN ('sprain', 'strain') THEN 'Moderate'
            WHEN lower(injury_type) = 'spasms' THEN 'Minor'
            ELSE 'Unknown'
        END AS injury_severity

    FROM {{ ref('src_nfl_injuries_2021_2024') }} AS s
    LEFT JOIN {{ ref('src_nfl_team_name') }} AS p
        ON s.team_id = p.team_id
