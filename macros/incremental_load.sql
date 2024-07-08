{% macro incremental_load(source_table, target_table, unique_key, updated_at) %}

with source_data as (
    select *
    from {{ source_table }}
    {% if is_incremental() %}
    where {{ updated_at }} > (select max({{ updated_at }}) from {{ target_table }})
    {% endif %}
)

select
    *
from source_data

{% endmacro %}
