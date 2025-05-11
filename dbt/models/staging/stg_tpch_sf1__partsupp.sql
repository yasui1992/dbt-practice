with
source as (
    select * from {{ source('tpch_sf1', 'partsupp') }}
),
renamed as (
    select
        -- primary keys
        ps_partkey as partkey,
        ps_suppkey as suppkey,

        -- strings
        ps_comment as comment,

        -- numerics
        ps_availqty as availqty,
        ps_supplycost as supplycost,
        from source
)
select * from renamed
