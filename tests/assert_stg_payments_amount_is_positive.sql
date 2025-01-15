with payment as (
    select * from {{ ref('stg_stripe_payments')}}
)
select
    order_id,
    sum(amount) as total_amount
from
    payment
group BY
    order_id
having
    total_amount < 0