psql -Ugoggin lomd -c "delete from activity where season = $YEAR"
psql -Ugoggin lomd -c "\copy activity(season, date, team_id, action, player_id, bid_amount) FROM 'data/recent_activity.csv' DELIMITER ',';"
