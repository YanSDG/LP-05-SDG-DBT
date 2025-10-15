with customers as (
    select * from {{ ref('stg_proyecto__customers') }}
),
geography as (
    select * from {{ ref('int_geography') }}
),
final as (
    select
        c.customer_id,
        c.name,
        g.nation,
        g.region,
        c.account_balance,
        c.market_segment
    from customers c left join geography g
    using (nation_id)
)
select * from final