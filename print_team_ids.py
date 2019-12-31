from ff_espn_api import League
import os

swid = os.popen('cat .swid').read().rstrip()
espn_s2 = os.popen('cat .espn_s2').read().rstrip()

years = range(2012, 2019)
teams = {}

for year in years:
    league = League(league_id=736036, year=year, swid=swid, espn_s2=espn_s2)
    for team in league.teams:
        aliases = teams.get(team.team_id, [])
        aliases.append(team.team_name)
        teams[team.team_id] = aliases

for team_id, aliases in teams.items():
    print(team_id, aliases)
