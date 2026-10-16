with source as (

    select *
    from {{ ref('retail_orders') }}

),

renamed as (

    select
        order_id::number as order_id,
        to_date(order_date) as order_date,
        customer_id::varchar as customer_id,
        product::varchar as product,
        category::varchar as category,
        quantity::number as quantity,
        unit_price::number(10,2) as unit_price,
        quantity * unit_price as sales_amount
    from source

)

select *
from renamed