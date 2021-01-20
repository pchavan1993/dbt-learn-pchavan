with 
orders as (

 select * from {{ ref('stg_orders')}}

),
order_payments as (
 select sum(amount_dollars) as amount_dollars,order_id from {{ ref('stg_payments')}}
 group by order_id

)
select payments.order_id,orders.customer_id, amount_dollars from order_payments as payments  left join orders on 
payments.order_id=orders.order_id
