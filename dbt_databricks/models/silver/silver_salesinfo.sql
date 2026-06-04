WITH sales AS (
    SELECT
        sales_id,product_sk,customer_sk,
        {{ multiply('quantity', 'unit_price') }} AS calculated_gross_amount,
        gross_amount,payment_method
    FROM {{ ref('bronze_sales') }}
),
products AS (
    SELECT product_sk,category
    FROM {{ ref('bronze_product') }}
),
customer AS (
    SELECT customer_sk,gender
    FROM {{ ref('bronze_customer') }}
),
joined_query AS (
SELECT 
    s.sales_id,
    s.gross_amount,
    s.payment_method, 
    p.category,
    c.gender
FROM sales s
LEFT JOIN products p ON s.product_sk = p.product_sk
LEFT JOIN customer c ON s.customer_sk = c.customer_sk
)

select category,
       gender,
       sum(gross_amount) as total_gross_amount
from joined_query
group by category,gender order by total_gross_amount desc