-- self-join to add opponent_yards_gained

WITH player_yards AS (
    SELECT
        *       
    FROM
        {{ ref('int_team_play_by_player_yards') }}
)

SELECT
    *
FROM
    player_yards