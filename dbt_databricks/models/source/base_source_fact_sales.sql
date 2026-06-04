with source as (
        select * from {{ source('source', 'fact_sales') }}
  ),
  renamed as  (
      select
          {{ adapter.quote("sales_id") }},
        {{ adapter.quote("date_sk") }},
        {{ adapter.quote("store_sk") }},
        {{ adapter.quote("product_sk") }},
        {{ adapter.quote("customer_sk") }},
        {{ adapter.quote("promotion_sk") }},
        {{ adapter.quote("quantity") }},
        {{ adapter.quote("unit_price") }},
        {{ adapter.quote("gross_amount") }},
        {{ adapter.quote("discount_amount") }},
        {{ adapter.quote("net_amount") }},
        {{ adapter.quote("payment_method") }}

      from source
  )
  select * from renamed
    