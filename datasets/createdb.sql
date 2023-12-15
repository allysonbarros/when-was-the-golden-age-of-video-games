DROP TABLE IF EXISTS game_sales;

CREATE TABLE IF NOT EXISTS game_sales (
  game VARCHAR(100) PRIMARY KEY,
  platform VARCHAR(64),
  publisher VARCHAR(64),
  developer VARCHAR(64),
  games_sold NUMERIC(5, 2),
  year INT
);

DROP TABLE IF EXISTS reviews;

CREATE TABLE IF NOT EXISTS reviews (
    game VARCHAR(100) PRIMARY KEY,
    critic_score NUMERIC(4, 2),   
    user_score NUMERIC(4, 2)
);

DROP TABLE IF EXISTS top_critic_years;

CREATE TABLE IF NOT EXISTS top_critic_years (
    year INT PRIMARY KEY,
    avg_critic_score NUMERIC(4, 2)  
);

DROP TABLE IF EXISTS top_critic_years_more_than_four_games;

CREATE TABLE IF NOT EXISTS top_critic_years_more_than_four_games (
    year INT PRIMARY KEY,
    num_games INT,
    avg_critic_score NUMERIC(4, 2)  
);

DROP TABLE IF EXISTS top_user_years_more_than_four_games;

CREATE TABLE IF NOT EXISTS top_user_years_more_than_four_games (
    year INT PRIMARY KEY,
    num_games INT,
    avg_user_score NUMERIC(4, 2)  
);

\copy game_sales FROM '/tmp/datasets/game_sales.csv' DELIMITER ',' CSV HEADER;
\copy reviews FROM '/tmp/datasets/game_reviews.csv' DELIMITER ',' CSV HEADER;
\copy top_critic_years FROM '/tmp/datasets/top_critic_scores.csv' DELIMITER ',' CSV HEADER;
\copy top_critic_years_more_than_four_games FROM '/tmp/datasets/top_critic_scores_more_than_four_games.csv' DELIMITER ',' CSV HEADER;
\copy top_user_years_more_than_four_games FROM '/tmp/datasets/top_user_scores_more_than_four_games.csv' DELIMITER ',' CSV HEADER;