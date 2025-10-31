select
    order_id,
    line_number,
    item_price,
    quantity,
    extended_price
from {{ ref('fct_sales') }}
where (item_price * quantity) <> extended_price