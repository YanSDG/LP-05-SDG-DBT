select
    order_id,
    line_number,
    net_sale_amount,
    total_supply_cost,
    gross_profit_amount
from {{ ref('fct_sales') }}
where (net_sale_amount - total_supply_cost) <> gross_profit_amount