select
  A.season,
  T.owner,
  T.standing,
  T.final_standing,
  -- P.name,
  P.position,
  trunc(
    (sum(B.points) / count(*))::numeric,
    2) as avg_points,
  trunc((select avg(points) from box_scores where position = P.position and season = A.season)::numeric, 2) as league_avg,
  trunc(
    (
      sum(B.points) / count(*)
      -
      (select avg(points) from box_scores where position = P.position and season = A.season)
    )::numeric,
    2) as diff,
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
  -- AND P.position = 'RB'
-- group by 1,2,3,4
-- having count(*) > 5
-- order by 5 DESC

group by 1, 2, 3, 4, 5
having count(*) > 5
order by 8 DESC
