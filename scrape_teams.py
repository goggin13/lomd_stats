import league_utils
import os
import csv

league = league_utils.get_league()

data = []
for team in league.teams:
    data.append([team.team_id, team.team_name, team.owner])

league_utils.write_data("teams.csv", data)
