{% test date_newer_than(model, column_name, old_date) %}

select *
from {{ model }}
where {{ column_name }} < '{{ old_date }}'

{% endtest %}