
/*Group Dimension:

group_id (Primary Key): Unique identifier for each group.
city: Name of the city where the group resides.
created: Timestamp of when the group was created.
description: Description of the group.
name: Name of the group.
lat: Latitude of the place where the group resides.
lon: Longitude of the place where the group resides.
link: Link to the group's homepage.
topics: Array of topics that this group discusses or associates with.*/

with usergroups as (
    select * from {{ref('stage_groups')}}
),
final as
(select  
group_id,
city,
TIMESTAMP_MILLIS(created) AS created,
description,
name,
lat,
lon,
link,
topics
from usergroups)

select * from final