/*
1. Generate a report of all Hindi movies sorted by their revenue amount in millions.
Print movie name, revenue, currency, and unit
*/

SELECT
	m.title,
	f.revenue, 
	f.currency,
	f.unit,
		CASE 
		WHEN f.unit = 'Billions' THEN f.revenue * 1000
		WHEN f.unit = 'Thousands' THEN f.revenue / 1000
		ELSE f.revenue
	END AS revenue_millions
FROM movies m 
LEFT JOIN languages l ON m.language_id = l.language_id   
LEFT JOIN financials f ON m.movie_id = f.movie_id 
WHERE l.name = 'Hindi'
ORDER BY revenue_millions DESC
