{% macro date_to_int(date_column) %}
    to_char({{date_column}},'YYYYMMDD')::int
{% endmacro %}