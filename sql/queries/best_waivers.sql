select
  A.season,
  T.owner,
  A.bid_amount as bid,
  A.action,
  to_char(A.date, 'MM/DD') as date,
  P.name,
  P.position,
  (select coalesce(sum(points), 0)
   from box_scores B
   where B.team_id = T.id
         and B.player_id = A.player_id) as points
from teams T
inner join activity A on
  A.team_id = T.id
  AND A.action != 'DROPPED'
  AND A.action != 'TRADED'
inner join players P on
  A.player_id = P.id
order by 8 DESC
limit 10;
