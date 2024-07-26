{{
    config(
        materialized='incremental',
        unique_key='id'
    )
}}
with source_data as (
    select
        id,
        name,
        currencyisocode, del_flg
    from {{ ref('dim_account_poc') }}
)
select
    id,
    name,
    {{ my_new_project.isdeleted(del_flg)}} as isdeleted,
    {{my_new_project.conversion_required(currencyisocode)}} as conversion_required
from source_data
 