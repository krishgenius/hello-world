{{config(materialized='table')}}
select acct_id, acct_nm 
from   {{ref("TOP_ACCOUNTS")}}
where upper(acct_nm) like 'B%'