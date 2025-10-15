with shipping_attributes as (
    select distinct ship_mode, ship_instruction, ship_priority
    from {{ ref('int_order_items') }}
),
final as (
    select
    HASH(ship_mode, ship_instruction, ship_priority) as shipping_id,
    ship_mode, ship_instruction, ship_priority
    from shipping_attributes
)
select * from final