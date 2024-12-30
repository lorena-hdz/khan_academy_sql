/*
Challenge: Book list database

STEP 1
What are your favorite books? You can make a database table to store them in!
In this first step, create a table to store your list of books. It should have columns for id, name, and rating.
*/

CREATE TABLE favorite_books (id INTEGER PRIMARY KEY, name TEXT, rating INTEGER);

/* STEP 2
Now, add three of your favorite books into the table.
*/

INSERT INTO favorite_books VALUES (1, "Calculus I", 5);
INSERT INTO favorite_books VALUES (2, "Calculus II", 5);
INSERT INTO favorite_books VALUES (3, "Calulus III", 5);
