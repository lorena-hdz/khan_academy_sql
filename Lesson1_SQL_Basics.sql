/*
1️⃣ Challenge: Book list database

STEP 1
What are your favorite books? You can make a database table to store them in!
In this first step, create a table to store your list of books. It should have columns for id, name, and rating.
*/

CREATE TABLE favorite_books (id INTEGER PRIMARY KEY, name TEXT, rating INTEGER);

/*
STEP 2
Now, add three of your favorite books into the table.
*/

INSERT INTO favorite_books VALUES (1, "Calculus I", 5);
INSERT INTO favorite_books VALUES (2, "Calculus II", 5);
INSERT INTO favorite_books VALUES (3, "Calulus III", 5);

/*
2️⃣ Challenge: Box office hits database

This database contains an incomplete list of box office hits and their release year.
In this challenge, you're going to get the results back out of the database in different ways! 
*/

CREATE TABLE movies (id INTEGER PRIMARY KEY, name TEXT, release_year INTEGER);

INSERT INTO movies VALUES (1, "Avatar", 2009);
INSERT INTO movies VALUES (2, "Titanic", 1997);
INSERT INTO movies VALUES (3, "Star Wars: Episode IV - A New Hope", 1977);
INSERT INTO movies VALUES (4, "Shrek 2", 2004);
INSERT INTO movies VALUES (5, "The Lion King", 1994);
INSERT INTO movies VALUES (6, "Disney's Up", 2009);

/*
STEP 1
In this first step, just select all the movies.
*/

SELECT * FROM movies;

/*
STEP 2
Retrieves only the movies that were released in the year 2000 or later, not before.
Sort the results so that the earlier movies are listed first.
*/

SELECT * FROM movies WHERE release_year >= 2000 ORDER BY release_year;

/*
3️⃣ Challenge: TODO list database stats

Here's a table containing a TODO list with the number of minutes it will take to complete each item.
*/

CREATE TABLE todo_list (id INTEGER PRIMARY KEY, item TEXT, minutes INTEGER);

INSERT INTO todo_list VALUES (1, "Wash the dishes", 15);
INSERT INTO todo_list VALUES (2, "vacuuming", 20);
INSERT INTO todo_list VALUES (3, "Learn some stuff on KA", 30);

/*
STEP 1
Insert another item to your todo list with the estimated minutes it will take.
*/

INSERT INTO todo_list VALUES (4, "Take an everything shower", 90);

/*
STEP 2
Select the SUM of minutes it will take to do all of the items on your TODO list
*/

SELECT SUM(minutes) FROM todo_list

/*
4️⃣ Project: Design a store database

Create your own store! Your store should sell one type of things, like clothing or bikes, whatever you want your store to specialize in.
You should have a table for all the items in your store, and at least 5 columns for the kind of data you think you'd need to store.
You should sell at least 15 items, and use select statements to order your items by price and show at least one statistic about the items.
*/

CREATE TABLE gym_essentials (id INTEGER PRIMARY KEY, name TEXT, inventory INTEGER, color TEXT, price INTEGER);

INSERT INTO gym_essentials VALUES (1, "Sport Bras", 10, "black", 20);
INSERT INTO gym_essentials VALUES (2, "Leggings", 10, "grey", 30);
INSERT INTO gym_essentials VALUES (3, "socks", 10, "white", 10);
INSERT INTO gym_essentials VALUES (4, "headband", 2, "pink", 5);
INSERT INTO gym_essentials VALUES (5, "shoes", 40, "white", 150);
INSERT INTO gym_essentials VALUES (6, "wrist straps", 50, "pink", 15);
INSERT INTO gym_essentials VALUES (7, "gym bag", 30, "black", 50);
INSERT INTO gym_essentials VALUES (8, "barbell pad", 100, "white", 20);
INSERT INTO gym_essentials VALUES (9, "hoodie", 3, "pink", 30);
INSERT INTO gym_essentials VALUES (10, "ankle straps", 1, "black", 10);
INSERT INTO gym_essentials VALUES (11, "stretch bands", 20, "purple", 2);
INSERT INTO gym_essentials VALUES (12, "towel", 300, "white", 20);
INSERT INTO gym_essentials VALUES (13, "sweat  band", 0, "black", 45);
INSERT INTO gym_essentials VALUES (14, "5 lb dumbells", 7, "black", 10);
INSERT INTO gym_essentials VALUES (15, "water bottle", 0, "pink", 25);

/*
select data from table
*/

SELECT * FROM gym_essentials ORDER BY price;

/*
total inventory in store
*/

SELECT SUM(inventory) FROM gym_essentials;

/*
what product has the most inventory 
*/

SELECT name, MAX(inventory) FROM gym_essentials;

/*
what product is priced the highest 
*/

SELECT name, MAX(price) FROM gym_essentials
