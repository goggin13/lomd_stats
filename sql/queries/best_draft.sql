select
  D.season,
  T.owner,
  D.round_number,
  D.round_pick,
  P.position,
  P.name,
  (select coalesce(sum(points), 0)
   from box_scores B
   where B.team_id = T.id
         and B.player_id = D.player_id
         and not B.playoff
         and B.season = T.season) as points
from teams T
inner join draft D on
  D.team_id = T.id
  AND D.season = T.season
inner join players P on
  D.player_id = P.id
-- where D.round_number = 1
order by 7 DESC
