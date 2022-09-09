{{ config(materialized='table') }}

with transform_deals as (

 SELECT 
  ROW_NUMBER() OVER() AS deal_id,
  product product_id,
  'half_price' as deal_type,
  'Big Basket' as shop_name,
  current_datetime as deal_start_datetime,
  DATETIME_ADD(DATETIME "2022-09-07 00:00:00", INTERVAL 1 WEEK) as deal_end_datetime,
  '50 %' deal_percentage,
  (market_price * 0.5) as discounted_price,
  current_datetime as created_datetime
  from `thriftshop_mysql_test.product_250`
  order by rand() limit 50
)

select *
from transform_deals