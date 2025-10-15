{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

select
    o_orderkey as order_id,
    o_custkey as customer_id,
    o_orderstatus as order_status,
    o_totalprice as total_price,
    o_orderdate as order_date,
    o_orderpriority as order_priority,
    o_clerk as clerk,
    o_shippriority as ship_priority

from {{ source('proyecto', 'orders') }}
-- Only load or edit the most recent orders
-- (7 day margin respect to the last stored more recent order)
{% if is_incremental() %}
    where order_date >= dateadd(day, -7, (select max(order_date) from {{ this }}))
{% endif %}