select
    order_id,
    line_number,
    gross_profit_amount,
    net_sale_amount,
    gross_margin_percent
from {{ ref('fct_sales') }}
where ROUND((gross_profit_amount / net_sale_amount) * 100, 2) <> gross_margin_percent