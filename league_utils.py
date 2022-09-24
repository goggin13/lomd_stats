from espn_api.football import League
import csv
import os

swid = os.popen('cat .swid').read().rstrip()
espn_s2 = os.popen('cat .espn_s2').read().rstrip()


year = os.getenv('YEAR') or 2022
print("Year:", year)

def get_league():
    return League(league_id=736036, year=year, swid=swid, espn_s2=espn_s2)

def write_data(file_name, data):
    f = open('data/' + file_name, 'w')

    writer = csv.writer(f)
    for d in data:
        writer.writerow(d)

    f.close()

PLAYER_DATA_DICT = {}
def add_player_info(player):
    player_data = [player.playerId, player.name, player.position]
    PLAYER_DATA_DICT[str(player.playerId)] = player_data

def write_player_info():
    with open('data/players.csv') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            PLAYER_DATA_DICT[row[0]] = row

    write_data('players.csv', PLAYER_DATA_DICT.values())
