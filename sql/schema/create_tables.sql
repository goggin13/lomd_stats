DROP TABLE IF EXISTS teams;
CREATE TABLE teams (
  season INTEGER,
  id INTEGER,
  name VARCHAR(50),
  owner VARCHAR(50),
  standing INTEGER,
  final_standing INTEGER,
  points_for REAL,
  points_against REAL,
  acquisitions INTEGER,
  drops INTEGER,
  trades INTEGER,
  wins INTEGER,
  losses INTEGER,
  PRIMARY KEY (season, id)
);

DROP TABLE IF EXISTS activity;
CREATE TABLE activity (
  season INTEGER,
  date TIMESTAMP,
  team_id INTEGER,
  action VARCHAR(50),
  player_id BIGINT,
  bid_amount INTEGER,
  PRIMARY KEY (date, team_id, player_id)
);

DROP TABLE IF EXISTS players;
CREATE TABLE players (
  id BIGINT,
  name VARCHAR(50),
  position VARCHAR(5),
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS draft;
CREATE TABLE draft (
  season INTEGER,
  round_number INTEGER,
  round_pick INTEGER,
  team_id INTEGER,
  player_id BIGINT,
  PRIMARY KEY (season, round_number, round_pick)
);

DROP TABLE IF EXISTS box_scores;
CREATE TABLE box_scores (
  season INTEGER,
  week_id INTEGER,
  team_id INTEGER,
  player_id BIGINT,
  position VARCHAR(10),
  points REAL,
  projected_points REAL,
  pro_pos_rank INTEGER,
  game_played INTEGER, -- 0 (not played/playing) or 100 (finished game)
  playoff BOOLEAN,
  PRIMARY KEY(season, week_id, team_id, player_id)
);

DROP TABLE IF EXISTS team_box_scores;
CREATE TABLE team_box_scores (
  season INTEGER,
  week_id INTEGER,
  winning_team_id INTEGER,
  winning_score REAL,
  losing_team_id INTEGER,
  losing_score REAL,
  playoff BOOLEAN,
  matchup_type VARCHAR(50),
  PRIMARY KEY(season, week_id, winning_team_id)
);
