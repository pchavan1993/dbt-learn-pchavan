 {{ config(materialized='view') }}
 select
        ID as payment_id,
        ORDERID as order_id,
        PAYMENTMETHOD as payment_method,
        STATUS as payment_status,
        (AMOUNT/100) as amount_dollars,
        CREATED as created_at
    from raw.stripe.payment
    where status='success'