{{
  config(
    materialized='view'
  )
}}

with events_source as (
    select *
    from {{ source('greenery', 'events') }}
)

, renamed_events as (
    select
    id                        as user_id
    , event_id
    , session_id
    , user_id                 as user_guid
    , page_url
    , created_at              as created_at_utc
    , event_type

    from events_source
)

select * from renamed_events
