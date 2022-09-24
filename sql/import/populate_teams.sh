psql -Ugoggin lomd -c "truncate teams"
psql -Ugoggin lomd -c "\copy teams(id, name, owner) FROM 'data/teams.csv' DELIMITER ',';"
