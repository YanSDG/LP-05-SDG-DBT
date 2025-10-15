with base_date as (
    {% set min_date = get_min_date(ref('int_order_items')) %}
    {% set current_date = run_started_at.strftime('%Y-%m-%d') %}
    {{ dbt_date.get_date_dimension(min_date, current_date) }}
),
final as (
    select {{ date_to_int('date_day') }} as date_id, * from base_date
)
select * from final