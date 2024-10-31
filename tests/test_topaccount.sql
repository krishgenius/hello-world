SELECT *
FROM {{ ref('TOP_ACCOUNTS') }}
WHERE acct_nm NOT IN ('DUMMY')