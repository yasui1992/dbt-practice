with
source as (
    select * from {{ source('tpch_sf1', 'orders') }}
),
renamed as (
    select
        -- primary key
        o_orderkey as order_key,

        -- foreign key
        o_custkey as customer_key,

        -- strings
        o_orderstatus as order_status,
        o_orderpriority as order_priority,
        o_clerk as clerk,
        o_comment as comment,

        -- numerics
        o_totalprice as total_price,
        o_shippriority as ship_priority,

        -- dates
        o_orderdate as order_date,
    from source
)
select * from renamed