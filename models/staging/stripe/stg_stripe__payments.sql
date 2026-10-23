select 
       id as payments_id,
       orderid as order_id,
       paymentmethod as payment_method,
       amount/100 as amount,
       status,
       created as created_at,
       _batched_at
FROM {{source('stripe', 'payment')}}
