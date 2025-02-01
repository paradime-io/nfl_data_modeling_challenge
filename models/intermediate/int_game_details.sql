WITH final_score AS (
    SELECT
        game_id,
        max(total_home_score) as home_score, 
        max(total_away_score) as away_score
    FROM
        {{ source('public', 'play_by_play') }}
    GROUP BY 1
    ),

game_details AS (
    SELECT DISTINCT
        game_id,
        game_date,
        home_team_name || ' vs. ' || away_team_name || ' - ' || game_date as game_details
    FROM
        {{ ref('int_play_by_play_yards') }}
    ),

joined AS (
    SELECT
        fs.game_id              AS game_id,
        gd.game_date            AS game_date,
        fs.home_score           AS home_score,
        fs.away_score           AS away_score,
        gd.game_details         AS game_details
    FROM
        final_score fs 
    JOIN
        game_details gd
    ON
        fs.game_id = gd.game_id
    )

SELECT
    *
FROM
    joined