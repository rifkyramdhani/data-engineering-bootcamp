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
ORDER BY CTE1.department, CTE1.salary DESC;


/*
In a new table device_logs with columns id, timestamp, and event_detail, your task is to remove duplicate entries by keeping only the latest record for each id. Return the columns id, timestamp, and event_detail in the output.

Assumptions:
- The table device_logs contains possible multiple events per id at different times.
- Latest record is determined by the most recent timestamp.
- Keep exactly one record per id, the latest.

Sample Input:
id	timestamp	event_detail
device_77	2025-10-25 10:23:18	start
device_59	2025-10-21 15:42:07	error
device_14	2025-10-28 08:19:33	stop
device_88	2025-10-20 21:33:10	update
device_30	2025-10-23 13:47:55	error

Sample Output:
id	timestamp	event_detail
device_14	2025-10-28 08:19:33	stop
device_72	2025-10-27 22:55:14	start
device_77	2025-10-25 10:23:18	start
device_59	2025-10-21 15:42:07	error
device_30	2025-10-23 13:47:55	error

Explanation:
The device_logs table may contain multiple event records per id with different timestamps.
To deduplicate, rank each record per id by descending timestamp using ROW_NUMBER().
Keep only those records with the latest timestamp for each id.
*/

SELECT
    id,
    timestamp,
    event_detail
FROM (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY timestamp DESC) AS rn
    FROM device_logs
) sub
WHERE rn = 1;

/*
You are analyzing API performance from the api_logs table, which records service_name, response_time_ms, and timestamp. Calculate the 95th percentile of API response time in milliseconds for each service. Return service_name, and 95th_percentile_response_time_ms. 

Assumptions:
- The api_logs table contains service_name, response_time_ms (numeric), and timestamp (datetime).
- Calculate percentiles per service independently.
- Percentiles rounded to two decimal places for reporting.

Sample Input:
service_name	response_time_ms	timestamp
user_service	13.24	2025-10-21 14:32:45
auth_service	274.36	2025-10-23 09:18:12
payment_service	8.63	2025-10-22 11:05:33
search_service	173.50	2025-10-20 18:45:50
notification_service	45.56	2025-10-24 22:10:20

Sample Output:
service_name	95th_percentile_response_time_ms
auth_service	298.72
notification_service	228.14
payment_service	253.69
search_service	286.03
user_service	267.58

Explanation:
Group the API logs by each service_name.
Compute the 95th percentile of response_time_ms per group.
The 95th percentile captures the high-response-time boundary, useful for performance analysis.
Return service names alongside their 95th percentile response time.
 */

  WITH ranked AS (SELECT
    service_name,
    response_time_ms,
    ROW_NUMBER() OVER (PARTITION BY service_name ORDER BY response_time_ms) AS rn,
    COUNT(*) OVER (PARTITION BY service_name) AS total_count
  FROM api_logs
  )
  SELECT service_name,
    ROUND(MAX(CASE WHEN rn = CEIL(0.95 * total_count) THEN response_time_ms END), 2) AS 95th_percentile_response_time_ms
FROM ranked
GROUP BY service_name;

/*
 You are analyzing user login behavior for a software platform. The user_logins table records user_id and login_date. Your task is to find each user's longest consecutive login streak, returning its user_id, start_date, end_date, and streak_length.

Assumptions:
- The table user_logins stores daily login events per user.
- Consecutive logins are continuous days without gaps.
- The longest streak per user is the maximum number of consecutive login days.
- If multiple longest streaks exist, return any one.

Sample Input:
user_id	login_date
user_31	2025-09-18
user_4	2025-10-11
user_5	2025-10-01
user_41	2025-09-10
user_31	2025-09-09

Sample Output:
user_id	start_date	end_date	streak_length
user_31	2025-09-07	2025-09-15	9
user_4	2025-10-01	2025-10-06	6
user_5	2025-09-20	2025-09-28	9

Explanation:
Identify consecutive login days for each user.
Calculate the length of each consecutive streak.
Return the longest streak's start date, end date, and length per user.
If multiple longest streaks per user exist, return any one.
 */

WITH NumberedLogins AS (
    SELECT
        user_id,
        login_date,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY login_date) AS seq_num
    FROM user_logins
),
ConsecutiveGroups AS (
    SELECT
        user_id,
        login_date,
        DATE_SUB(login_date, INTERVAL seq_num DAY) AS grp
    FROM NumberedLogins
),
Streaks AS (
    SELECT
        user_id,
        MIN(login_date) AS start_date,
        MAX(login_date) AS end_date,
        COUNT(*) AS streak_length
    FROM ConsecutiveGroups
    GROUP BY user_id, grp
),
LongestStreaks AS (
    SELECT
        user_id,
        start_date,
        end_date,
        streak_length,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY streak_length DESC, start_date) AS rnk
    FROM Streaks
)
SELECT
    user_id,
    start_date,
    end_date,
    streak_length
FROM LongestStreaks
WHERE rnk = 1;

/*
You are a data engineer at a manufacturing company. Your monthly_revenue table has month and total_revenue, which records monthly business revenue. Calculate the month-over-month (MoM) revenue growth percentage. Your output should show month, current_revenue, prev_revenue, and growth_pct.

Assumptions:
- The monthly_revenue table consists of month and total_revenue columns.
- Months are formatted as YYYY-MM.
- The previous month’s revenue may be NULL for the first row.
- growth_pct should be rounded to two decimals.

Sample Input:
month	total_revenue
2025-02	557319
2024-06	1093695
2025-01	1006245
2024-08	1174297
2024-04	761600

Sample Output:
month	total_revenue	prev_revenue	growth_pct
2025-06	929344	827053	null
2025-07	849155	929344	-8.63
2025-08	1168898	849155	37.65
2025-09	627417	1168898	-46.29
2025-10	1012893	627417	61.47

Explanation:
Use window functions to get the previous month's revenue for each row.
Calculate MoM growth %: ((current revenue - previous revenue) / previous revenue) * 100.
*/

WITH AA AS (SELECT 
    month,
    total_revenue,
    ROW_NUMBER() OVER(ORDER BY month) AS rn
FROM monthly_revenue
), BB AS (
    SELECT
        month,
        total_revenue,
        rn,
        rn + 1 AS rn_plus_1
    FROM AA
) SELECT 
A.month,
A.total_revenue, 
B.total_revenue AS prev_revenue,
ROUND(((A.total_revenue - B.total_revenue) / B.total_revenue) * 100,2) AS growth_pct
FROM BB A
LEFT JOIN BB B ON A.rn = B.rn_plus_1

/*
You manage a hotel booking system. The bookings table contains columns room_id, guest_id, checkin_date, and checkout_date. Your task is to find overlapping bookings for the same room, i.e., detect double bookings using interval join logic. Return room_id, guest1_id, guest1_checkin, guest1_checkout, guest2_id, guest2_checkin, and guest2_checkout.

Assumptions:
- The bookings table records check-in and check-out dates per guest per room.
- Bookings overlap if their date intervals intersect (checkin < other checkout AND other checkin < checkout).
- Guests can have multiple bookings.

Sample Input:
room_id	guest_id	checkin_date	checkout_date
room_6	guest_70	2025-09-21	2025-10-01
room_20	guest_87	2025-09-11	2025-09-19
room_12	guest_15	2025-10-02	2025-10-11
room_7	guest_52	2025-09-11	2025-09-19
room_3	guest_44	2025-09-28	2025-10-05

Sample Output:
room_id	guest1_id	guest1_checkin	guest1_checkout	guest2_id	guest2_checkin	guest2_checkout
room_6	guest_70	2025-09-21	2025-10-01	guest_19	2025-09-25	2025-09-30
room_12	guest_15	2025-10-02	2025-10-11	guest_66	2025-10-07	2025-10-10
room_19	guest_90	2025-09-05	2025-09-11	guest_23	2025-09-08	2025-09-12
room_3	guest_44	2025-09-28	2025-10-05	guest_39	2025-10-01	2025-10-06
room_17	guest_51	2025-09-22	2025-09-29	guest_75	2025-09-25	2025-10-02

Explanation:
Identify pairs of bookings for the same room but different guests.
Check where booking intervals overlap: (checkin_date < other.checkout_date) AND (other.checkin_date < checkout_date).
Exclude self-joins and duplicate pairs.
*/

SELECT
    A.room_id,
    A.guest_id AS guest1_id,
    A.checkin_date AS guest1_checkin,
    A.checkout_date AS guest1_checkout,
    B.guest_id AS guest2_id,
    B.checkin_date AS guest2_checkin,
    B.checkout_date AS guest2_checkout
FROM bookings A
JOIN bookings B ON A.room_id = B.room_id
    AND B.checkin_date < A.checkout_date 
    AND A.checkin_date < B.checkout_date 
    AND A.guest_id <> B.guest_id 
WHERE a.guest_id < b.guest_id