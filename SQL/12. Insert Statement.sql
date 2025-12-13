### Insert Statement

-- Simple insert for new record in movies
	INSERT INTO movies 
	VALUES (141, "Bahuhbali 3", "Bollywood", 2030, 9.0, "Arka Media Works", 2);

-- Insert with NULL or DEFAULT values
	INSERT INTO movies 
	VALUES (142, "Thor 10", "Hollywood", NULL, DEFAULT, "Marvel Studios", 5);

-- Same insert with column names
	INSERT INTO movies (movie_id, title, industry, language_id) 
	VALUES (143, "Pushpa 5", "Bollywood", 2);

-- Insert with invalid language_id. Foreign key constraint fails
	INSERT INTO movies (movie_id, title, industry, language_id) 
	VALUES (144, "Pushpa 6", "Bollywood", 10);

-- Insert multiple rows
	INSERT INTO movies 
    	     (movie_id, title, industry, language_id)
	VALUES 
    	     (145, "Inception 2", "Hollywood", 5),
             (146, "Inception 3", "Hollywood", 5),
             (147, "Inception 4", "Hollywood", 5);