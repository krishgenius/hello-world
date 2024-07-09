{{config(materialized='table')}}
with cte_account as
(select * from {{ source('poc_source', 'ods_account') }})
select * from cte_account 

