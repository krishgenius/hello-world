{{config(materialized='table')}}
with cte_account as
(select * from edw_ods_dev.org62.ods_account)
select * from cte_account 
