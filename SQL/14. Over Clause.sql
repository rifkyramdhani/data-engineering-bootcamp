## Learning Over Clause

-- Create percentage amount per row
SELECT 
	*,
	amount * 100 / sum(amount) over() as percentage_amount 
FROM expenses;

-- Create percentage amount per category
SELECT 
	*,
	amount * 100 / sum(amount) over(partition by category) as percentage_amount 
FROM expenses;

-- Create cummulative amount per category by date
SELECT 
	*,
	sum(amount) over(partition by category order by date) as percentage_amount 
FROM expenses;