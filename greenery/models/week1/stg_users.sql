{{
  config(
    materialized='incremental',
    unique_key='user_id'
  )
}}

with user_src as (
    select * from {{ source('greenery', 'users') }}
)
, renamed_casted as (
    SELECT 
    user_id,
    address_id,
    first_name,
    last_name,
    email,
    phone_number,
    created_at,
    updated_at,
    dbt_scd_id,
    dbt_updated_at,
    dbt_valid_from,
    dbt_valid_to

FROM user_src
)

select * from renamed_casted

