with acct_cols as (select acct_id, acct_nm from edw_dm_dev.common.dim_account)
select *
from acct_cols
where length(acct_nm) > 20


