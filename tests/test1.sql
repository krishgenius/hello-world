select * from {{ ref('dim_account_poc') }} where id is not null
 limit 10
