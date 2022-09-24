psql -Ugoggin lomd -c "truncate box_scores"
psql -Ugoggin lomd -c "\copy box_scores(week_id, team_id, player_id, position, points) FROM 'data/box_scores.csv' DELIMITER ',';"

psql -Ugoggin lomd -c "truncate team_box_scores"
psql -Ugoggin lomd -c "\copy team_box_scores(week_id, winning_team_id, winning_score, losing_team_id, losing_score) FROM 'data/team_box_scores.csv' DELIMITER ',';"
