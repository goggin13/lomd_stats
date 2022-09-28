psql -Ugoggin lomd -c "delete from teams where season = $YEAR"
psql -Ugoggin lomd -c "\copy teams(season, id, name, owner) FROM 'data/teams.csv' DELIMITER ',';"

psql -Ugoggin lomd -c "update teams set owner = 'Mike G' where id = 13;"
psql -Ugoggin lomd -c "update teams set owner = 'Aidan' where id = 9;"
psql -Ugoggin lomd -c "update teams set owner = 'Holly' where id = 14;"
psql -Ugoggin lomd -c "update teams set owner = 'Alex C' where id = 11;"
