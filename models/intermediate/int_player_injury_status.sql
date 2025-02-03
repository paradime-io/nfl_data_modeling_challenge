
SELECT 
        year,
        team_id,
        player_id,
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

        -- Flag if the player had multiple injuries in the same body area
        COUNT(*) OVER (PARTITION BY player_id, team_id, year, 
            CASE 
                WHEN lower(injury_type) IN ('hip', 'lower_leg', 'knee', 'ankle', 'groin', 'knee-acl', 'achilles', 'calf', 'hamstring', 'foot') THEN 'Lower Body'
                WHEN lower(injury_type) LIKE '%knee%' THEN 'Lower Body'
                WHEN lower(injury_type) IN ('shoulder', 'collarbone', 'ribs', 'pectoral', 'triceps', 'elbow', 'forearm', 'wrist', 'hand') THEN 'Upper Body'
                WHEN lower(injury_type) IN ('abdomen', 'oblique', 'back', 'neck') THEN 'Core / Abdomen'
                WHEN lower(injury_type) IN ('concussion', 'head') THEN 'Head'
                ELSE 'Other'
            END) AS injuries_in_area,

        -- Categorize injury severity based on injury_type
        CASE 
            WHEN injury_type IN ('fracture', 'surgery', 'concussion', 'dislocated') THEN 'Severe'
            WHEN injury_type IN ('sprain', 'strain') THEN 'Moderate'
            WHEN injury_type = 'spasms' THEN 'Minor'
            ELSE 'Unknown'
        END AS injury_severity

    FROM  {{ ref('src_nfl_injuries_2021_2025') }}
