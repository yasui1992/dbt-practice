with
source as (
    select * from {{ source('tpch_sf1', 'orders') }}
),
renamed as (
    select
        -- primary key
        o_orderkey as orderkey,

        -- foreign key
        o_custkey as custkey,

        -- strings
        o_orderstatus as orderstatus,
        o_orderpriority as orderpriority,
        o_clerk as clerk,
        o_comment as comment,

        -- numerics
        o_totalprice as totalprice,
        o_shippriority as shippriority,

        -- dates
        o_orderdate as orderdate,
    from source
)
select * from renamed