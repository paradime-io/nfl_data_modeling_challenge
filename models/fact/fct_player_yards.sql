-- self-join to add opponent_yards_gained

WITH player_yards AS (
    SELECT
        *       
    FROM
        {{ ref('int_team_play_by_player_yards') }}
),

game_details AS (
    SELECT
        *
    FROM
        {{ ref('int_game_details') }}
),

player_stats_by_game AS (
    SELECT
        *
    FROM
        {{ ref('player_stats_by_game')}}
),

stats_with_game_details AS (
    SELECT
        aggs.*,
        gd.game_date                        AS game_date,
        gd.game_details                     AS game_details
    FROM 
        player_yards aggs
    LEFT JOIN
        game_details gd
    ON
        aggs.game_id = gd.game_id
),

/*
Join to int_play_by_play_yards again for passer_player_id & 
rusher_player_id, this time as a lookup rather than for grouping.

Have to split the table on the not nulls & then do a union
otherwise there will be conflicts on the alias names for the
new columns.
*/

stats_with_passer_player AS (
    SELECT
        sgd.*,
        psg.player_id                   AS passer_player_id,
        psg.player_display_name         AS player_display_name,
        psg.position_x                  AS position
    FROM
        stats_with_game_details sgd
    JOIN
        player_stats_by_game psg
    ON
        sgd.passer_player_name = psg.player_name_x
    WHERE
        sgd.passer_player_name IS NOT NULL
), 

stats_with_rusher_player AS (
    SELECT
        sgd.*,
        psg.player_id                   AS rusher_player_id,
        psg.player_display_name         AS player_display_name,
        psg.position_x                  AS position
    FROM
        stats_with_game_details sgd
    JOIN
        player_stats_by_game psg
    ON
        sgd.rusher_player_name = psg.player_name_x
    WHERE
        sgd.rusher_player_name IS NOT NULL
),

passers_and_rushers AS (
    SELECT 
        *
    FROM
        stats_with_passer_player
    UNION
    SELECT
        *
    FROM
        stats_with_rusher_player
)

SELECT
    *
FROM
    passers_and_rushers
