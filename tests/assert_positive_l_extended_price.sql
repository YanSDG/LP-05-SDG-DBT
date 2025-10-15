select
    order_id,
    line_number,
    extended_price
from {{ ref('stg_proyecto__lineitems') }}
where extended_price < 0