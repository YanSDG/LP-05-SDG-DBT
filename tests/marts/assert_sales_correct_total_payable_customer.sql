select
    order_id,
    line_number,
    net_sale_amount,
    tax_amount,
    total_payable_customer
from {{ ref('fct_sales') }}
where (net_sale_amount + tax_amount) <> total_payable_customer