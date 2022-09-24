psql -Ugoggin lomd -c "truncate draft"
psql -Ugoggin lomd -c "\copy draft(round_number, round_pick, team_id, player_id) FROM 'data/draft.csv' DELIMITER ',';"
