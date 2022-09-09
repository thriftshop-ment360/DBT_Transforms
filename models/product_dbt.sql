{{ config(materialized='table') }}

with transform_product as (
select
  product_id	
  ,product_name		
  ,product_category		
  ,product_sub_category			
  ,brand				
  ,sale_price	
  ,market_price			
  ,product_type	
  ,product_rating			
  ,product_description	
  ,('10%') as tax_percentage				
  ,'https://www.istockphoto.com/illustrations/loading-icon' as product_image			
  ,current_datetime as created_datetime	
  ,current_datetime as updated_datetime	
  ,'yes' as is_active	
  from `thriftshop_mysql_test.product_staging`
)

select *
from transform_product