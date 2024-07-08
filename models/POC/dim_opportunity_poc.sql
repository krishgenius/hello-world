{{ config(
    materialized='incremental',
    unique_key='id'
) }}

with source_data as (
    select
        *
    from edw_ods_dev.org62.ods_opportunity
    {% if is_incremental() %}
    where audit_etl_job_upd_ts > (select max(audit_etl_job_upd_ts) from {{ this }})
    {% endif %}
)

{% if is_incremental() %}
-- Step 1: Delete matching records from the target table

merge into {{ this }} as target
using source_data as source
on target.id = source.id
when matched then
    update set
        name = source.name,
        audit_etl_job_upd_ts = current_timestamp()
when not matched then
    insert (id, name, audit_etl_job_upd_ts)
    values (source.id, source.name, current_timestamp());

{% else %}

-- Full refresh logic (initial load)
select
  *
from source_data

{% endif %}