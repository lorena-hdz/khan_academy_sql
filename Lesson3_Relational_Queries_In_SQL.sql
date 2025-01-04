/*
1️⃣ Challenge: Bobby's Hobbies

We've created a database of people and hobbies, and each row in hobbies is related to a row in persons via the person_id column. 
*/

CREATE TABLE persons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    age INTEGER);
    
INSERT INTO persons (name, age) VALUES ("Bobby McBobbyFace", 12);
INSERT INTO persons (name, age) VALUES ("Lucy BoBucie", 25);
INSERT INTO persons (name, age) VALUES ("Banana FoFanna", 14);
INSERT INTO persons (name, age) VALUES ("Shish Kabob", 20);
INSERT INTO persons (name, age) VALUES ("Fluffy Sparkles", 8);

CREATE table hobbies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person_id INTEGER,
    name TEXT);
    
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");

/*
STEP 1
In this first step, insert one more row in persons and then one more row in hobbies that is related to the newly inserted person.
*/

INSERT INTO persons (name, age) VALUES ("Dustin Husky", 3);

INSERT INTO hobbies (person_id, name) VALUES (5, "barking");

/*
STEP 2
Now, select the 2 tables with a join so that you can see each person's name next to their hobby.
*/

SELECT persons.name, hobbies.name FROM persons
    JOIN hobbies
    ON persons.id = hobbies.person_id;

/*
STEP 3
Now, add an additional query that shows only the name and hobbies of 'Bobby McBobbyFace', using JOIN combined with WHERE.
*/

SELECT persons.name, hobbies.name FROM persons
    JOIN hobbies
    ON persons.id = hobbies.person_id
    WHERE persons.name = "Bobby McBobbyFace";

/*
2️⃣ Challenge: Customer's orders

We've created a database for customers and their orders. Not all of the customers have made orders, however. 
*/

CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT);
    
INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    item TEXT,
    price REAL);

INSERT INTO orders (customer_id, item, price)
    VALUES (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (2, "High Quality Broomstick", 40.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (1, "TARDIS", 1000000.00);

/*
STEP 1
Come up with a query that lists the name and email of every customer followed by the item and price of orders they've made.
Use a LEFT OUTER JOIN so that a customer is listed even if they've made no orders, and don't add any ORDER BY.
*/

SELECT customers.name, customers.email, orders.item, orders.price
FROM customers
LEFT OUTER JOIN orders
ON customers.id = orders.customer_id;

/*
STEP 2
Now, create another query that will result in one row per each customer, with their name, email, and total amount of money they've spent on orders.
Sort the rows according to the total money spent, from the most spent to the least spent.
*/

SELECT customers.name, customers.email, SUM(orders.price)
FROM customers
LEFT OUTER JOIN orders
ON customers.id = orders.customer_id
GROUP BY name
ORDER BY price DESC;

/*
3️⃣ Challenge: Sequels in SQL

We've created a table with all the 'Harry Potter' movies, with a sequel_id column that matches the id of the sequel for each movie. 
*/

CREATE TABLE movies (id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    released INTEGER,
    sequel_id INTEGER);

INSERT INTO movies 
    VALUES (1, "Harry Potter and the Philosopher's Stone", 2001, 2);
INSERT INTO movies 
    VALUES (2, "Harry Potter and the Chamber of Secrets", 2002, 3);
INSERT INTO movies 
    VALUES (3, "Harry Potter and the Prisoner of Azkaban", 2004, 4);
INSERT INTO movies 
    VALUES (4, "Harry Potter and the Goblet of Fire", 2005, 5);
INSERT INTO movies 
    VALUES (5, "Harry Potter and the Order of the Phoenix ", 2007, 6);
INSERT INTO movies 
    VALUES (6, "Harry Potter and the Half-Blood Prince", 2009, 7);
INSERT INTO movies 
    VALUES (7, "Harry Potter and the Deathly Hallows – Part 1", 2010, 8);
INSERT INTO movies 
    VALUES (8, "Harry Potter and the Deathly Hallows – Part 2", 2011, NULL);

/*
STEP 1
Issue a SELECT that will show the title of each movie next to its sequel's title (or NULL if it doesn't have a sequel).
*/

SELECT movies.title AS "movie_title", sequel.title AS "sequel_title"
    FROM movies
    LEFT OUTER JOIN movies sequel
    ON movies.sequel_id = sequel.id;

/*
4️⃣ Challenge: FriendBook

We've created a database for a friend networking site, with a table storing data on each person, a table on each person's hobbies, and a table of friend connections between the people. 
*/

CREATE TABLE persons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname TEXT,
    age INTEGER);
    
INSERT INTO persons (fullname, age) VALUES ("Bobby McBobbyFace", "12");
INSERT INTO persons (fullname, age) VALUES ("Lucy BoBucie", "25");
INSERT INTO persons (fullname, age) VALUES ("Banana FoFanna", "14");
INSERT INTO persons (fullname, age) VALUES ("Shish Kabob", "20");
INSERT INTO persons (fullname, age) VALUES ("Fluffy Sparkles", "8");

CREATE table hobbies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person_id INTEGER,
    name TEXT);
    
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");

CREATE table friends (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person1_id INTEGER,
    person2_id INTEGER);

INSERT INTO friends (person1_id, person2_id)
    VALUES (1, 4);
INSERT INTO friends (person1_id, person2_id)
    VALUES (2, 3);

/*
STEP 1
In this first step, use a JOIN to display a table showing people's names with their hobbies.
*/

SELECT persons.fullname, hobbies.name
    FROM persons
    JOIN hobbies
    ON persons.id = hobbies.person_id;

/*
STEP 2
Now, use another SELECT with a JOIN to show the names of each pair of friends, based on the data in the friends table.
*/

SELECT a.fullname, b.fullname FROM friends 
    JOIN persons a
    ON friends.person1_id = a.id
    JOIN persons b
    ON friends.person2_id = b.id;

/*
5️⃣ Project: Famous people

In this project, you’re going to make your own table with some small set of “famous people”,
then make more tables about things they do and join those to create nice human readable lists. 
*/

/* Create table about the people and what they do here */
CREATE TABLE cartoons (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, nationality TEXT);

INSERT INTO cartoons (name, age, nationality) VALUES ("Peppa Pig", 5, "British");
INSERT INTO cartoons (name, age, nationality) VALUES ("Mickey Mouse", 95, "American");
INSERT INTO cartoons (name, age, nationality) VALUES ("Bugs Bunny", 80, "American");
INSERT INTO cartoons (name, age, nationality) VALUES ("SpongeBob", 24, "American (underwater)");
INSERT INTO cartoons (name, age, nationality) VALUES ("Bart Simpson", 10, "American");
INSERT INTO cartoons (name, age, nationality) VALUES ("Naruto Uzumaki", 17, "Japanese");
INSERT INTO cartoons (name, age, nationality) VALUES ("Goku", 45, "Japanese");
INSERT INTO cartoons (name, age, nationality) VALUES ("Scoobi-Doo", 7, "American");
INSERT INTO cartoons (name, age, nationality) VALUES ("Shrek", 30, "American");
INSERT INTO cartoons (name, age, nationality) VALUES ("Bonald Duck", 89, "American");
INSERT INTO cartoons (name, age, nationality) VALUES ("Lucy van Pelt", 8, "American");
INSERT INTO cartoons (name, age, nationality) VALUES ("Charlie Brown", 8, "American");
INSERT INTO cartoons (name, age, nationality) VALUES ("Tommy Pickles", 1, "American");
INSERT INTO cartoons (name, age, nationality) VALUES ("Homer Simpson", 39, "American");
INSERT INTO cartoons (name, age, nationality) VALUES ("Blossom", 6, "American");


CREATE TABLE show (id INTEGER PRIMARY KEY AUTOINCREMENT, cartoons_id INTEGER, name TEXT, year_released INTEGER);

INSERT INTO show (cartoons_id, name, year_released) VALUES (1, "Peppa Pig", 2004);
INSERT INTO show (cartoons_id, name, year_released) VALUES (2, "Mickey Mouse Clubhouse", 2006);
INSERT INTO show (cartoons_id, name, year_released) VALUES (3, "Looney Tunes", 1930);
INSERT INTO show (cartoons_id, name, year_released) VALUES (4, "SpongeBob SquarePants", 1999);
INSERT INTO show (cartoons_id, name, year_released) VALUES (5, "The Simpsons", 1989);
INSERT INTO show (cartoons_id, name, year_released) VALUES (6, "Naruto", 2002);
INSERT INTO show (cartoons_id, name, year_released) VALUES (7, "Dragon Ball Z", 1089);
INSERT INTO show (cartoons_id, name, year_released) VALUES (8, "Scooby-Doo, Where Are You!", 1969);
INSERT INTO show (cartoons_id, name, year_released) VALUES (9, "Shrek (movie series)", 2001);
INSERT INTO show (cartoons_id, name, year_released) VALUES (10, "DuckTales", 1987);
INSERT INTO show (cartoons_id, name, year_released) VALUES (11, "Peanuts", 1965);
INSERT INTO show (cartoons_id, name, year_released) VALUES (12, "Peanuts", 1965);
INSERT INTO show (cartoons_id, name, year_released) VALUES (13, "Rugrats", 1991);
INSERT INTO show (cartoons_id, name, year_released) VALUES (14, "The Simpsons", 1989);
INSERT INTO show (cartoons_id, name, year_released) VALUES (15, "The Powerpuff Girls", 1998);

CREATE TABLE genre (id INTEGER PRIMARY KEY AUTOINCREMENT, show_id INTEGER, genre TEXT);

INSERT INTO genre (show_id, genre) VALUES (1, "Children's, Comedy, Educational");
INSERT INTO genre (show_id, genre) VALUES (2, "Comedy, Animated Shorts");
INSERT INTO genre (show_id, genre) VALUES (3, "Comedy, Slapstick, Family");
INSERT INTO genre (show_id, genre) VALUES (4, "Comedy, Satire, Adult Animation");
INSERT INTO genre (show_id, genre) VALUES (5, "Action, Adventure, Fantasy");
INSERT INTO genre (show_id, genre) VALUES (6, "Action, Adventure, Martial Arts");
INSERT INTO genre (show_id, genre) VALUES (7, "Children's, Comedy, Educational");
INSERT INTO genre (show_id, genre) VALUES (8, "Mystery, Comedy, Adventure");
INSERT INTO genre (show_id, genre) VALUES (9, "Comedy, Fairy Tale Parody");
INSERT INTO genre (show_id, genre) VALUES (10, "Action, Adventure, Comedy");
INSERT INTO genre (show_id, genre) VALUES (11, "Comedy, Slice of Life, Family");
INSERT INTO genre (show_id, genre) VALUES (12, "Comedy, Slice of Life, Family");
INSERT INTO genre (show_id, genre) VALUES (13, "Children's, Comedy, Family");
INSERT INTO genre (show_id, genre) VALUES (14, "Comedy, Satire, Adult Animation");
INSERT INTO genre (show_id, genre) VALUES (15, "Action, Comedy, Superhero");

/* Cartoons, designated shows, and genre */
SELECT cartoons.name AS cartoon_name, show.name AS show_name, genre.genre
    FROM cartoons
    JOIN show
    ON cartoons.id = show.cartoons_id
    JOIN genre
    ON show.id = genre.show_id;
