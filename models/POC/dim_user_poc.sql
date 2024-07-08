{{ config(
    materialized='incremental',
    unique_key='id'
) }}

{{ incremental_load(
    source_table="edw_ods_dev.org62.ods_user",
    target_table=this,
    unique_key="id",
    updated_at="dbt_updated_dt"
)}}
