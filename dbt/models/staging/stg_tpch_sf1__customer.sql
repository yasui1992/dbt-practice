with
source as (
    select * from {{ source('tpch_sf1', 'customer') }}
),
renamed as (
    select
        -- pkeys
        c_custkey as custkey,
        -- fkeys
        c_nationkey as nationkey,
        -- strings
        c_name as "name",
        c_address as "address",
        c_phone as phone,
        c_mktsegment as mktsegment,
        c_comment as comment,
        -- numerics
        c_acctbal as acctbal,
    from source
)
select * from renamed
