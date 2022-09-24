psql -Ugoggin lomd -c "delete from draft where season = $YEAR"
psql -Ugoggin lomd -c "\copy draft(season, round_number, round_pick, team_id, player_id) FROM 'data/draft.csv' DELIMITER ',';"
