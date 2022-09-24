set -e

python3 scrape_teams.py
./sql/import/populate_teams.sh

python3 scrape_activity.py
./sql/import/populate_activity.sh

python3 scrape_box_scores.py
./sql/import/populate_box_scores.sh

python3 scrape_draft.py
./sql/import/populate_draft.sh

./sql/import/populate_players.sh
