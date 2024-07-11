<<<<<<< HEAD
select * from {{ ref("dim_account_poc") }} where id is null
=======
select * from {{ ref('dim_account_poc') }} where id is not null
>>>>>>> 652f1b6469c0c5405af9641db3dbb294e700fc12
