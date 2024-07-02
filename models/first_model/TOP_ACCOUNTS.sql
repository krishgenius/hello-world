with acct_cols as (select id, name from edw_ods_dev.org62.ods_account)
select *
from acct_cols
where length(name) > 20


