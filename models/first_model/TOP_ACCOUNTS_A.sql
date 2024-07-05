{{config(materialized='table')}}
select acct_id, acct_nm 
from edw_dm_dev.common.dim_account--{{ref("TOP_ACCOUNTS")}}
where upper(acct_nm) like 'A%'