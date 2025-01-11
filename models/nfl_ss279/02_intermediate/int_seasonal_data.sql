 WITH source AS (
    SELECT 
    * 
    FROM 
        {{ ref('stg_seasonal_data') }}
)
 
SELECT
*
from source