### Update and Delete

-- Say THOR 10 movie is released in 2050, and you want to update the rating now :)
UPDATE movies 
SET release_year = 2050, imdb_rating = 9
WHERE movie_id = 142;\

-- Update multiple records. [Update all studios with 'Warner Bros. Pictures' for all the Inception movies records] 
UPDATE movies 
SET studio = 'Warner Bros. Pictures'
WHERE title like 'Inception %';

-- Delete all new inception movies
DELETE 
FROM movies 
WHERE title like 'Inception %';

-- Another delete to restore the database to normal again
DELETE 
FROM movies
WHERE movie_id IN (141,142,143)
