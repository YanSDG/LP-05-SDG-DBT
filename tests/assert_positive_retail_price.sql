select
    part_id,
    retail_price
from {{ ref('stg_proyecto__parts') }}
where retail_price < 0