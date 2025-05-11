with
source as (
    select * from {{ source('tpch_sf1', 'supplier') }}
),
renamed as (
    select
        -- primary key
        s_suppkey as suppkey,

        -- strings
        s_name as "name",
        s_address as "address",
        s_phone as phone,
        s_comment as comment,

        -- foreign key
        s_nationkey as nationkey,

        -- numerics
        s_acctbal as acctbal
    from source
)
select * from renamed
