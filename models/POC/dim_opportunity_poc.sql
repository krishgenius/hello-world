{{ config(
    materialized='incremental',
    unique_key='id'
) }}

with source_data as (
    select
        *, current_timestamp as dbt_updated_dt
    from edw_ods_dev.org62.ods_opportunity)
    select * from source_data 
    {% if is_incremental() %}
    where audit_etl_job_upd_ts > (select max({{ this }}.dbt_updated_dt) from {{ this }})
    {% endif %}


