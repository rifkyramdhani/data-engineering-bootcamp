# Excercise: movies that produced 500% or more profit and their rating are less than avg rating of all movies
WITH avg_rating AS (
	SELECT 
		AVG(imdb_rating) as avg 
	FROM movies
)
SELECT 
	m.title,
	m.imdb_rating,
	((revenue - budget)/budget * 100) AS profit_percentage
FROM movies m
LEFT JOIN financials f ON m.movie_id = f.movie_id 
WHERE m.imdb_rating <= (SELECT avg from avg_rating)
HAVING profit_percentage >= 500

/*
Select all Hollywood movies released after the year 2000 that made more than 500 million $ profit or more profit.
Note that all Hollywood movies have millions as a unit hence you don't need to do the unit conversion. 
Also, you can write this query without CTE as well but you should try to write this using CTE only
*/
WITH profit_millions AS (
	SELECT
		movie_id,
		currency,
		CASE 
			WHEN unit = 'Billions' THEN (revenue - budget)  * 1000
			WHEN unit = 'Thousands' THEN (revenue - budget)  / 1000
			ELSE (revenue - budget)
		END
		AS profit_in_millions
	FROM financials
), filtered_movies AS (
	SELECT
		movie_id,
		title,
		industry,
		release_year,
		imdb_rating,
		studio
	FROM movies
	WHERE industry = 'Hollywood' 
		AND release_year > 2000
)
SELECT
	fm.movie_id,
	fm.title,
	fm.industry,
	fm.release_year,
	fm.imdb_rating,
	fm.studio,
	pm.currency,
	pm.profit_in_millions 
FROM filtered_movies fm
LEFT JOIN profit_millions pm ON fm.movie_id = pm.movie_id 
WHERE pm.profit_in_millions > 500