WITH player_injury_history AS (
    SELECT 
        player_id,
        team_id,
        year,
        injury_status,
        injury_type,
        injury_details,
        COUNT(*) AS injuries_in_year  -- Counting injuries per player per year
    FROM {{ ref('int_player_injury_status') }}
    GROUP BY player_id, team_id, year, injury_status, injury_type, injury_details
),

-- Checking for injuries in the following year (next year within 2022-2025)
player_injury_followup AS (
    SELECT 
        a.player_id,
        a.year AS current_year,
        b.year AS next_year,
        a.injury_type,
        a.injury_details,
        COUNT(b.injury_type) AS injuries_in_next_year  -- Count if the player has injuries in the next year
    FROM player_injury_history a
    LEFT JOIN player_injury_history b
        ON a.player_id = b.player_id
        AND a.injury_type = b.injury_type
        AND a.injury_details = b.injury_details
        AND b.year = a.year + 1  -- Check if injury exists in the following year
    GROUP BY a.player_id, a.year, b.year, a.injury_type, a.injury_details
),

-- Final aggregation of injury history
final_injury_history AS (
    SELECT 
        a.player_id,
        a.team_id,
        a.year,
        a.injuries_in_year,
        b.injuries_in_next_year,
        CASE
            WHEN b.injuries_in_next_year > 0 THEN 'Yes'  -- Recurring injuries
            ELSE 'No'  -- No recurring injuries
        END AS has_recurring_injury
    FROM player_injury_history a
    LEFT JOIN player_injury_followup b 
        ON a.player_id = b.player_id
        AND a.year = b.current_year
)

SELECT * 
FROM final_injury_history
ORDER BY player_id, year;
