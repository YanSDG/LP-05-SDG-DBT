{% macro get_date_columns(model) %}
    {% if execute %}
        {% set min_date_sql %}
            select column_name
            from {{ model.database }}.information_schema.columns
            where table_schema ilike '{{ model.schema }}'
            and table_name ilike '{{ model.identifier }}'
            and data_type = 'DATE'
        {% endset %}
        {% set result = run_query(min_date_sql) %}
        {{ return(result.columns[0].values()) }}
    {% endif %}
{% endmacro %}