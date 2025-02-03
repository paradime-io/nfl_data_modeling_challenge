
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
            WHEN lower(injury_details) IN ('hip', 'lower_leg', 'knee', 'ankle', 'groin', 'achilles', 'calf', 'hamstring', 'foot') THEN 'Lower Body'
            -- There are many types of knee injuries
            WHEN lower(injury_details) LIKE '%knee%' THEN 'Lower Body'
            -- Upper body injuries
            WHEN lower(injury_details) IN ('shoulder', 'collarbone', 'ribs', 'pectoral', 'triceps', 'elbow', 'forearm', 'wrist', 'hand') THEN 'Upper Body'
            -- Core/Abdomen injuries
            WHEN lower(injury_details) IN ('abdomen', 'oblique', 'back', 'neck') THEN 'Core / Abdomen'
            -- Head injuries
            WHEN lower(injury_details) IN ('concussion', 'head') THEN 'Head'
            ELSE 'Other'
        END AS body_area,

        -- Flag if the player had multiple injuries in the same body area
        COUNT(*) OVER (PARTITION BY player_id, team_id, year, 
            CASE 
                WHEN lower(injury_details) IN ('hip', 'lower_leg', 'knee', 'ankle', 'groin', 'knee-acl', 'achilles', 'calf', 'hamstring', 'foot') THEN 'Lower Body'
                WHEN lower(injury_details) LIKE '%knee%' THEN 'Lower Body'
                WHEN lower(injury_details) IN ('shoulder', 'collarbone', 'ribs', 'pectoral', 'triceps', 'elbow', 'forearm', 'wrist', 'hand') THEN 'Upper Body'
                WHEN lower(injury_details) IN ('abdomen', 'oblique', 'back', 'neck') THEN 'Core / Abdomen'
                WHEN lower(injury_details) IN ('concussion', 'head') THEN 'Head'
                ELSE 'Other'
            END) AS injuries_in_area

    FROM  {{ ref('src_nfl_injuries_2021_2025') }}
