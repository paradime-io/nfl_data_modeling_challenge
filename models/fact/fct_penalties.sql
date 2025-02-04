-- fct_penalties
-- Need a penalties power of one for counting

SELECT
    *,
    1                   AS penalty_power_of_one
FROM
    {{ ref('int_penalties') }}