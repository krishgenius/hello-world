{% macro incremental_load(source_table, target_table, unique_key, updated_at) %}

with source_data as (
    select *, current_timestamp() as dbt_updated_dt
    from {{ source_table }}
    {% if is_incremental() %}
    where {{ audit_etl_job_upd_ts }} > (select max({{ nvl(dbt_updated_dt,'1-jan-1900') }}) from {{ target_table }})
    {% endif %}
)
select
    *
from source_data
{% endmacro %}