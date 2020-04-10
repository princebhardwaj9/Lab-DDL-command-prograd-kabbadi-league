-- PROGRESSION - 1


-- 1. **Create table city**
CREATE TABLE city (id INT PRIMARY KEY, name VARCHAR(50) NOT NULL);

-- 2. **Create table referee**
CREATE TABLE referee (id INT PRIMARY KEY, name VARCHAR(50) NOT NULL);

-- 3. **Create table innings**
CREATE TABLE innings (id INT PRIMARY KEY, innings_number INT NOT NULL);

-- 4. **Create table extra_type**
CREATE TABLE extra_type (id INT PRIMARY KEY, name VARCHAR(50) NOT NULL);

-- 5. **Create table skill**
CREATE TABLE skill (id INT PRIMARY KEY, name VARCHAR(50) NOT NULL);

-- 6. **Create table team**
CREATE TABLE team (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  coach VARCHAR(50) NOT NULL,
  home_city INT NOT NULL,
  captain INT NOT NULL
  --CONSTRAINT for_key FOREIGN KEY (home_city) REFERENCES city(id)
);

-- 7. **Create table player**
CREATE TABLE player(
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
  skill_id INT,
  team_id INT,
  --CONSTRAINT fk1 FOREIGN KEY (skill_id) REFERENCES skill(id),
  CONSTRAINT fk2 FOREIGN KEY (team_id) REFERENCES team(id)
);

-- 8. **Create table venue**
CREATE TABLE venue(
  id INT PRIMARY KEY,
  stadium_name VARCHAR(50) NOT NULL,
  city_id INT
  --CONSTRAINT fk_venue FOREIGN KEY (city_id) REFERENCES city(id)
);

-- 9. **Create table event**
CREATE TABLE event(
  id INT PRIMARY KEY,
  innings_id INT NOT NULL,
  event_no INT,
  raider_id INT,
  raid_points INT,
  defending_points INT,
  clock_in_seconds INT,
  team_one_score INT,
  team_two_score INT,
  --CONSTRAINT fk_innings FOREIGN KEY (innings_id) REFERENCES innings(id),
  CONSTRAINT fk_raider FOREIGN KEY (raider_id) REFERENCES player(id)
);

-- 10. **Create table extra_event**
CREATE TABLE extra_event(
  id INT PRIMARY KEY,
  event_id INT NOT NULL,
  extra_type_id INT,
  points INT,
  scoring_team_id INT,
  CONSTRAINT fk_event_id FOREIGN KEY (event_id) REFERENCES event(id),
  --CONSTRAINT fk_extra_type FOREIGN KEY (extra_type_id) REFERENCES extra_type(id),
  CONSTRAINT fk_scoring_team_id FOREIGN KEY (scoring_team_id) REFERENCES team(id)
);

-- 11. **Create table outcome**
CREATE TABLE outcome(
  id INT PRIMARY KEY,
  status VARCHAR(100),
  winner_team_id INT,
  score INT,
  player_of_match INT,
  CONSTRAINT fk_winner_team_id FOREIGN KEY (winner_team_id) REFERENCES team(id),
  CONSTRAINT fk_player_of_match FOREIGN KEY (player_of_match) REFERENCES player(id)
);

-- 12. **Create table game**
CREATE TABLE game(
  id INT PRIMARY KEY,
  game_date DATE,
  team_id_1 INT NOT NULL,
  team_id_2 INT NOT NULL,
  venue_id INT NOT NULL,
  outcome_id INT NOT NULL,
  refree_id_1 INT NOT NULL,
  refree_id_2 INT NOT NULL,
  first_innings_id INT NOT NULL,
  second_innings_id INT NOT NULL,
  CONSTRAINT fk_team_id_1 FOREIGN KEY (team_id_1) REFERENCES team(id),
  CONSTRAINT fk_team_id_2 FOREIGN KEY (team_id_2) REFERENCES team(id),
  CONSTRAINT fk_venue_id FOREIGN KEY (venue_id) REFERENCES venue(id),
  CONSTRAINT fk_outcome_id FOREIGN KEY (outcome_id) REFERENCES outcome(id),
  CONSTRAINT fk_refree_id_1 FOREIGN KEY (refree_id_1) REFERENCES referee(id),
  CONSTRAINT fk_refree_id_2 FOREIGN KEY (refree_id_2) REFERENCES referee(id),
  --CONSTRAINT fk_first_innings_id FOREIGN KEY (first_innings_id) REFERENCES innings(id),
  --CONSTRAINT fk_second_innings_id FOREIGN KEY (second_innings_id) REFERENCES innings(id)
);

-- 13. **Drop table city**
DROP TABLE city;

-- 14. **Drop table innings**
DROP TABLE innings;

-- 15. **Drop table skill**
DROP TABLE skill;

-- 16. **Drop table extra_type**
DROP TABLE extra_type;
