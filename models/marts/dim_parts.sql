with final as (
    select part_id, name, manufacturer, brand, type, size, container, retail_price
    from {{ ref('stg_proyecto__parts') }}
)
select * from final