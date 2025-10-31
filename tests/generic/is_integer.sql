{% test is_integer(model, column_name) %}

select *
from {{ model }}
where {{ column_name }} <> FLOOR({{ column_name }})

{% endtest %}