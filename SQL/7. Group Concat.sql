SELECT 
	m.title,
	GROUP_CONCAT(a.name SEPARATOR ', ') AS movie_title
FROM movies m
JOIN movie_actor ma ON m.movie_id = ma.movie_id
JOIN actors a ON a.actor_id = ma.actor_id 
GROUP BY m.title;


SELECT 
	name,
	GROUP_CONCAT(m.title SEPARATOR ', ') AS movie_title
FROM actors a
JOIN movie_actor ma ON a.actor_id = ma.actor_id 
JOIN movies m ON ma.movie_id = m.movie_id 
GROUP BY name;
