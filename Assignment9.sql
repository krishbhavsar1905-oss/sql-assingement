-- 1.Create a SQL query using a subquery in the WHERE clause to find all restaurants from a 'Restaurants' table whose average rating is higher than the average rating of all restaurants in the city.

use music_streaming_app;

create table restaurants2 (
    id int primary key,
    name varchar(100),
    city varchar(100),
    rating int
);

insert into restaurants2 values
(1, 'Spice Garden', 'Mumbai', 4),
(2, 'Taste of India', 'Delhi', 5),
(3, 'Royal Dine', 'Ahmedabad', 4),
(4, 'Green Leaf', 'Bangalore', 3),
(5, 'Ocean View', 'Goa', 5),
(6, 'Urban Bites', 'Pune', 4);

select * from restaurants2;

select name,rating from restaurants2
where  rating > (select avg(rating) from restaurants2);


-- 2. Write a SQL query that uses a subquery in the SELECT statement to display each user's name from a 'Users' table along with the total number of orders they have placed from an 'Orders' table, like a summary you might see in a Zomato user profile.

create table users1 (
    id int primary key,
    name varchar(100)
);

insert into users1 values
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit'),
(4, 'Neha'),
(5, 'Rohan');

create table orders4 (
    id int primary key,
    user_id int,
    order_date date,
    total_amount int
);

insert into orders4 values
(101, 1, '2026-01-05', 2500),
(102, 2, '2026-01-10', 1800),
(103, 3, '2026-01-15', 3200),
(104, 1, '2026-02-02', 4500),
(105, 4, '2026-02-12', 1200),
(106, 5, '2026-02-20', 2750),
(107, 3, '2026-03-01', 3900);

select * from orders4;
select  * from users1;

select u.name, (select count(o.user_id)from orders3 o
where u.id = o.user_id )
from users1 u;


-- 3.Given a 'Movies' table and a 'Reviews' table, write a SQL query using IN with a subquery to list all movies that have at least one review with a rating of 5 stars, as seen in BookMyShow's top-rated section.

create table movies2 (
    id int primary key,
    title varchar(100),
    genre varchar(50)
);

insert into movies2 values
(1, 'Inception', 'Sci-Fi'),
(2, 'The Dark Knight', 'Action'),
(3, 'Titanic', 'Romance'),
(4, 'The Godfather', 'Crime'),
(5, 'Interstellar', 'Sci-Fi'),
(6, 'Toy Story', 'Animation');

create table reviews1 (
    id int primary key,
    movie_id int,
    username varchar(100),
    rating int
);

insert into reviews1 values
(1, 1, 'rahul', 5),
(2, 2, 'priya', 4),
(3, 3, 'amit', 5),
(4, 4, 'neha', 4),
(5, 5, 'rohan', 5),
(6, 1, 'sneha', 4),
(7, 6, 'vikas', 3),
(8, 2, 'anjali', 5);

select * from movies2;
select * from reviews1;

select title from Movies2
where id in ( select id
    from Reviews
	 where rating = 5
);

-- 4.Write a nested SQL query to find the names of all sellers from a 'Sellers' table on a Flipkart-style platform who have sold products in every category listed in a 'Categories' table.<br><br><em><strong>Hint:</strong> Use nested subqueries to compare seller's categories with the complete list of categories.</em>

	create table sellers (
		id int primary key,
		name varchar(100)
	);

insert into sellers values
(1, 'Rajesh Kumar'),
(2, 'Priya Sharma'),
(3, 'Amit Patel'),
(4, 'Neha Singh');

create table categories1 (
    id int primary key,
    category_name varchar(100)
);

insert into categories1 values
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Home Appliances');

create table products2 (
    id int primary key,
    seller_id int,
    category_id int,
    product_name varchar(100),
    price decimal(10,2)
);

insert into products2 values
(1, 1, 1, 'Wireless Headphones', 2499.00),
(2, 2, 1, 'Smartphone', 15999.00),
(3, 3, 2, 'Cotton T-Shirt', 799.00),
(4, 4, 2, 'Denim Jeans', 1499.00),
(5, 1, 3, 'SQL Programming Book', 599.00),
(6, 2, 3, 'Data Science Guide', 899.00),
(7, 3, 4, 'Electric Kettle', 1299.00),
(8, 4, 4, 'Mixer Grinder', 3499.00),
(9, 1, 1, 'Bluetooth Speaker', 1799.00),
(10, 2, 2, 'Running Shoes', 2299.00),
(11, 3, 3, 'Web Development Book', 749.00);

select * from sellers;
select * from categories1;
select * from products2;


select s.name from sellers s
left join products2 p
on s.id = p.seller_id
group by s.id, s.name
having count(distinct p.category_id) = ( select count(*)
    from Categories
);