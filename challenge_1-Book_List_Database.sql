/*
1️⃣ 3️⃣ 4️⃣ 5️⃣ 6️⃣Challenge: Book list database

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
