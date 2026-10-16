select
    category,
    count(*) as order_line_count,
    count(distinct customer_id) as unique_customers,
    sum(quantity) as units_sold,
    sum(sales_amount) as total_sales,
    avg(sales_amount) as avg_line_sales
from {{ ref('stg_retail_orders') }}
group by category