with source as (
    select * from {{ source('meetup', 'groups') }}
),

 stage_groups as 
(
select 
group_id,
city,
created,
description,
name,
lat,
lon,
link,
topics 
from source
)

select * from stage_groups