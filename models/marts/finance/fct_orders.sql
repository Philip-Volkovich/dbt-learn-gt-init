with payments AS 
(   
    SELECT * FROM {{ref('stg_stripe__payments')}}
),

orders as (

    select * from {{ref('stg_jaffle_shop__orders')}}

)
,order_payments AS 
(
    select order_id,
    SUM(CASE WHEN status = 'success' THEN amount ELSE 0 end) as amount  
    from payments 
    GROUP BY order_id


)

SELECT 
    orders.order_id,
    orders.customer_id,
    orders.order_date,
    order_payments.amount
FROM orders

LEFT JOIN order_payments USING (order_id)
