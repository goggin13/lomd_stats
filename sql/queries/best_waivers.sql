select
  T.owner,
  -- A.season,
  -- P.name,
  -- P.position,
  trunc((coalesce(sum(B.points), 0) / count(*))::numeric, 2) as avg_points,
  count(*) as games_played
from teams T
inner join activity A on
  A.team_id = T.id
  AND A.season = T.season
  AND A.action != 'DROPPED'
  AND A.action != 'TRADED'
inner join box_scores B on
  B.team_id = T.id
  and B.player_id = A.player_id
  and not B.playoff
  and B.season = A.season
inner join players P on
  A.player_id = P.id
  --AND P.position = 'D/ST'
  AND P.position != 'QB'
-- group by 1,2,3,4
-- having count(*) > 5
-- order by 5 DESC

group by 1
having count(*) > 5
order by 2 DESC
