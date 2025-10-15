with order_items as (
    select * from {{ ref('int_order_items') }}
),
parts_supp as (
    select * from {{ ref('stg_proyecto__partsupp') }}
),
sales_with_cost as (
    select * from order_items
    left join parts_supp
    using (part_id, supplier_id)
),
final as (
    select
        -- Degenerate dimensions, used to group by order or to find a sale
        order_id,
        line_number,
        -- FKs to dimensions
        part_id,
        customer_id,
        supplier_id,
        HASH(return_flag, line_status, order_status, order_priority) as sale_status_id,
        HASH(ship_mode, ship_instruction, ship_priority) as shipping_id,
        {{ date_to_int('ship_date') }} as ship_date_id,
        {{ date_to_int('receipt_date') }} as receipt_date_id,
        {{ date_to_int('commit_date') }} as commit_date_id,
        {{ date_to_int('order_date') }} as order_date_id,
        -- Metrics
        quantity,
        discount,
        tax,
        extended_price / quantity as item_price,
        supply_cost as item_supply_cost,
        extended_price,
        ROUND(extended_price * discount, 2) as discount_amount,
        ROUND(extended_price * tax, 2) as tax_amount,
        extended_price - discount_amount as net_sale_amount,
        net_sale_amount + tax_amount as total_payable_customer,
        supply_cost * quantity as total_supply_cost,
        net_sale_amount - total_supply_cost as gross_profit_amount,
        ROUND((gross_profit_amount / net_sale_amount) * 100, 2) as gross_margin_percent
    from sales_with_cost
)
select * from final