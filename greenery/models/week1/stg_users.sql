{{
  config(
    materialized='view',
    unique_key='user_id'
  )
}}

with user_src as (
    select * from {{ source('greenery', 'users') }}
)
, renamed_casted as (
    SELECT 
    *

FROM user_src
)

select * from renamed_casted

