/*
Write SQL queries for the following:

1. Print all movie titles and release year for all Marvel Studios movies.
2. Print all movies that have Avenger in their name.
3. Print the year when the movie "The Godfather" was released.
4. Print all distinct movie studios in the Bollywood industry.
*/

-- 1. Print all movie titles and release year for all Marvel Studios movies.
SELECT 
	title, 
	release_year 
FROM movies 
WHERE studio = 'Marvel Studios';

-- 2. Print all movies that have Avenger in their name.
SELECT 
	*
FROM movies 
WHERE title LIKE '%avenger%';

-- 3. Print the year when the movie "The Godfather" was released.
SELECT DISTINCT
    release_year
FROM movies 
WHERE title = 'The Godfather';

-- 4. Print all distinct movie studios in the Bollywood industry.
SELECT DISTINCT
    studio
FROM movies 
WHERE industry = 'Bollywood';
