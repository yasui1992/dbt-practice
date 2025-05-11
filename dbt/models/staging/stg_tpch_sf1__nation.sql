with
source as (
    select * from {{ source('tpch_sf1', 'nation') }}
),
renamed as (
    select
        -- primary key
        n_nationkey as nation_key,

        -- foreign key
        n_regionkey as region_key,

        -- strings
        n_name as "name",
        n_comment as comment
    from source
)
select * from renamed
