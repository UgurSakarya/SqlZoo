 -- Q1. List the films where the yr is 1962 [Show id, title] 
SELECT id, title
	FROM movie
	WHERE yr=1962;
 
 -- Q2. When was Citizen Kane released? Give year of 'Citizen Kane'. 
SELECT yr
	From movie
	WHERE title = 'Citizen Kane';
 
 -- Q3. List all of the Star Trek movies, include the id, title and yr 
 -- (all of these movies include the words Star Trek in the title). Order results by year. 
SELECT id, title, yr
	FROM movie
	WHERE title LIKE '%Star Trek%';
	
 --Q4. What id number does the actor 'Glenn Close' have? 
SELECT id
  FROM actor
  WHERE name = 'Glenn Close';
	
 -- Q5. What is the id of the film 'Casablanca'?
SELECT id
	FROM movie
	WHERE title = 'Casablanca';
	
 -- Q6. Obtain the cast list for 'Casablanca'. Use movieid=11768, (or whatever value you got from the previous question)
SELECT name
	FROM actor JOIN casting ON  actor.id = casting.actorid
	WHERE movieid = 11768;

 -- Q7. Obtain the cast list for the film 'Alien' 
SELECT name
	FROM actor JOIN casting ON actor.id = casting.actorid
	JOIN movie ON casting.movieid = movie.id
	WHERE title = 'Alien';
	
 -- Q8. List the films in which 'Harrison Ford' has appeared
SELECT title
	FROM movie JOIN casting ON movie.id = casting.movieid
	JOIN actor ON casting.actorid = actor.id
	WHERE name = 'Harrison Ford';
	
 -- Q9. List the films where 'Harrison Ford' has appeared - but not in the starring role. 
 -- [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
SELECT title
	FROM movie JOIN casting ON movie.id = casting.movieid
	JOIN actor ON casting.actorid = actor.id
	WHERE (name = 'Harrison Ford' AND ord <> 1);
	
 -- Q10. List the films together with the leading star for all 1962 films. 
SELECT title, actor.name
	FROM movie JOIN casting ON movie.id = casting.movieid
	JOIN actor ON casting.actorid = actor.id
	WHERE (yr=1962 AND ord = 1);
 
 -- Q11. Which were the busiest years for 'John Travolta', 
 -- show the year and the number of movies he made each year for any year in which he made more than 2 movies.

	
	

