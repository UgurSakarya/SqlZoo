-- Q1. Modify it to show the matchid and player name for all goals scored by Germany. To identify German players,
-- 	check for: teamid = 'GER'

SELECT matchid, player FROM goal
WHERE teamid = 'GER';

-- Q2. Show id, stadium, team1, team2 for just game 1012

SELECT id, stadium, team1, team2 FROM game
WHERE id = 1012;

-- Q3. Modify it to show the player, teamid, stadium and mdate for every German goal.
  -- You can combine the two steps into a single query with a JOIN. 
  -- SELECT *
  --  FROM game JOIN goal ON (id=matchid)
  -- The FROM clause says to merge data from the goal table with that from the game table. The ON says how to figure out which rows
	-- in game 
  -- go with which rows in goal - the matchid from goal must match id from game. 
  -- (If we wanted to be more clear/specific we could say 

SELECT player, teamid, game.stadium, game.mdate FROM goal
JOIN game ON (id = matchid)
Where teamid = 'GER';

-- Q4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'

SELECT game.team1, game.team2, player FROM goal
JOIN game ON (id = matchid)
WHERE player LIKE 'Mario%';

-- Q5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

SELECT player, teamid, eteam.coach, gtime FROM goal
JOIN eteam ON eteam.id = goal.teamid
WHERE gtime <= 10;

-- Q6. List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

SELECT mdate, eteam.teamname from game
JOIN eteam on game.team1 = eteam.id
WHERE eteam.coach = 'Fernando Santos';

-- Q7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

SELECT player FROM goal
JOIN game on goal.matchid = game.id
WHERE stadium = 'National Stadium, Warsaw';

-- Q8. Instead show the name of all players who scored a goal against Germany.

SELECT DISTINCT player from goal
JOIN game ON goal.matchid = game.id
WHERE (team1 = 'GER' OR team2 = 'GER')
AND goal.teamid <> 'GER';

-- Q9. Show teamname and the total number of goals scored.

SELECT teamname, COUNT(*) FROM eteam
JOIN goal ON eteam.id = goal.teamid
GROUP BY teamname;

-- Q10. Show the stadium and the number of goals scored in each stadium. 

SELECT stadium, COUNT(goal.player)
FROM game JOIN goal ON game.id = goal.matchid
GROUP BY stadium;

-- Q11. For every match involving 'POL', show the matchid, date and the number of goals scored.

SELECT matchid, mdate, count(player) FROM game 
JOIN goal ON game.id = goal.matchid
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate;

-- Q12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

SELECT matchid, mdate, COUNT(player) FROM game
JOIN goal ON game.id = goal.matchid
WHERE teamid = 'GER'
GROUP BY matchid, mdate;

-- Q13. List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in 
-- any previous exercises.

SELECT mdate, 
 team1,
 SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
 team2,
 SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game LEFT JOIN goal ON (id=matchid)
GROUP BY mdate, matchid, team1, team2
ORDER BY mdate, matchid, team1, team2;


