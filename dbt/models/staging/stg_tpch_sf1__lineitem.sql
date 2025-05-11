with
source as (
    select * from {{ source('tpch_sf1', 'lineitem') }}
),
renamed as (
    select
        -- primary keys
        l_orderkey as orderkey,
        l_linenumber as linenumber,

        --foreign keys
        l_partkey as partkey,
        l_suppkey as suppkey,

        -- strings
        l_returnflag as returnflag,
        l_linestatus as linestatus,
        l_shipinstruct as shipinstruct,
        l_shipmode as shipmode,
        l_comment as comment,

        -- numerics
        l_quantity as quantity,
        l_extendedprice as extendedprice,
        l_discount as discount,
        l_tax as tax,

        -- dates
        l_shipdate as shipdate,
        l_commitdate as commitdate,
        l_receiptdate as receiptdate
    from source
)
select * from renamed
