select
  TBS.week_id as week,
  TRUNC((select
     avg((winning_score + losing_score) / 2.0)
   from team_box_scores
   where week_id = TBS.week_id
   group by week_id)::numeric, 2) as league_average,
  concat(
    '-',
    TRUNC((select
     avg((winning_score + losing_score) / 2.0) - TBS.winning_score
   from team_box_scores
   where week_id = TBS.week_id
   group by week_id)::numeric, 2)) as diff,
  WT.name as lucky,
  TBS.winning_score as score,
  LT.name as opponent,
  TBS.losing_score as score
from team_box_scores TBS
inner join teams WT on
  TBS.winning_team_id = WT.id
inner join teams LT on
  TBS.losing_team_id = LT.id
where winning_score < (select
                      avg((winning_score + losing_score) / 2.0)
                    from team_box_scores
                    where week_id = TBS.week_id
                    group by week_id)
;
