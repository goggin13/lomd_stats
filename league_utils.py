from espn_api.football import League
import csv
import os

swid = os.popen('cat .swid').read().rstrip()
espn_s2 = os.popen('cat .espn_s2').read().rstrip()


year = os.getenv('YEAR') or 2022
year = int(year)
print("Year:", year)

def get_league():
    return League(league_id=736036, year=year, swid=swid, espn_s2=espn_s2)

def write_data(file_name, data, add_year=True):
    f = open('data/' + file_name, 'w')

    writer = csv.writer(f)
    for d in data:
        writer.writerow([year] + d if add_year else d)

    f.close()

PLAYER_DATA_DICT = {}
def add_player_info(player):
    player_data = [player.playerId, player.name, player.position]
    PLAYER_DATA_DICT[str(player.playerId)] = player_data

def write_player_info():
    with open('data/players.csv') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        print("Read", sum(1 for row in csv_reader), "player rows")
        print(len(PLAYER_DATA_DICT.values()), "player rows in memory")
        for row in csv_reader:
            PLAYER_DATA_DICT[row[0]] = row

    print("Writing", len(PLAYER_DATA_DICT.values()), "player rows")
    write_data('players.csv', PLAYER_DATA_DICT.values(), False)
