{{ config(
    materialized='incremental',
    unique_key='id'
) }}
with source_data as (
    select
        *
    from edw_ods_dev.org62.ods_opportunity
    {% if is_incremental() %}
    where updated_at > (select max(updated_at) from {{ this }})
    {% endif %}
   
)

{% if is_incremental() %}
-- Step 1: Delete matching records from the target table
delete from {{ this }}
where id in (select id from source_data);

-- Step 2: Insert new and updated records into the target table
insert into {{ this }} (
    select
       *
    from source_data
);

{% else %}

-- Full refresh logic (initial load)
select
  *
from source_data

{% endif %}