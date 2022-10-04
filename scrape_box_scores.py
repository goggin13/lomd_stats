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
        if (box_score.home_team == 0) or (box_score.away_team == 0):
            print("skipping bye: ", box_score)
            continue

        home_team_id = box_score.home_team.team_id
        for slot in box_score.home_lineup:
            data.append([
                week,
                home_team_id,
                slot.playerId,
                slot.slot_position,
                slot.points,
                slot.projected_points,
                slot.pro_pos_rank,
                slot.game_played,
                box_score.is_playoff])

        away_team_id = box_score.away_team.team_id
        for slot in box_score.away_lineup:
            data.append([
                week,
                away_team_id,
                slot.playerId,
                slot.slot_position,
                slot.points,
                slot.projected_points,
                slot.pro_pos_rank,
                slot.game_played,
                box_score.is_playoff])


        row = [week]
        if box_score.home_score > box_score.away_score:
            row += [home_team_id, box_score.home_score, away_team_id, box_score.away_score]
        else:
            row += [away_team_id, box_score.away_score, home_team_id, box_score.home_score]

        row += [box_score.is_playoff, box_score.matchup_type]
        team_data.append(row)


league_utils.write_data("box_scores.csv", data)
league_utils.write_data("team_box_scores.csv", team_data)
