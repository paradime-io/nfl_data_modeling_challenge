-- self-join to add opponent_yards_gained

WITH opponent_yards AS (
    SELECT
        a.*,
        b.total_yards_gained                            AS opponent_yards_gained,
        (a.total_yards_gained - b.total_yards_gained)   AS yards_differential,
        CASE
            WHEN
                a.total_yards_gained > b.total_yards_gained
            THEN 1
            ELSE 0
        END AS yards_win,
        CASE
            WHEN
                a.total_yards_gained < b.total_yards_gained
            THEN 1
            ELSE 0
        END AS yards_loss,
        CASE
            WHEN
                a.total_yards_gained = b.total_yards_gained
            THEN 1
            ELSE 0
        END AS yards_tied        
    FROM
        {{ ref('int_team_play_by_play_yards')}} a,
        {{ ref('int_team_play_by_play_yards')}} b
    WHERE
        a.game_id = b.game_id AND
        a.offense_team != b.offense_team
)

SELECT
    *
FROM
    opponent_yards