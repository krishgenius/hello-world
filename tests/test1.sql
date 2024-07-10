select * from {{ ref("dim_account_poc") }} where id is null
