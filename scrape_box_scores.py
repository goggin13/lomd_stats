import league_utils
import os
import datetime

league = league_utils.get_league()
current_week = os.getenv('CURRENT_WEEK') or 2
current_week = int(current_week)
print("box scores week", 1, "to", current_week)

"""
https://github.com/cwendt94/espn-api/wiki/Box-Score-Class
https://github.com/cwendt94/espn-api/wiki/Box-Player-Class
"""
data = []
team_data = []
for week in range(1, current_week + 1):
    print("Downloading box scores for week", week)
    box_scores = league.box_scores(week)
    print("Found", len(box_scores), "scores")
    for box_score in box_scores:
        home_team_id = box_score.home_team.team_id
        for slot in box_score.home_lineup:
            player_id = slot.playerId
            points = slot.points
            position = slot.position
            data.append([week, home_team_id, player_id, position, points])

        away_team_id = box_score.away_team.team_id
        for slot in box_score.away_lineup:
            player_id = slot.playerId
            points = slot.points
            position = slot.position
            data.append([week, away_team_id, player_id, position, points])


        row = None
        if box_score.home_score > box_score.away_score:
            row = [week, home_team_id, box_score.home_score, away_team_id, box_score.away_score]
        else:
            row = [week, away_team_id, box_score.away_score, home_team_id, box_score.home_score]

        team_data.append(row)


league_utils.write_data("box_scores.csv", data)
league_utils.write_data("team_box_scores.csv", team_data)
