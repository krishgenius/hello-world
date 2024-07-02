with acct_cols as (select id, name from ods_account)
select *
from acct_cols
where length(name) > 20


