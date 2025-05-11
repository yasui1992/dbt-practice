with
source as (
    select * from {{ source('tpch_sf1', 'part') }}
),
renamed as (
    select
        -- primary key
        p_partkey as partkey,

        -- strings
        p_name as "name",
        p_mfgr as mfgr,
        p_brand as brand,
        p_type as type,
        p_container as container,
        p_comment as comment,

        -- numerics
        p_size as "size",
        p_retailprice as retailprice
    from source
)
select * from renamed
