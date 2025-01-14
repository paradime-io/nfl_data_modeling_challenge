WITH source AS (
    SELECT 
        * 
    FROM 
        {{ ref('seed_nfl_ids') }}
),

select_columns AS (
        SELECT 
        --IDs
        gsis_id,
        pfr_id,
        name as player_name,

        from source
)

SELECT 
    *
FROM 
    select_columns
