{% snapshot parts_snapshot %}
  {{
    config(
      target_schema='snapshots',
      unique_key='p_partkey',
      strategy='check',
      check_cols=['p_name', 'p_mfgr', 'p_brand', 'p_type', 'p_size', 'p_container', 'p_retailprice']
    )
  }}

  select * from {{ source('proyecto', 'parts') }}
{% endsnapshot %}