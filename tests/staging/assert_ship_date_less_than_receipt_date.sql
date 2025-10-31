select
    order_id,
    line_number,
    ship_date,
    receipt_date
from {{ ref('stg_proyecto__lineitems') }}
where ship_date > receipt_date