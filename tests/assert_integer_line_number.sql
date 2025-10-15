select
    order_id,
    ship_date,
    line_number
from {{ ref('stg_proyecto__lineitems') }}
where line_number <> FLOOR(line_number)