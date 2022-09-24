psql -Ugoggin lomd -c "truncate players"
psql -Ugoggin lomd -c "\copy players(id, name, position) FROM 'data/players.csv' DELIMITER ',';"
