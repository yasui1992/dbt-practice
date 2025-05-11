with
source as (
    select * from {{ source('tpch_sf1', 'partsupp') }}
),
renamed as (
    select
        -- primary keys
        ps_partkey as part_key,
        ps_suppkey as supplier_key,

        -- numerics
        ps_availqty as available_quantity,
        ps_supplycost as supply_cost,

        -- strings
        ps_comment as comment
    from source
)
select * from renamed
