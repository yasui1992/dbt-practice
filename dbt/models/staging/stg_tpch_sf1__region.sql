with
source as (
    select * from {{ source('tpch_sf1', 'region') }}
),
renamed as (
    select
        -- primary key
        r_regionkey as regionkey,

        -- strings
        r_name as "name",
        r_comment as comment
    from source
)
select * from renamed
