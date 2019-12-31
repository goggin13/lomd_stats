from ff_espn_api import League
import os

swid = os.popen('cat .swid').read().rstrip()
espn_s2 = os.popen('cat .espn_s2').read().rstrip()

team_ids = {
        1: "Jake",
        2: "Greg",
        3: "Goggin",
        4: "JR",
        5: "Landon",
        6: "Feldman", # Joel if year = 2017
        7: "Kelly",
        8: "Kristen",
        9: "Aidan",
        10: "Eric",  # Coon if year = 2014
        11: "Alex",
        12: "Dan S",
        13: "Mike",
        14: "Holly",
        15: "Hubbs",
        16: "Olivia",
        17: "Pat"
}

def team_name(team_id, year):
    if team_id == "6" and year == "2017":
        return "Joel"
    elif team_id == "9" and year == "2014":
        return "Coon"
    else:
        return team_ids.get(team_id)


# years = range(2012, 2020)
years = [2019]

for year in years:
    league = League(league_id=736036, year=year, swid=swid, espn_s2=espn_s2)
    for week in range(1, 13):
        scores = league.scoreboard(week)
        if scores == []:
            break
        high_score = 0
        high_score_team = -1
        low_score = 999
        low_score_team = -1
        for score in scores:
            if score.home_team == 0 or score.away_team == 0:
                continue
            if score.home_score > high_score:
                high_score = score.home_score
                high_score_team = score.home_team.team_id
            if score.home_score < low_score:
                low_score = score.home_score
                low_score_team = score.home_team.team_id
            if score.away_score > high_score:
                high_score = score.away_score
                high_score_team = score.away_team.team_id
            if score.away_score < low_score:
                low_score = score.away_score
                low_score_team = score.away_team.team_id
        print("%s,%s,%s,%s,%s,%s" % (year, week, team_name(low_score_team, year), low_score, team_name(high_score_team, year), high_score))
