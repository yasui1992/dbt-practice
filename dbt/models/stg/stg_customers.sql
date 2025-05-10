SELECT *
FROM {{ source('lake', 'customer') }}
