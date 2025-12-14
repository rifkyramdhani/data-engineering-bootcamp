## ROW_NUMBER, RANK, DENSE_RANK

-- ROW_NUMBER() for create a row number
SELECT
	*,
	ROW_NUMBER() OVER(PARTITION BY category ORDER BY amount DESC) AS rn,		-- ROW_NUMBER() for create a row number
	RANK() OVER(PARTITION BY category ORDER BY amount DESC) AS rnk, 			-- RANK() for create rank (will skip ranks if the ranks are same)
	DENSE_RANK() OVER(PARTITION BY category ORDER BY amount DESC) AS dns_rnk	-- DENSE_RANK() for create rank (doesnt skip any rank)
FROM expenses;

SELECT
	*,
	ROW_NUMBER() OVER(ORDER BY marks DESC) AS rn,		-- ROW_NUMBER() for create a row number
	RANK() OVER(ORDER BY marks DESC) AS rnk, 			-- RANK() for create rank (will skip ranks if the ranks are same)
	DENSE_RANK() OVER(ORDER BY marks DESC) AS dns_rnk	-- DENSE_RANK() for create rank (doesnt skip any rank)
FROM student_marks;