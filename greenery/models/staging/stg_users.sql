{{
  config(
    materialized='view',
    unique_key='user_id'
  )
}}

with user_src as (
    select * from {{ source('greenery', 'users') }}
)
, renamed_users as 
(
    select 
    id                         as user_id    
    , user_id                  as user_guid     
    , address_id               as address_guid
    , first_name
    , last_name
    , email
    , phone_number
    , created_at               as created_at_utc 
    , updated_at               as updated_at_utc
      
from user_src
)


select * from renamed_users
