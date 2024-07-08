{% macro incremental_load(source_table, target_table, unique_key, updated_at) %}


with source_data as (
    select *, current_timestamp() as dbt_updated_dt
    from {{ source_table }}
) 
    select * from source_data
        {% if is_incremental() %}
    where audit_etl_job_upd_ts > (select NVL(max({{ this }}.dbt_updated_dt),'1-JAN-1900') from {{ this }})
    {% endif %}

{% endmacro %}