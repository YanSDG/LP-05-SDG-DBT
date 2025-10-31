select
    order_id,
    line_number,
    extended_price,
    discount_amount,
    net_sale_amount
from {{ ref('fct_sales') }}
where (extended_price - discount_amount) <> net_sale_amount