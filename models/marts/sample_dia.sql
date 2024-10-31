-- IMPORT
with inventory  as (select * from   {{ ref('stg_tcps__inventory') }}),
item as (select * from {{ ref('stg_tcps__item') }}),
warehouse as (select * from {{ ref('stg_tcps__warehouse') }}),
-- TRANSFORM
transform as (
SELECT
    {{ dbt_utils.generate_surrogate_key(['w.w_warehouse_name', 'i.i_category']) }} as skey, 
    --hash(w.w_warehouse_name||i.i_category)  as skey,
     w.w_warehouse_name,
    i.i_category,
    SUM(iv.inv_quantity_on_hand) AS total_stock
FROM 
inventory iv
JOIN item  i ON iv.inv_item_sk = i.i_item_sk
JOIN warehouse w ON iv.inv_warehouse_sk = w.w_warehouse_sk
GROUP BY w.w_warehouse_name, i.i_category,
  {{ dbt_utils.generate_surrogate_key(['w.w_warehouse_name', 'i.i_category']) }}
)
-- FINAL SELECT
select * from transform

 