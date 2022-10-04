SELECT
 Q.owner,
 sum(Q.diff),
count(*)
from
(

select
  A.season,
  B.week_id,
  T.owner,
  T.standing,
  T.final_standing,
  P.name,
  P.position,
  B.points,

  trunc((select avg(points) from box_scores where position = P.position and season = A.season)::numeric, 2) as league_avg,

  trunc(
    (
      sum(B.points) / count(*)
      -
      (select avg(points) from box_scores where position = P.position and season = A.season)
    )::numeric,
    2) as diff,

  count(*) as starts

from teams T
inner join (select distinct team_id, season, player_id
            from activity
            where action = 'FA ADDED'
                  or action = 'WAIVER ADDED') A ON
  A.team_id = T.id
  AND A.season = T.season
inner join box_scores B on
  B.team_id = T.id
  and B.player_id = A.player_id
  and not B.playoff
  and B.season = A.season
  and B.position != 'BE'
  and B.position != 'DP'
inner join players P on
  A.player_id = P.id
  AND B.player_id = P.id

group by 1, 2, 3, 4, 5, 6, 7, 8, 9
order by 1,2 ASC

) as Q

GROUP BY 1
ORDER BY 2 DESC
