SELECT
    w.w_warehouse_name,
    i.i_category,
    SUM(iv.inv_quantity_on_hand) AS total_stock
FROM 
{{ ref('stg_tcps__inventory') }} iv
JOIN {{ ref('stg_tcps__item') }} i ON iv.inv_item_sk = i.i_item_sk
JOIN  {{ ref('stg_tcps__warehouse') }} w ON iv.inv_warehouse_sk = w.w_warehouse_sk
GROUP BY w.w_warehouse_name, i.i_category