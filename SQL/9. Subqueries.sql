/*
1. Select all the movies with minimum and maximum release_year. Note that there
can be more than one movie in min and a max year hence output rows can be more than 2
    
2. Select all the rows from the movies table whose imdb_rating is higher than the average rating
*/

-- 1. Select all the movies with minimum and maximum release_year. Note that there
-- can be more than one movie in min and a max year hence output rows can be more than 2

SELECT 
	* 
FROM movies 
WHERE release_year IN (
	(SELECT MAX(release_year) FROM movies),
	(SELECT MIN(release_year) FROM movies))
ORDER BY release_year;

-- 2. Select all the rows from the movies table whose imdb_rating is higher than the average rating

SELECT 
	*
FROM movies 
WHERE imdb_rating > (
	SELECT AVG(imdb_rating) FROM movies)
ORDER BY imdb_rating DESC;
