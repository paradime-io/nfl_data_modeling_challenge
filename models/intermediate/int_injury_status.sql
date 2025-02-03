
SELECT 
        year,
        team_id,
        player_id,
        njury_status,
        injury_type,
        injury_details,
        fantasy_status,
        CASE
        -- Questionable: Player has a 50/50 chance of playing in the upcoming game due to injury.
            WHEN injury_status = 'Questionable' THEN 0.5
        -- Player is out for the season or a significant period and cannot play.
            WHEN injury_status = 'IR' THEN 0
        -- IR-R: Player is out but eligible to return after a set period, usually a few weeks.
            WHEN injury_status = 'IR-R' THEN 0.3
        -- PUP-R: Player is recovering from an offseason injury and unable to participate in training camp or games, but can be activated later.
            WHEN injury_status = 'PUP-R' THEN 0.2
        ELSE NULL
        END AS probabilty_play

    FROM  {{ ref('src_nfl_injuries_2021_2025') }}
