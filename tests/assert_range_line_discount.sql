select
    order_id,
    line_number,
    discount
from {{ ref('stg_proyecto__lineitems') }}
where discount < 0 or discount > 1