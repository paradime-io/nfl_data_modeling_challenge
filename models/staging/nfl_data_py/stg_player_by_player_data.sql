WITH pbp_data AS (
    SELECT
        GAME_ID,
        SEASON,
        WEEK,
        POSTEAM AS TEAM,
        DEFTEAM AS OPPONENT_TEAM,
        YARDLINE_100,
        DOWN,
        YDSTOGO,
        PLAY_TYPE,
        YARDS_GAINED,
        TOUCHDOWN,
        PASSER_PLAYER_ID,
        RUSHER_PLAYER_ID,
        RECEIVER_PLAYER_ID,
        FANTASY_PLAYER_ID,
        FANTASY_PLAYER_NAME
    FROM
        {{ source('nfl_data_py', 'PLAYER_BY_PLAYER_DATA') }}
)
SELECT
    *
FROM
    pbp_data