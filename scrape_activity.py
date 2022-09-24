import league_utils
import os
import datetime

league = league_utils.get_league()

size = os.getenv('SIZE') or 1000
print("fetching (", size, ") recent activity...")
recent_activity = league.recent_activity(size=size)
print("found " + str(len(recent_activity)) + " items")

"""
https://github.com/cwendt94/espn-api/wiki/Activity-Class

date: int # Epoch time milliseconds
actions: List[Tuple]
             (team: Team Class, action: str, player: Player Class, bid_amount: int)
"""
data = []
player_data = []
for activity in recent_activity:
    seconds_since_epoch = activity.date / 1000
    date = datetime.datetime.utcfromtimestamp(seconds_since_epoch).isoformat()
    for action in activity.actions:
        team = action[0].team_id
        description = action[1]
        player = action[2]
        bid = action[3]
        league_utils.add_player_info(player)
        data.append([date, team, description, player.playerId, bid])

league_utils.write_data("recent_activity.csv", data)
league_utils.write_player_info()
