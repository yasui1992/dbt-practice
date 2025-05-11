with
source as (
    select * from {{ source('tpch_sf1', 'part') }}
),
renamed as (
    select
        -- primary key
        p_partkey as part_key,

        -- strings
        p_name as name,
        p_mfgr as manufacturer,
        p_brand as brand,
        p_type as type,
        p_container as container,
        p_comment as comment,

        -- numerics
        p_size as size,
        p_retailprice as retail_price
    from source
)
select * from renamed
