{{config(materialized='table')}}
select id, name 
from {{ref("TOP_ACCOUNTS")}}
where upper(name) like 'A%'