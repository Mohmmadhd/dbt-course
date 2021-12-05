{{
  config(
    materialized='table'
  )
}}

SELECT
    order_id as order_guid,
    user_guid,
    created_at_utc,
    order_cost,
    shipping_cost,
    order_total,
    status as order_status,
    count(product_id)
from {{ref('stg_orders')}}
join {{ref('stg_order_items')}}
using ( order_id)
group by   order_id as order_guid,
    user_guid,
    created_at_utc,
    order_cost,
    shipping_cost,
    order_total,
    status 