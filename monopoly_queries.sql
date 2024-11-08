--
-- This SQL script implements sample queries on the Monopoly database.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Get the number of Game records.
SELECT *
  FROM Game
  ;

-- Get the player records.
SELECT * 
  FROM Player
  ;

-- Get all the users with Calvin email addresses.
SELECT *
  FROM Player
 WHERE emailAddress LIKE '%calvin%'
 ;

-- Get the highest score ever recorded.
  SELECT score
    FROM PlayerGame
ORDER BY score DESC
   LIMIT 1
   ;

-- Get the cross-product of all the tables.
SELECT *
  FROM Player, PlayerGame, Game
  ;


-- Exercise 8.1

-- a. Retrieve a list of all the games, ordered by date with the most recent game coming first.
SELECT ID
FROM Game
ORDER BY time ASC;

-- b. Retrieve all the games that occurred in the past week.
SELECT ID
FROM Game
WHERE time > '2024-11-2';

-- c. Retrieve a list of players who have (non-NULL) names.
SELECT Player.name
FROM Player
WHERE Player.name IS NOT NULL;

-- d. Retrieve a list of IDs for players who have some game score larger than 2000.
SELECT Player.name
FROM Player, PlayerGame
WHERE Player.ID = PlayerGame.playerID AND PlayerGame.score > 2000;

-- e. Retrieve a list of players who have GMail accounts.
SELECT Player.name 
FROM Player
WHERE Player.emailAddress LIKE '%gmail.com'

-- Exercise 8.2

-- a. Retrieve all “The King”’s game scores in decreasing order.
SELECT PlayerGame.score
FROM PlayerGame, Player
WHERE PlayerGame.playerID = Player.ID AND Player.name = 'The King'
ORDER BY score DESC;

-- b. Retrieve the name of the winner of the game played on 2006-06-28 13:20:00.
SELECT Player.name
FROM Player, Game, PlayerGame
WHERE Game.time = '2006-06-28 13:20:00'
    AND PlayerGame.gameID = Game.ID
    AND PlayerGame.score = MAX(PlayerGame.score)

-- c. So what does that P1.ID < P2.ID clause do in the last example query (i.e., the from SQL Examples)?
-- One possible combination with just one, to avoid different players with same name

-- d.The query that joined the Player table to itself seems rather contrived. Can you think of a realistic situation in which you’d want to join a table to itself?
-- Comparing two different attributes of the same table