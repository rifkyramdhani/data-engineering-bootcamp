/*
Write SQL queries for the following,

1. Show all the movies with their language names
2. Show all Telugu movie names (assuming you don't know the language
id for Telugu)
3. Show the language and number of movies released in that language
*/

-- 1. Show all the movies with their language names
SELECT 
	m.title,
	l.name
FROM movies m
JOIN languages l 
ON m.language_id = l.language_id;

-- 2. Show all Telugu movie names (assuming you don't know the language id for Telugu)
SELECT 
	m.title
FROM movies m
JOIN languages l 
ON m.language_id = l.language_id
WHERE l.name = 'Telugu';

-- 3. Show the language and number of movies released in that language
SELECT 
	l.name, 
	COUNT(m.movie_id) as no_movies
FROM languages l
LEFT JOIN movies m USING (language_id)        
GROUP BY language_id
ORDER BY no_movies DESC;