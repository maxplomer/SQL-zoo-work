-- http://sqlzoo.net/wiki/SELECT_basics

-- name       continent area  population  gdp
-- Afghanistan   Asia   652230  25500100  20343000000
-- Albania       Europe 28748   2831741   12960000000
-- Algeria       Africa 2381741 37100000  188681000000
-- Andorra       Europe 468     78115     3712000000
-- Angola        Africa 1246700 20609294  100990000000


-- PROBLEM 1: Show the population of Germany
SELECT
  population
FROM
  world
WHERE
  name = 'Germany'

-- PROBLEM 2: Show the name and per capita gdp: gdp/population for each country where the area is over 5,000,000 km2
SELECT
  name, gdp/population
FROM
  world
WHERE
  area > 5000000

-- PROBLEM 3
SELECT
  name, continent
FROM
  world
WHERE
  area < 2000
  AND gdp > 5000000000

-- PROBLEM 4
SELECT
  name, population
FROM
  world
WHERE
  name IN ('Denmark', 'Finland', 'Norway', 'Sweden')

-- PROBLEM 5
SELECT
  name
FROM
  world
WHERE
  name LIKE 'G%'

-- PROBLEM 6
SELECT
  name, area / 1000
FROM
  world
WHERE
  area BETWEEN 200000 AND 250000


--------------------------------------------------
-- http://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial

-- PROBLEM 1
SELECT
  name, continent, population
FROM
  world

-- PROBLEM 2
SELECT
  name
FROM
  world
WHERE
  population>200000000

-- PROBLEM 3
SELECT
  name, gdp/population
FROM
  world
WHERE
  population > 200000000

-- PROBLEM 4
SELECT
  name, population/1000000
FROM
  world
WHERE
  continent = 'South America'

-- PROBLEM 5
SELECT
  name, population
FROM
  world
WHERE
  name IN ('France', 'Germany', 'Italy')

-- PROBLEM 6
SELECT
  name
FROM
  world
WHERE
  name LIKE '%UNITED%'

--------------------------------------------------
-- http://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial

-- PROBLEM 1
SELECT
  yr, subject, winner
FROM
  nobel
WHERE
  yr = 1950

-- PROBLEM 2
SELECT
  winner
FROM
  nobel
WHERE
  yr = 1962
  AND subject = 'Literature'

-- PROBLEM 3
SELECT
  yr, subject
FROM
  nobel
WHERE
  winner = 'Albert Einstein'

-- PROBLEM 4
SELECT
  winner
FROM
  nobel
WHERE
  yr >= 2000
  AND subject = 'Peace'

-- PROBLEM 5
SELECT
  *
FROM
  nobel
WHERE
  subject = 'Literature'
  AND yr BETWEEN 1980 AND 1989

-- PROBLEM 6
SELECT
  *
FROM
  nobel
WHERE
  winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jed Bartlet', 'Jimmy Carter')

-- PROBLEM 7
SELECT
  winner
FROM
  nobel
WHERE
  winner LIKE 'John%'

-- PROBLEM 8
-- incomplete --
SELECT
  yr
FROM
  nobel
WHERE
  subject = 'Physics'

  SELECT
    yr
  FROM
    nobel
  WHERE
    subject != 'Chemistry'

--------------------------------------------
-- http://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

-- PROBLEM 1
SELECT
  name
FROM
  world
WHERE
  population >
  (
  SELECT
    population
  FROM
    world
  WHERE
    name = 'Russia'
  )

-- PROBLEM 2
SELECT
  name
FROM
  world
WHERE
  continent = 'Europe'
  AND gdp/population >
  (
  SELECT
    gdp/population
  FROM
    world
  WHERE
    name = 'United Kingdom'
  )

-- PROBLEM 3
SELECT
  name, continent
FROM
  world
WHERE
  continent IN
  (
  SELECT
    continent
  FROM
    world
  WHERE
    name IN ('Belize', 'Belgium')
  )

-- PROBLEM 4
SELECT
  name, population
FROM
  world
WHERE
  population >
  (
  SELECT
    population
  FROM
    world
  WHERE
    name = 'Canada'
  )
  AND population <
  (
  SELECT
    population
  FROM
    world
  WHERE
    name = 'Poland'
  )

-- PROBLEM 5
SELECT
  name
FROM
  world
WHERE
  gdp >
 (
  SELECT
    max(gdp)
  FROM
    world
  WHERE
    continent = 'Europe'
 )

-- PROBLEM 6
SELECT
  continent, name, area
FROM
  world x
WHERE
  area >= ALL
  (
  SELECT
    area
  FROM
    world y
  WHERE
    y.continent=x.continent
    AND area>0
  )
  AND continent IN('South America', 'North America', 'Asia', 'Eurasia')

-- PROBLEM 7

---INCOMPLETE----
SELECT
  name, continent, population
FROM
  world
WHERE
  continent IN
  (
    SELECT
      continent
    FROM
      world y
    WHERE
      25000000 > SUM(
        SELECT
          population
        FROM
          world x
        WHERE
          x.continent=y.continent
      )
  )


-- PROBLEM 8
----INCOMPLETE----
SELECT

FROM

WHERE

--------------------------------------------
-- http://sqlzoo.net/wiki/SUM_and_COUNT

-- PROBLEM 1
SELECT
  SUM(population)
FROM
  world

-- PROBLEM 2
SELECT
  DISTINCT(continent)
FROM
  world

-- PROBLEM 3
SELECT
  SUM(gdp)
FROM
  world
WHERE
  continent = 'Africa'

-- PROBLEM 4
SELECT
  COUNT(name)
FROM
  world
WHERE
  area > 1000000

-- PROBLEM 5
SELECT
  SUM(population)
FROM
  world
WHERE
  name IN('France', 'Germany', 'Spain')

-- PROBLEM 6
SELECT
  continent, COUNT(name)
FROM
  world
GROUP BY
  continent

-- PROBLEM 7
SELECT
  continent, COUNT(name)
FROM
  world
WHERE
  population > 10000000
GROUP BY
  continent

-- PROBLEM 8: List the continents that have a total population of at least 100 million.
SELECT
  continent
FROM
  world
GROUP BY
  continent
HAVING
  SUM(population) > 100000000

------------------------------------------
-- http://sqlzoo.net/wiki/The_JOIN_operation

-- PROBLEM 1
SELECT
  matchid, player
FROM
  goal
WHERE
  teamid = 'GER'

-- PROBLEM 2
SELECT
  id, stadium, team1, team2
FROM
  game
WHERE
  id = 1012

-- PROBLEM 3
SELECT
  player, teamid, mdate
FROM
  game
JOIN
  goal ON (id=matchid)
WHERE
  teamid = 'GER'

-- PROBLEM 4
SELECT
  team1, team2, player
FROM
  game
JOIN
  goal ON (id=matchid)
WHERE
  player LIKE 'Mario%'

-- PROBLEM 5
SELECT
  player, teamid, coach, gtime
FROM
  goal
JOIN
  eteam on teamid=id
WHERE
  gtime <= 10

-- PROBLEM 6

SELECT
  mdate, teamname
FROM
  game
JOIN
  eteam ON (team1=eteam.id)
WHERE
  coach = 'Fernando Santos'

-- PROBLEM 7

SELECT
player
FROM
goal
JOIN
game ON (matchid=id)
WHERE
stadium = 'National Stadium, Warsaw'

  -- PROBLEM 8

  SELECT
    DISTINCT(player)
  FROM
    game
  JOIN
    goal ON matchid = id
  WHERE
    (team1='GER' OR team2='GER')
    AND teamid != 'GER'


  -- PROBLEM 9

SELECT
  teamname, COUNT(player)
FROM
  eteam
JOIN goal ON id=teamid
GROUP by
   teamname

  -- PROBLEM 10

  SELECT
    stadium, COUNT(player)
  FROM
    game
  JOIN goal ON id=matchid
  GROUP by
     stadium

-- PROBLEM 11 - Attempt 1 - Wrong, check where condition
SELECT
  matchid, mdate, COUNT(player)
FROM
  game
JOIN goal ON id=matchid
WHERE
(teamid = 'POL')
GROUP by
  matchid

-- PROBLEM 11 - Attempt 2 - Correct answer
SELECT
  matchid, mdate, COUNT(player)
FROM
  game
JOIN goal ON id=matchid
WHERE
(team1 = 'POL' OR team2 = 'POL')
GROUP by
  matchid

-- PROBLEM 12
SELECT
matchid, mdate, COUNT(player) AS goals
FROM
game
JOIN goal ON id=matchid
WHERE
teamid='GER'
GROUP BY
matchid

-- PROBLEM 13 -- ATTEMPT 1
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END score1),
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END score2)
FROM game JOIN goal ON matchid = id
GROUP BY
  matchid

-- PROBLEM 13 -- ATTEMPT 2
SELECT mdate,
  team1,
  CASE WHEN teamid=team1 THEN 1 ELSE 0 END score1,
  team2,
  CASE WHEN teamid=team2 THEN 1 ELSE 0 END score2
FROM game JOIN goal ON matchid = id
GROUP BY
  matchid

	-- PROBLEM 13 -- ATTEMPT 3
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM
  game
JOIN
  goal ON matchid = id
GROUP BY
  matchid


	-- PROBLEM 13 -- ATTEMPT 4
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM
  game
JOIN
  goal ON matchid = id
GROUP BY
  matchid
ORDER BY
  mdate

	-- PROBLEM 13 -- ATTEMPT 4 - double zeros not showing up
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game
OUTER JOIN --PROBLEM IS WITH JOIN!???@?@
  goal ON matchid = id
GROUP BY
  matchid
ORDER BY
  mdate


------------------------------------------
-- http://sqlzoo.net/w/index.php/More_JOIN_operations

-- PROBLEM 1
SELECT
	id, title
FROM
	movie
WHERE
	yr = 1962

-- PROBLEM 2

SELECT
	yr
FROM
	movie
WHERE
	title= 'Citizen Kane'

-- PROBLEM 3
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY
	yr

	-- PROBLEM 4
	SELECT title
	FROM movie
	WHERE
	id IN (11768, 11955, 21191)

	--PROBLEM 5
	SELECT id
	FROM actor
	WHERE name = 'Glenn Close'

--	problem 6
SELECT id
FROM movie
WHERE title = 'Casablanca'

--PROBLEM 7
SELECT
	name
FROM
	actor
JOIN
	casting ON id=actorid
WHERE
	movieid=11768

--PROBLEM 8
SELECT name
FROM actor
JOIN casting ON id=actorid
WHERE
	movieid=
	(
		SELECT id
		FROM movie
		WHERE title='Alien'
	)

--PROBLEM 9
SELECT title
FROM movie
JOIN casting ON id=movieid
WHERE actorid=(
	SELECT id
	FROM actor
	WHERE name='Harrison Ford'
)

--PROBLEM 10
SELECT title
FROM movie
JOIN casting ON id=movieid
WHERE actorid=(
	SELECT id
	FROM actor
	WHERE name='Harrison Ford'
) AND ord != 1

--PROBLEM 11  -- attempt 1
SELECT title, actorid
FROM movie
JOIN casting ON id=movieid
WHERE yr=1962 AND ord=1

--PROBLEM 11  -- attempt 2, change actorid to name
SELECT title, name
FROM movie
JOIN casting ON id=movieid
JOIN actor ON actorid=actor.id
WHERE yr=1962 AND ord=1

--PROBLEM 12
SELECT
  yr,COUNT(title)
FROM
  movie
JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE name='John Travolta'
GROUP BY
  yr
HAVING
  COUNT(title)=
	(
	SELECT MAX(c)
	FROM
  (
	 SELECT yr,COUNT(title) AS c
	 FROM
     movie
	 JOIN casting ON movie.id=movieid
   JOIN actor   ON actorid=actor.id
   WHERE name='John Travolta'
   GROUP BY yr
  )
	AS t
)

--PROBLEM 13 -- phase 1


SELECT movieid
FROM casting
WHERE actorid IN
  (
  SELECT id
	FROM actor
  WHERE name='Julie Andrews'
  )


	--PROBLEM 13 -- phase 2

	SELECT title, name
	FROM movie
  JOIN casting ON movie.id=movieid
  JOIN actor   ON actorid=actor.id
  WHERE ord=1 AND movieid IN
	(
	SELECT movieid
	FROM casting
	WHERE actorid IN
	  (
	  SELECT id
		FROM actor
	  WHERE name='Julie Andrews'
	  )
	)


	--PROBLEM 14

	SELECT name
	FROM actor
	JOIN casting ON id=actorid
	WHERE id IN
	(
    SELECT actorid
		FROM casting
		WHERE

	)

	--PROBLEM 14 brainstorm 2

	SELECT name
	FROM actor
	JOIN casting ON id=actorid
	WHERE actorid IN
	(
    SELECT actorid, count(movieid) as c
		FROM casting
		WHERE
		ord=1 AND c > 30
		GROUP BY actorid
	)

--PROBLEM 14 brainstorm 3
--returns a list of actorids and their starring role count



SELECT actorid, count(movieid) AS c
FROM casting
WHERE
ord=1
GROUP BY actorid
----- brainstorm 4

SELECT name
FROM actor
JOIN casting ON id=actorid
JOIN (
	SELECT actorid, count(movieid) AS c
	FROM casting
	WHERE
	ord=1
	GROUP BY actorid
)AS idlist ON casting.actorid=idlist.actorid


---- BRAINSTORM 5
SELECT actorid, count(movieid) AS c
FROM casting
WHERE
ord=1
GROUP BY actorid
HAVING
c > 30

---- BRAINSTORM 6
SELECT name
FROM actor
JOIN casting ON id=actorid
WHERE actorid IN
(
	SELECT actorid
	FROM
	(SELECT actorid, count(movieid) AS c
	FROM casting
	WHERE
	ord=1
	GROUP BY actorid
	HAVING
	c > 30) AS starcount

)
GROUP BY name
ORDER BY name

---- BRAINSTORM 7  -- actually works
SELECT name
FROM actor
JOIN casting ON id=actorid
WHERE actorid IN
(
	SELECT actorid
	FROM
		(SELECT actorid, count(movieid) AS c
		FROM casting
		WHERE
		ord=1
		GROUP BY actorid
		HAVING
		c >= 30) AS starcount
)
GROUP BY name
ORDER BY name

-- PROBLEM 15
SELECT title, COUNT(actorid) as ActorCount
FROM movie
JOIN casting ON id=movieid
WHERE yr = 1978
GROUP BY movieid
ORDER BY ActorCount DESC --DESCENDING ORDER

--PROBLEM 16 -- What are they sorting by?
SELECT name
FROM actor
JOIN casting ON id=actorid
WHERE movieid IN (
	SELECT movieid
	FROM casting
	JOIN actor ON id=actorid
	WHERE name='Art Garfunkel'
) AND name != 'Art Garfunkel'
GROUP BY name

-------------------------------------------
-- http://sqlzoo.net/w/index.php/Using_Null

--PROBLEM 1
SELECT name
FROM teacher
WHERE dept IS NULL

--PROBLEM 2
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept ON (teacher.dept=dept.id)

--PROBLEM 3 - Shows teachers with NULL dept
SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept ON teacher.dept = dept.id

--PROBLEM 4 - Shows depts with no teacher connection
SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept ON teacher.dept = dept.id

--PROBLEM 5
SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher

--PROBLEM 6
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept ON teacher.dept=dept.id

--PROBLEM 7
SELECT COUNT(name), COUNT(mobile)
FROM teacher

--PROBLEM 8
SELECT dept.name, COALESCE(COUNT(teacher.name), 0) as Staff
FROM teacher RIGHT JOIN dept ON teacher.dept=dept.id
GROUP BY dept.name

--PROBLEM 9
SELECT name, CASE WHEN dept=1 THEN 'Sci'
WHEN dept=2 THEN 'Sci'
ELSE 'Art'
END as Department
FROM teacher

--PROBLEM 10
SELECT name, CASE WHEN dept=1 THEN 'Sci'
WHEN dept=2 THEN 'Sci'
WHEN dept=3 THEN 'Art'
ELSE 'None'
END as Department
FROM teacher



--------------------------------------
-- http://sqlzoo.net/wiki/NSS_Tutorial

-- Problem 1
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'

-- Problem 2
SELECT institution, subject
  FROM nss
 WHERE question='Q15'
   AND score >= 100

-- Problem 3
 SELECT institution,score
   FROM nss
  WHERE question='Q15'
    AND score<50
    AND subject='(8) Computer Science'

-- Problem 4
		SELECT subject, SUM(response)
		  FROM nss
		 WHERE question='Q22'
		   AND subject IN ('(8) Computer Science',  '(H) Creative Arts and Design')
		GROUP BY subject

-- Problem 5
--*

SELECT subject, SUM(response * A_STRONGLY_AGREE / 100)
  FROM nss
WHERE question='Q22'
   AND subject IN ('(8) Computer Science',  '(H) Creative Arts and Design')
GROUP BY subject

-- Problem 6
SELECT subject, SUM(response * A_STRONGLY_AGREE) / SUM(response)
  FROM nss
 WHERE question='Q22'
   AND subject IN ('(8) Computer Science',  '(H) Creative Arts and Design')
GROUP BY subject


-- Problem 7 - attempt 1
SELECT institution, ROUND(AVG(score))
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
GROUP BY institution
ORDER BY institution

-- attempt 2
SELECT institution,ROUND(SUM(score * response) / SUM(response))
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
GROUP BY institution
ORDER BY institution

--PROBLEM 8 --works for first column

SELECT institution,SUM(sample)
  FROM nss
 WHERE question='Q01'
   AND (institution LIKE '%Manchester%')
GROUP BY
  institution

--works for 2nd column

SELECT institution, SUM(sample), SUM(
	CASE WHEN subject LIKE '%Computer Science%' THEN sample ELSE 0 END
) AS comp
  FROM nss
 WHERE question='Q01'
   AND (institution LIKE '%Manchester%')
GROUP BY
  institution

-----------------------------------------
-- http://sqlzoo.net/wiki/Self_join

--PROBLEM 1
SELECT COUNT(id)
FROM stops

--PROBLEM 2
SELECT id
FROM stops
WHERE name='Craiglockhart'

--PROBLEM 3
SELECT id, name
FROM route JOIN stops ON id=stop
WHERE num='4' AND company='LRT'

--PROBLEM 4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2





