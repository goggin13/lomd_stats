psql -Ugoggin lomd -c "truncate box_scores"
psql -Ugoggin lomd -c "\copy box_scores(week_id, team_id, player_id, position, points, projected_points, pro_pos_rank, game_played) FROM 'data/box_scores.csv' DELIMITER ',';"

psql -Ugoggin lomd -c "truncate team_box_scores"
psql -Ugoggin lomd -c "\copy team_box_scores(week_id, winning_team_id, winning_score, losing_team_id, losing_score, playoff, matchup_type) FROM 'data/team_box_scores.csv' DELIMITER ',';"
