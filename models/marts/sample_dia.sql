-- IMPORT
<<<<<<< HEAD
with inventory as (select * from {{ ref('stg_tcps__inventory') }}),
=======
with inventory  as (select * from   {{ ref('stg_tcps__inventory') }}),
>>>>>>> ff851a2526228fa7482cc1a9ffd83524efc68a86
item as (select * from {{ ref('stg_tcps__item') }}),
warehouse as (select * from {{ ref('stg_tcps__warehouse') }}),
-- TRANSFORM
transform as (
SELECT
<<<<<<< HEAD
<<<<<<< HEAD
    hash(w.w_warehouse_name|| i.i_category) as skey,
    w.w_warehouse_name,
=======
    hash(w.w_warehouse_name||i.i_category)  as skey,
=======
    {{ dbt_utils.generate_surrogate_key(['w.w_warehouse_name', 'i.i_category']) }} as skey, 
    --hash(w.w_warehouse_name||i.i_category)  as skey,
>>>>>>> 2a82d3bf0ecec023f9f6dc77696613d1db497819
     w.w_warehouse_name,
>>>>>>> ff851a2526228fa7482cc1a9ffd83524efc68a86
    i.i_category,
        SUM(iv.inv_quantity_on_hand) AS total_stock
FROM 
inventory iv
<<<<<<< HEAD
JOIN item i ON iv.inv_item_sk = i.i_item_sk
JOIN warehouse w ON iv.inv_warehouse_sk = w.w_warehouse_sk
GROUP BY w.w_warehouse_name, i.i_category,
hash(w.w_warehouse_name|| i.i_category)
=======
JOIN item  i ON iv.inv_item_sk = i.i_item_sk
JOIN warehouse w ON iv.inv_warehouse_sk = w.w_warehouse_sk
GROUP BY w.w_warehouse_name, i.i_category,
<<<<<<< HEAD
   hash(w.w_warehouse_name||i.i_category)
>>>>>>> ff851a2526228fa7482cc1a9ffd83524efc68a86
=======
  {{ dbt_utils.generate_surrogate_key(['w.w_warehouse_name', 'i.i_category']) }}
>>>>>>> 2a82d3bf0ecec023f9f6dc77696613d1db497819
)
-- FINAL SELECT
select * from transform

<<<<<<< HEAD

=======
 
>>>>>>> ff851a2526228fa7482cc1a9ffd83524efc68a86
