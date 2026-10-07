-- 1. Create two tables in your database: 'restaurants' (id, name, city) and 'dishes' (id, restaurant_id, dish_name, price). Insert at least 3 restaurants and 2-3 dishes for each restaurant.

use restaurants;

create table restaurant2 (
    id int,
    name varchar(100),
    city varchar (100)
);

create table  dishes (
    id int ,
    restaurant_id int,
    dish_name varchar(100),
    price int 
);

insert into  restaurant2 values
(1, 'The cafe Hub', 'Surat'),
(2, 'Spice zoen', 'Vadodara'),
(3, 'Pizza palace', 'Ahmedabad');

insert into dishes values
(1, 1, 'cappuccino coffe', 150),
(2, 1, 'sandwicg', 120),
(3, 1, 'banne Dosa', 150),
(4, 2, 'Butter Paneer', 250),
(5, 2, 'Garlic Naan', 150),
(6, 2, 'biryani', 200),
(7, 3, 'Farmhouse Pizza', 300),
(8, 3, 'Margherita Pizza', 280),
(9, 3, 'cheese burst pizza', 350);

select * from restaurant2;
select * from dishes;

-- 2. Write an SQL INNER JOIN query to display each dish along with its restaurant name and city, similar to how Zomato shows dish details with the restaurant info.

select d.dish_name,r.name,r.city
from restaurant2 r
inner join dishes d
on d.restaurant_id =r.id;

-- 3.Write an SQL LEFT JOIN query to list all restaurants and their dishes, showing restaurants even if they currently have no dishes on the menu.<br><br><em><strong>Hint:</strong> Use LEFT JOIN so restaurants without dishes still appear in the results with NULL for dish columns.</em>

select r.name,d.dish_name
from restaurant2 r 
left join dishes d
on r.id= d.restaurant_id;

-- 4.Write an SQL RIGHT JOIN query to display all dishes and their restaurant names, including any dishes that might not be linked to a restaurant (simulate a data error where a dish has a restaurant_id that doesn't match any restaurant).

select r.name , d.dish_name 
from restaurant2 r
right join dishes d
on d.restaurant_id = r.id 
where r.id is null;

-- 5.Given this scenario: You want to show a list of all playlists and the songs inside them, like Spotify. Explain which JOIN type (INNER, LEFT, or RIGHT) you would use to show all playlists, even if some are empty, and write the SQL query for it.

use music_streaming_app;

select p.playlist_name,s.song_name
from playlists p
left join songs s
on p.playlist_id = s.playlist_id;