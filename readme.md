pip3 install espn_api
python3 scrape_waivers.py

# initial PG Setup
brew services start postgresql

~/.pgpass
*:5432:*:postgres:[password]
*:5432:*:goggin:[password]

chmod 0600 ~/.pgpass

psql -Upostgres -a -f sql/schema/create_db_and_user.sql
psql -Ugoggin lomd -a -f sql/schema/create_tables.sql

# Running scripts
brew services start postgresql
./main.sh

# ToDo
- Add Seasons so it can run year to year
