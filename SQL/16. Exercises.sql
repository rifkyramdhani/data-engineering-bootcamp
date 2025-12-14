/*
Window Functions – Nth Highest Salary

You work as a data engineer for a top-tier technology company. You are given an employee_salaries table with the columns employee_id, employee_name, department, and salary. Your task is to find the third-highest salary in each department and return all employees who earn that salary. Exclude departments that have fewer than three distinct salary values.

Return the following columns in the output: emp_id, name, department, salary.

Assumptions:
- The employees_salaries table includes emp_id, name, department, and salary.
- Departments with fewer than 3 distinct salary values should be excluded.
- Ranking is based on salary in descending order.

Sample Input:
employee_id	employee_name	department	salary
1014	Pooja	Support	37372
1023	Rohan	Marketing	56022
1032	Manish	Engineering	132653
1048	Sunita	Finance	70986
1061	Priya	HR	67750

Sample Output:
emp_id	name	department	salary
1107	Neha	Sales	78942
1128	Vikram	IT	111311
1137	Arjun	Finance	68916
1154	Sanjay	Engineering	115420
1199	Karan	Marketing	54695

Explanation:
Calculate the rank of every employee’s salary within their department in descending order.
All employees with the third-highest salary (rank = 3) in their department are selected.
Departments having fewer than 3 distinct salary values are excluded from results to ensure the third-highest-salary concept is meaningful.
The result includes multiple employees within the same department if there are salary ties.
*/

WITH	CTE1 AS (SELECT 
                        *,
                        DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rnk
                    FROM employee_salaries),
        CTE2 AS (SELECT
                        department,
                        COUNT(DISTINCT salary) as cnt_salary
                    FROM employee_salaries
                        GROUP BY department)
SELECT DISTINCT
    CTE1.employee_id AS emp_id,
    CTE1.employee_name AS name,
    CTE1.department,
    CTE1.salary 
FROM CTE1 
INNER JOIN CTE2 ON CTE1.department = CTE2.department
WHERE CTE1.rnk = 3 
AND CTE2.cnt_salary >= 3
ORDER BY CTE1.department, CTE1.salary DESC