{% macro get_min_date(model) %}
    {% if execute %}
        {% set date_columns = get_date_columns(model) %}
        {% set min_date_sql %}
            select to_char(min(min_date), 'YYYY-MM-DD') from (
            {% for column in date_columns %}
                {% if not loop.first -%}
                    union all 
                {% endif -%}
                select min({{ column }}) as min_date from {{ model }}
                
            {%- endfor %}
            )
        {% endset %}
        {% set result = run_query(min_date_sql) %}
        {{ return(result.columns[0].values()[0]) }}
    {% endif %}
{% endmacro %}