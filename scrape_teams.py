import league_utils
import os
import csv

league = league_utils.get_league()

data = []
for team in league.teams:
    data.append([
        team.team_id,
        team.team_name,
        team.owner,
        team.standing,
        team.final_standing,
        team.points_for,
        team.points_against,
        team.acquisitions,
        team.drops,
        team.trades,
        team.wins,
        team.losses
        ])

league_utils.write_data("teams.csv", data)
