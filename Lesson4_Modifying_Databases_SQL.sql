/*
1️⃣ Challenge: Dynamic Documents

We've created a database for a documents app, with rows for each document with it's title, content, and author.
*/

CREATE table documents (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    content TEXT,
    author TEXT);
    
INSERT INTO documents (author, title, content)
    VALUES ("Puff T.M. Dragon", "Fancy Stuff", "Ceiling wax, dragon wings, etc.");
INSERT INTO documents (author, title, content)
    VALUES ("Puff T.M. Dragon", "Living Things", "They're located in the left ear, you know.");
INSERT INTO documents (author, title, content)
    VALUES ("Jackie Paper", "Pirate Recipes", "Cherry pie, apple pie, blueberry pie.");
INSERT INTO documents (author, title, content)
    VALUES ("Jackie Paper", "Boat Supplies", "Rudder - guitar. Main mast - bed post.");
INSERT INTO documents (author, title, content)
    VALUES ("Jackie Paper", "Things I'm Afraid Of", "Talking to my parents, the sea, giant pirates, heights.");

/*
STEP 1
In this first step, use UPDATE to change the author to 'Jackie Draper' for all rows where it's currently 'Jackie Paper'.
Then re-select all the rows to make sure the table changed like you expected.
*/

SELECT * FROM documents;

UPDATE documents SET author = "Jackie Draper" WHERE author = "Jackie Paper";

SELECT * FROM documents;

/*
STEP 2
Now you'll delete a row, being very careful not to delete all the rows. Only delete the row where the title is 'Things I'm Afraid Of'.
Then re-select all the rows to make sure the table changed like you expected.
*/

DELETE FROM documents WHERE title = "Things I'm Afraid Of";

SELECT * FROM documents;

/*
2️⃣ Challenge: Clothing alterations

We've created a database of clothes, and decided we need a price column.
*/

CREATE TABLE clothes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    design TEXT);
    
INSERT INTO clothes (type, design)
    VALUES ("dress", "pink polka dots");
INSERT INTO clothes (type, design)
    VALUES ("pants", "rainbow tie-dye");
INSERT INTO clothes (type, design)
    VALUES ("blazer", "black sequin");

/*
STEP 1
Use ALTER to add a 'price' column to the table. Then select all the columns in each row to see what your table looks like now.
*/

ALTER TABLE clothes ADD price INTEGER;

SELECT * FROM clothes;

/*
STEP 2
Now assign each item a price, using UPDATE - item 1 should be 10 dollars, item 2 should be 20 dollars, item 3 should be 30 dollars.
When you're done, do another SELECT of all the rows to check that it worked as expected.
*/

UPDATE clothes SET price = 10 WHERE id = 1;
UPDATE clothes SET price = 20 WHERE id = 2;
UPDATE clothes SET price = 30 WHERE id = 3;

SELECT * FROM clothes;

/*
STEP 3
Now insert a new item into the table that has all three attributes filled in, including 'price'. Do one final SELECT of all the rows to check it worked.
*/

INSERT INTO clothes (type, design, price) VALUES ("skirt", "white hello kitty", 40);

SELECT * FROM clothes;

/*
3️⃣ Project: App impersonator

Think about your favorite apps, and pick one that stores your data- like a game that stores scores, an app that lets you post updates, etc.
Now in this project, you're going to imagine that the app stores your data in a SQL database (which is pretty likely!), and write SQL statements that might look like their own SQL.

CREATE a table to store the data.
INSERT a few example rows in the table.
Use an UPDATE to emulate what happens when you edit data in the app.
Use a DELETE to emulate what happens when you delete data in the app.
*/

/* What does the app's SQL look like? */
CREATE TABLE myfitnesspal (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    calories_in INTEGER, 
    steps TEXT, 
    water_oz TEXT);

INSERT INTO myfitnesspal (calories_in, steps, water_oz) VALUES (1350, "10K", "60 OZ");
INSERT INTO myfitnesspal (calories_in, steps, water_oz) VALUES (1400, "15K", "84 OZ");
INSERT INTO myfitnesspal (calories_in, steps, water_oz) VALUES (2000, "1K", "0 OZ");
INSERT INTO myfitnesspal (calories_in, steps, water_oz) VALUES (1300, "17K", "100 OZ");


CREATE TABLE exercise (id INTEGER PRIMARY KEY AUTOINCREMENT, myfitnesspal_id INTEGER, workout_type TEXT, duration_hr TEXT, calories_out INTEGER);

INSERT INTO exercise (myfitnesspal_id, workout_type, duration_hr, calories_out) VALUES (1, "strength training", "2.5", 900);
INSERT INTO exercise (myfitnesspal_id, workout_type, duration_hr, calories_out) VALUES (2, "stairmaster", "1", 500);
INSERT INTO exercise (myfitnesspal_id, workout_type, duration_hr, calories_out) VALUES (3, "abs", ".5", 250);
INSERT INTO exercise (myfitnesspal_id, workout_type, duration_hr, calories_out) VALUES (4, "strength training", "3", 1100);

/* Show calories in, workouts, and ccalories out */

SELECT myfitnesspal.calories_in, exercise.workout_type, exercise.calories_out
    FROM myfitnesspal
    JOIN exercise
    ON myfitnesspal.id = exercise.myfitnesspal_id;
    
/* Add a day column */

ALTER TABLE myfitnesspal ADD day TEXT DEFAULT unknown;

SELECT * FROM myfitnesspal; 

/* Update the day column */

UPDATE myfitnesspal SET day = "Monday" WHERE id=1;
UPDATE myfitnesspal SET day = "Tuesday" WHERE id=2;
UPDATE myfitnesspal SET day = "Wednesday" WHERE id=3;
UPDATE myfitnesspal SET day = "Thursday" WHERE id=4;

SELECT myfitnesspal.day, myfitnesspal.calories_in, exercise.workout_type, exercise.calories_out
    FROM myfitnesspal
    JOIN exercise
    ON myfitnesspal.id = exercise.myfitnesspal_id;

/* Delete Wednesday log, add Wednesday workout and calories out to Tuesday */

DELETE FROM exercise WHERE id = 3;

UPDATE exercise SET workout_type = "stairmaster, abs", calories_out = 750 WHERE id = 2;

SELECT myfitnesspal.day, myfitnesspal.calories_in, exercise.workout_type, exercise.calories_out
    FROM myfitnesspal
    JOIN exercise
    ON myfitnesspal.id = exercise.myfitnesspal_id;
