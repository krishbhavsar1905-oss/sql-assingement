-- 1.Create a table called Restaurants with columns: id, name, cuisine, rating, and city. Insert at least 5 sample records representing real or fictional restaurants you might find on Zomato.

CREATE DATABASE Restaurants;

use Restaurants;

create  table restaurants1(
id int,
name varchar(100),
cuisine varchar(100),
rating int,
city varchar(100)
);

insert into restaurants1 values
(1,"saffron","indian",4,"surat"),
(2,"urban bites","ltalian",2,"delhi"),
(3,"guarati rasoi","indian",5,"ahemdabad"),
(4,"moonlight cafe","cafe",3,"delhi"),
(5,"casa feista","mexican",1,"mumbai"),
(6,"spice junction","chineses",5,"surat");

select * from restaurants1;

-- 2.Write a SQL query to find all restaurants in the Restaurants table that have a rating greater than 4.0 and are located in either 'Ahmedabad' or 'Surat'.

select * from restaurants1 where rating > 4 and city in ("ahemdabad","surat");

-- 3.Using the LIKE operator, write a query to select all restaurants whose names start with 'Swa' (for example, 'Swagat', 'Swadisht') from the Restaurants table.<br><br><em><strong>Hint:</strong> Use LIKE 'Swa%'.</em>

select * from restaurants1 where name like "s%"; 

-- 4.Write a SQL query using the BETWEEN keyword to find all restaurants in the Restaurants table with a rating between 3.5 and 4.5 (inclusive).

select * from restaurants1
where rating between 3.5 and 4.5;

-- 5.Write a query to find all restaurants whose cuisine is either 'Chinese', 'Italian', or 'Indian' using the IN operator.

select * from Restaurants1
where cuisine in ('chineses', 'ltalian', 'indian');