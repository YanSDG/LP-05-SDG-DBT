select
    order_id,
    total_price
from {{ ref('stg_proyecto__orders') }}
where total_price < 0