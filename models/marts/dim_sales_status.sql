with status_attributes as (
    select distinct return_flag, line_status, order_status, order_priority
    from {{ ref('int_order_items') }}
),
final as (
    select
    HASH(return_flag, line_status, order_status, order_priority) as sale_status_id,
    return_flag, line_status, order_status, order_priority
    from status_attributes
)
select * from final