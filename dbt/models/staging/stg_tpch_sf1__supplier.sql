with
source as (
    select * from {{ source('tpch_sf1', 'supplier') }}
),
renamed as (
    select
        -- primary key
        s_suppkey as supplier_key,

        -- strings
        s_name as name,
        s_address as address,
        s_phone as phone,
        s_comment as comment,

        -- foreign key
        s_nationkey as nation_key,

        -- numerics
        s_acctbal as account_balance
    from source
)
select * from renamed
