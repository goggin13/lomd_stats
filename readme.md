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
YEAR=2022 CURRENT_WEEK=2 ./main.sh
YEAR=2021 CURRENT_WEEK=17 ./main.sh
YEAR=2020 CURRENT_WEEK=17 ./main.sh
YEAR=2019 CURRENT_WEEK=16 ./main.sh


# ToDo
- ignore all playoff data?
- "Id be interested in points of waiver pick ups in starting lineups."
- data plotlines from current season
- backup strategy
- Aidan + Mike team id collision (only an issue when combining old seasons with 2022 season)

X Add Seasons so it can run year to year
X standings_table
