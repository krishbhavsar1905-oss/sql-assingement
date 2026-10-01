-- 1.Write an SQL query to display all products from a 'products' table and sort them by price in ascending order, similar to how Flipkart lists items from lowest to highest price.

create database Flipkart;

use products;

create table products(
name varchar(100),
price int
); 

insert into products values
('Mobile Phone', 15000),
('Laptop', 55000),
('Headphones', 2000),
('Keyboard', 1500),
('Mouse', 800),
('Monitor', 12000),
('Tablet', 25000),
('Smart Watch', 5000),
('Power Bank', 1200),
('Speaker', 3000);

select * from products;

select * from products order by price asc;

-- 2.Modify your previous query to show the top 5 most expensive products using ORDER BY with DESC and LIMIT.

select * from products order by price desc limit 5;

-- 3.Given a 'movies' table with columns 'title', 'release\_year', and 'rating', write an SQL query to list all movies sorted first by release\_year in descending order (latest first), then by rating in descending order (highest rated first).

create table movies(
tital varchar(100),
release_year int,
rating int
);

insert into movies values
('Avengers', 2024, 9),
('Jawan', 2023, 8),
('Animal', 2023, 6),
('Pathaan', 2023, 7),
('Dune: Part Two', 2024, 9),
('F1', 2025, 8),
('Avatar: Fire and Ash', 2025, 8);

select * from movies;

select * from movies 
order by release_year desc ,
rating desc;

-- 4.Write an SQL query to display the first 10 restaurants from a 'restaurants' table, sorted alphabetically by name, just like Zomato's A-Z listing.\<br>\<br>\<em>\<strong>Hint:\</strong> Use ORDER BY with LIMIT.\</em>

select * from restaurants1
order by name asc
limit 6 ;

-- 5.Suppose you want to display the top 3 trending songs from a 'songs' table based on play\_count, but if two songs have the same play\_count, the more recently added song should come first. Write the SQL query to achieve this.\<br>\<br>\<em>\<strong>Hint:\</strong> Use ORDER BY with multiple columns.\</em>

create table songs (
    song_id int primary key,
    title varchar(100),
    play_count int,
    added_date date
);

insert into songs values
(1, 'starboy', 50000, '2024-11-17'),
(2, 'perfect', 60000, '2025-09-03'),
(3, 'cheleya', 70000, '2025-12-30'),
(4, 'shape of you', 75000, '2026-03-11'),
(5, 'see you again', 85000, '2026-05-19');

select * from songs order by play_count desc, added_date desc
limit 3;