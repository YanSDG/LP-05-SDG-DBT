{{ config(
    materialized='table'
) }}


with lineitems as (
    select * from {{ ref('stg_proyecto__lineitems') }}
),
orders as (
    select * from {{ ref('stg_proyecto__orders') }}
),
final as (
    select *
    from lineitems
    left join orders
    using (order_id)
)
select * from final