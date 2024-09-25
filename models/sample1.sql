select w.w_warehouse_name, i.i_category, sum(iv.inv_quantity_on_hand) as total_stock
from {{ source("tcps", "inventory") }} iv
join {{ source("tcps", "item") }} i on iv.inv_item_sk = i.i_item_sk
join {{ source("tcps", "warehouse") }} w on iv.inv_warehouse_sk = w.w_warehouse_sk
group by w.w_warehouse_name, i.i_category
;
