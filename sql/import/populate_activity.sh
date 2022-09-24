psql -Ugoggin lomd -c "truncate activity"
psql -Ugoggin lomd -c "\copy activity(date, team_id, action, player_id, bid_amount) FROM 'data/recent_activity.csv' DELIMITER ',';"
