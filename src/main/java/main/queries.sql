
--DONE!!!
--that will store information about each user. (e.g. one row - one user)
CREATE TABLE IF NOT EXISTS users (
  username VARCHAR(50) NOT NULL,
  name VARCHAR(50) NOT NULL,
  age INTEGER,
  CONSTRAINT pk_username PRIMARY KEY (username)
);

--that will store information about the game participants and result (who won) - (e.g. one row - one game)
--player2 must be pcu
CREATE TABLE IF NOT EXISTS games (
  id_games INTEGER AUTO_INCREMENT PRIMARY KEY,
  player1 VARCHAR(50) NOT NULL,
  player2 VARCHAR(50) NOT NULL,
  result VARCHAR(100) NULL,
  foreign key (player1) REFERENCES users(username),
  foreign key (player2) REFERENCES users(username)
  -- I would suggest putting player2 and result as a foreign key on users table (same as player1)
  -- If you want to have second player - PCU - you can actually create this user yourself in a users table. And then always reference it.
  -- Additionally I would put player1, player2 as NOT NULL and result as NULL.
  -- Meaning that result will be either a valid user from users table or NULL, when there is a tie.
);

--that will store information about moves for all the games. (e.g. one row - one move).
--in pcu case player will be null
CREATE TABLE IF NOT EXISTS moves (
  id_moves INTEGER AUTO_INCREMENT PRIMARY KEY,
  player VARCHAR(50),
  game INTEGER,
  position_on_board INTEGER,
  foreign key (player) REFERENCES users(username),
  foreign key (game) REFERENCES games(id_games)
);

-------------------------------------------
--add data about user
INSERT INTO users
(username, name, age) VALUES
(?, ?, ?);

--add moves. Possible numbers from 1-9
INSERT INTO moves
(position_on_board) VALUES
? WHERE player = ? ;

--add results in the game. Possible options - player_win, cpu_win, tie
INSERT INTO games
(result) VALUES
(?);

--insert into game player 1, player 2
INSERT INTO games
(player1, player2) VALUES
(?, ?);

--**********************
--add player in the moves table
INSERT INTO moves (player)
SELECT username
FROM users
WHERE username = ?;


--add pcu as 2nd player
INSERT INTO games (player2)
SELECT username
FROM users
WHERE username = ?
------------------------------------------
--display all existing games
SELECT * FROM games;

--display moves for certain game
SELECT player, position_on_board
FROM moves
WHERE game = ?;

--  search for entered username
SELECT username
FROM users
WHERE username = ?;







