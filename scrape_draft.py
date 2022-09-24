import league_utils
import os
import datetime

league = league_utils.get_league()

"""
https://github.com/cwendt94/espn-api/wiki/Pick-Class
"""
data = []
for pick in league.draft:
        team_id = pick.team.team_id
        round_number = pick.round_num
        round_pick = pick.round_pick
        player_id = pick.playerId
        player = league.player_info(playerId=player_id)
        league_utils.add_player_info(player)

        print(round_number, round_pick)
        data.append([round_number, round_pick, team_id, player_id])

league_utils.write_data("draft.csv", data)
league_utils.write_player_info()
