select
    order_id,
    line_number,
    item_supply_cost,
    quantity,
    total_supply_cost
from {{ ref('fct_sales') }}
where (item_supply_cost * quantity) <> total_supply_cost