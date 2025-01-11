 WITH source AS (
    SELECT 
    * 
    FROM 
        {{ source('SHYAMNS279NXRO8_ANALYTICS', 'NFL_SEASONAL_2020_2024') }}
)
 
SELECT
*
from source