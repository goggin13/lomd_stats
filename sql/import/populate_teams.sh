psql -Ugoggin lomd -c "delete from teams where season = $YEAR"
psql -Ugoggin lomd -c "\copy teams(season, id, name, owner) FROM 'data/teams.csv' DELIMITER ',';"
