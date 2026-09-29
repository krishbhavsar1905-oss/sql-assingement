-- 1. Create a table named MusicPlaylist with columns: id, song_name, artist, genre, and duration. Insert at least 5 records representing songs from your favorite Spotify playlist, then write a SELECT statement to retrieve all columns for all songs.

use music_streaming_app;

create table musicplaylist1(
id int primary key,
song_name varchar(100),
artist varchar(100),
genre varchar(100),
duration time 

);

insert into musicplaylist1 values (1,"starboy","the weeknd","millennials",'00:03:50');
insert into musicplaylist1 values (2,"perfect","Ed Sheeran","Pop", '00:04:23');
insert into musicplaylist1 values (3,"cheleya","arjit singh","bollywood",'00:02:39');
insert into musicplaylist1 values (4,"shape of you","Ed Sheeran", "Pop", '00:02:34');
insert into musicplaylist1 values (5,"see you again","wiz khalifa","hollywood",'00:03:49');

select * from musicplaylist1;

-- 2.Write a SQL query to display only the song_name and artist columns from the MusicPlaylist table, showing just the first 3 records using the LIMIT keyword.

select song_name,artist from musicplaylist limit 3;

-- 3. Suppose you have a table named FoodOrders with columns: id, restaurant, food_item, and order_date. Write a SQL query to list all unique restaurant names where you have placed orders, using the DISTINCT keyword.

use music_streaming_app;

create table foodorders(
id int primary key,
restaurant varchar(100),
food_item varchar(100),
order_date date 
);

INSERT INTO foodorders VALUES 
(1, 'Dominos', 'Pizza', '2023-10-21');
INSERT INTO foodorders VALUES 
(2, 'Swiggy Restaurant', 'Biryani', '2024-03-21');
INSERT INTO foodorders VALUES 
(3, 'Dominos', 'Burger', '2021-05-22');
INSERT INTO foodorders VALUES 
(4, 'McDonalds', 'French Fries', '2025-09-23');
INSERT INTO foodorders VALUES 
(5, 'Swiggy Restaurant', 'Sandwich', '2024-11-24');

select distinct restaurant from foodorders;

-- 4.Write a SQL query on the FoodOrders table to select food_item as 'Dish' and order_date as 'Date Ordered', displaying only these two columns with the column aliases in the output.

select food_item as dish , order_date as 'data orderd'
from foodorders;

-- 5.You tried running this query: SELECT DISTINCT food_item, restaurant FROM FoodOrders LIMIT 2, but it returns an error or doesn't work as expected. Identify and fix the mistake in the query.<br><br><em><strong>Hint:</strong> Check the correct placement and usage of the LIMIT keyword in SQL syntax.</em>

SELECT DISTINCT food_item, restaurant FROM FoodOrders LIMIT 2;
 
it is true query and limit keyword place is correct