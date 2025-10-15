select
    order_id,
    line_number,
    quantity
from {{ ref('stg_proyecto__lineitems') }}
where quantity <> FLOOR(quantity)