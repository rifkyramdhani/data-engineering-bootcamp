/*
1. Print profit % for all the movies
*/

-- 1. Print profit % for all the movies

SELECT 
	*,
	revenue - budget AS profit,
	ROUND(((revenue - budget) * 100 / budget),2) AS profit_percentage
FROM financials