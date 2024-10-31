{{ config(
    materialized='table'
) }}

SELECT
    acct_id,
    acct_nm,
    {{ isdeleted(del_flg) }} AS status,
    {{ conversion_required(CURRENCYISOCODE) }} AS currency_conversion_status
FROM
    {{ ref('TOP_ACCOUNTS')}}