use music_streaming_app;

-- 1.Create two tables: Influencers (id, name) and Collaborations (id, influencer1_id, influencer2_id, collab_date). Write a SQL FULL JOIN query to list all influencers and show their collaboration partner names if any, including influencers with no collaborations.

create table Influencers (
    id int ,
    name varchar(100) 
);

insert into influencers values
(1, 'Krish'),
(2, 'Riya'),
(3, 'Punya'),
(4, 'Mahek'),
(5, 'jeevan');

create table Collaborations (
    id int,
    influencer1_id int,
    influencer2_id int,
    collab_date date
);

insert into influencers values
(1, 'Krish'),
(2, 'Riya'),
(3, 'Punya'),
(4, 'Mahek'),
(5, 'jeevan');

insert into collaborations values
(1, 1, 2, '2026-01-10'),
(2, 2, 3, '2025-12-15'),
(3, 1, 4, '2026-03-05'),
(4, 3, 5, '2025-11-20');

select * from influencers;
select * from collaborations;

select i.name  as influencer_name,p.name as partner_name 
from influencers i 
left join collaborations c
on  c.influencer1_id = i.id 
left join influencers p 
on c.influencer2_id = p.id 
union 
select i.name  as influencer_name,p.name as partner_name 
from influencers i 
right  join collaborations c
on  c.influencer1_id = i.id 
left join influencers p 
on c.influencer2_id = p.id ;

-- 2.Using a SELF JOIN, write a query on a table called Playlists (id, user_id, playlist_name, parent_playlist_id) to display each playlist alongside its parent playlist name, similar to how Spotify shows nested playlists.<br><br><em><strong>Hint:</strong> Join Playlists with itself on parent_playlist_id = id.</em>

create table  playlists2 (
    id int,
    user_id int,
    playlist_name varchar(100),
    parent_playlist_id int
);

insert into playlists2 values
(1, 101, 'My Music', null),
(2, 101, 'Workout', 1),
(3, 101, 'Chill', null),
(4, 102, 'Favorites', 4),
(5, 102, 'Rock', null),
(6, 103, 'Travel Songs', 2);

select * from playlists2;

select p.playlist_name as playlist_name , p1.playlist_name as parent_playlist_name
from playlists2 p
inner join playlists2 p1
on p1.parent_playlist_id = p.id;

-- 3.Given three tables: Users (id, username), Orders (id, user_id, order_date), and Payments (id, order_id, amount), write a SQL query using multiple JOINs to display each username, their order date, and payment amount, showing all users even if they have no orders or payments.

create table users (
    id int,
    username varchar(100)
);

insert into users values
(1, 'Meet'),
(2, 'Om'),
(3, 'Ujju'),
(4, 'Krish'),
(5, 'Pooja');

create table orders2 (
    id int,
    user_id int,
    order_date date 
);

insert into orders2 values
(101, 1, '2026-01-10'),
(102, 1, '2026-05-15'),
(103, 2, '2026-02-05'),
(104, 3, '2026-03-20');

create table payments (
    id int,
    order_id int,
    amount int
);

insert into  payments values
(1, 101, 550.00),
(2, 102, 800.00),
(3, 103, 1100.00);

select * from users;
select * from orders2;
select * from payments;

select u.username, o.order_date,p.amount
from users u 
left join orders2 o
on u.id = o.user_id
left  join payments p
on o.id = p.order_id;

-- 4.You notice that your JOIN query between Zomato's Restaurants and Reviews tables is returning duplicate rows for some restaurants. Modify your query to eliminate duplicates and explain in one line why the duplicates were happening.<br><br><em><strong>Hint:</strong> Use DISTINCT or GROUP BY and consider the relationship between restaurants and reviews.</em>

create table  restaurants1 (
    id int,
    name varchar(100),
    city varchar(100)
);

insert into restaurants1 values
    (1, 'Spice Garden', 'Surat'),
    (2, 'Tasty Bites', 'Mumbai'),
    (3, 'Green Leaf', 'Ahmedabad'),
    (4, 'Food Corner', 'Delhi');

create table reviews (
    id int primary key,
    restaurant_id int,
    username varchar(100),
    rating int,
    review_text varchar(255)
);

insert into reviews values
(1, 1, 'Rahul', 5, 'Excellent food'),
(2, 1, 'Priya', 4, 'good food'),
(3, 3, 'Amit', 3, 'amazing'),
(4, 1, 'Neha', 5, 'nice restaurant'),
(5, 2, 'Karan', 4, 'great pizza');

select * from restaurants1;
select * from   reviews ;

select distinct r.name
from restaurants1 r
inner join reviews r1
on r.id = r1.restaurant_id;

-- 5.Write two different JOIN queries on a Products and Categories table (like Flipkart) to list all products with their category names, but use different join conditions in each. Briefly explain which join condition is more efficient and why.

create table categories (
    id int primary key,
    category_name varchar(100)
);

insert into categories values
(1, 'Indian'),
(2, 'Chinese'),
(3, 'Italian'),
(4, 'Fast Food');


create table products1 (
    id int primary key,
    product_name varchar(100),
    category_id int,
    price decimal(10,2)
);

insert into products1 values
(1, 'Paneer Butter Masala', 1, 250.00),
(2, 'Veg Hakka Noodles', 2, 180.00),
(3, 'Margherita Pizza', 3, 300.00),
(4, 'Veg Burger', 4, 150.00),
(5, 'Biryani', 1, 220.00);

select * from categories;
select * from products1 ;

SELECT c.category_name, p.product_name
FROM categories c
INNER JOIN products1 p
ON p.category_id = c.id;

SELECT c.category_name,p.product_name
FROM categories c
left join products1 p
on c.id = p.category_id ;


