-- 1. Create a table called Orders with columns: order_id, user_id, order_date, and total_amount. Insert at least 7 sample rows representing different users and dates, similar to how food orders appear in Zomato or Swiggy.

use music_streaming_app;

create table Orders5 (
    order_id int,
    user_id int,
    order_date date,
    total_amount int
);

insert into Orders5 values
(1, 101, '2026-01-05', 2500),
(2, 102, '2026-01-12', 1800),
(3, 103, '2026-01-20', 3200),
(4, 104, '2026-02-03', 1500),
(5, 101, '2026-02-15', 4500),
(6, 105, '2026-02-22', 2750),
(7, 103, '2026-03-01', 3900);

SELECT * FROM Orders5;

-- 2. Write a SQL query using the LAG() function to show each user's order_id, order_date, and the total_amount of their previous order (if any), ordered by user and date.<br><br><em><strong>Hint:</strong> Use PARTITION BY user_id and ORDER BY order_date in your window function.</em>

select user_id,order_id,order_date,total_amount,
    lag(total_amount) over( partition by user_id order by order_date) as previous_amount
from Orders5;

-- 3. Using the same Orders table, write a SQL query with the LEAD() function to display each order_id, order_date, and the next order's total_amount for the same user.

SELECT user_id,order_id,order_date,total_amount,
    lead(total_amount) over( partition by user_id order by order_date) as next_amount
from Orders5;


-- 4. Write a SQL query to calculate the running total of total_amount for each user, showing order_id, order_date, total_amount, and a column running_total that accumulates the sum as you move through each user's orders.<br><br><em><strong>Hint:</strong> Use SUM(total_amount) OVER (PARTITION BY user_id ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW).</em>

select user_id,order_id,order_date,total_amount,
    sum(total_amount) over( partition by user_id order by order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as running_total
from Orders5;


-- 5 Write a SQL query to calculate a 3-order moving average of total_amount for each user, showing order_id, order_date, total_amount, and moving_avg columns.<br><br><em><strong>Constraint:</strong> Use SUM() OVER() with ROWS BETWEEN 2 PRECEDING AND CURRENT ROW to compute the moving average.</em>