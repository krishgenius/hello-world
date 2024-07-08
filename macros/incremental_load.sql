{% macro incremental_load(source_table, target_table, unique_key, updated_at) %}

{{ config(
    materialized='incremental',
    unique_key='id'
) }}

with source_data as (
    select *, current_timestamp() as dbt_updated_dt
    from {{ source_table }}
)
select * from source_data    {% if is_incremental() %}    where {{ audit_etl_job_upd_ts }} > (select max({{ nvl(dbt_updated_dt,'1-jan-1900') }}) from {{ target_table }})    {% endif %}
{% endmacro %}