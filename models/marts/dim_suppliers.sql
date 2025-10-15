with suppliers as (
    select * from {{ ref('stg_proyecto__suppliers') }}
),
geography as (
    select * from {{ ref('int_geography') }}
),
final as (
    select
        s.supplier_id,
        s.name,
        g.nation,
        g.region,
        s.account_balance
    from suppliers s left join geography g
    using (nation_id)
)
select * from final