select
  LT.id,
  LT.owner,
  count(*)
from team_box_scores TBS
inner join teams WT on
  TBS.winning_team_id = WT.id
  AND TBS.season = WT.season
inner join teams LT on
  TBS.losing_team_id = LT.id
  AND TBS.season = LT.season
where NOT TBS.playoff
      AND TBS.season != 2022
      AND losing_score > (select
                      avg((winning_score + losing_score) / 2.0)
                    from team_box_scores
                    where week_id = TBS.week_id
                          and season = TBS.season
                    group by week_id)
group by 1, 2
having count(*) > 3
order by 3 desc
;

