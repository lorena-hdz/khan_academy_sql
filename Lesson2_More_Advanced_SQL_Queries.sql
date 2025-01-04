/*
1️⃣ Challenge: Karaoke song selector

Ever sung karaoke? It's a place where you sing songs with your friends, and it's a lot of fun.
We've created a table with songs, and in this challenge, you'll use queries to decide what songs to sing.
*/

CREATE TABLE songs (
    id INTEGER PRIMARY KEY,
    title TEXT,
    artist TEXT,
    mood TEXT,
    duration INTEGER,
    released INTEGER);
    
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Bohemian Rhapsody", "Queen", "epic", 60, 1975);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Let it go", "Idina Menzel", "epic", 227, 2013);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("I will survive", "Gloria Gaynor", "epic", 198, 1978);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Twist and Shout", "The Beatles", "happy", 152, 1963);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("La Bamba", "Ritchie Valens", "happy", 166, 1958);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("I will always love you", "Whitney Houston", "epic", 273, 1992);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Sweet Caroline", "Neil Diamond", "happy", 201, 1969);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Call me maybe", "Carly Rae Jepsen", "happy", 193, 2011);

/*
STEP 1
For the first step, select all the song titles.
*/

SELECT title FROM songs;

/*
STEP 2
Add another SELECT that uses OR to show the titles of the songs that have an 'epic' mood or a release date after 1990.
*/

SELECT title FROM songs 
  WHERE mood = "epic" OR released > 1990; 

/*
STEP 3
Add another SELECT that uses AND to show the titles of songs that are 'epic', and released after 1990, and less than 4 minutes long.
Note that the duration column is measured in seconds.
*/

SELECT title FROM songs
  WHERE mood = "epic" AND released > 1990 AND duration < 240;

/*
2️⃣ Challenge: Playlist maker

We've created a database of songs and artists, and you'll make playlists from them in this challenge.
*/

CREATE TABLE artists (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    country TEXT,
    genre TEXT);

INSERT INTO artists (name, country, genre)
    VALUES ("Taylor Swift", "US", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Led Zeppelin", "US", "Hard rock");
INSERT INTO artists (name, country, genre)
    VALUES ("ABBA", "Sweden", "Disco");
INSERT INTO artists (name, country, genre)
    VALUES ("Queen", "UK", "Rock");
INSERT INTO artists (name, country, genre)
    VALUES ("Celine Dion", "Canada", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Meatloaf", "US", "Hard rock");
INSERT INTO artists (name, country, genre)
    VALUES ("Garth Brooks", "US", "Country");
INSERT INTO artists (name, country, genre)
    VALUES ("Shania Twain", "Canada", "Country");
INSERT INTO artists (name, country, genre)
    VALUES ("Rihanna", "US", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Guns N' Roses", "US", "Hard rock");
INSERT INTO artists (name, country, genre)
    VALUES ("Gloria Estefan", "US", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Bob Marley", "Jamaica", "Reggae");

CREATE TABLE songs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    artist TEXT,
    title TEXT);

INSERT INTO songs (artist, title)
    VALUES ("Taylor Swift", "Shake it off");
INSERT INTO songs (artist, title)
    VALUES ("Rihanna", "Stay");
INSERT INTO songs (artist, title)
    VALUES ("Celine Dion", "My heart will go on");
INSERT INTO songs (artist, title)
    VALUES ("Celine Dion", "A new day has come");
INSERT INTO songs (artist, title)
    VALUES ("Shania Twain", "Party for two");
INSERT INTO songs (artist, title)
    VALUES ("Gloria Estefan", "Conga");
INSERT INTO songs (artist, title)
    VALUES ("Led Zeppelin", "Stairway to heaven");
INSERT INTO songs (artist, title)
    VALUES ("ABBA", "Mamma mia");
INSERT INTO songs (artist, title)
    VALUES ("Queen", "Bicycle Race");
INSERT INTO songs (artist, title)
    VALUES ("Queen", "Bohemian Rhapsody");
INSERT INTO songs (artist, title)
    VALUES ("Guns N' Roses", "Don't cry");

/*
STEP 1
In this first step, select the title of all the songs by the artist named 'Queen'.
*/

SELECT title FROM songs 
  WHERE artist = "Queen";

/*
STEP 2
Now you'll make a 'Pop' playlist. In preparation, select the name of all of the artists from the 'Pop' genre.
*/

SELECT name FROM artists 
  WHERE genre = "Pop";

/*
STEP 3
To finish creating the 'Pop' playlist, add another query that will select the title of all the songs from the 'Pop' artists.
It should use IN on a nested subquery that's based on your previous query.
*/

SELECT title FROM songs 
   WHERE artist IN (
                    SELECT name FROM artists 
                       WHERE genre = "Pop");

/*
3️⃣ Challenge: The wordiest author

We've created a database of a few popular authors and their books, with word counts for each book.
*/

CREATE TABLE books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    author TEXT,
    title TEXT,
    words INTEGER);
    
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Philosopher's Stone", 79944);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Chamber of Secrets", 85141);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Prisoner of Azkaban", 107253);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Goblet of Fire", 190637);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Order of the Phoenix", 257045);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Half-Blood Prince", 168923);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Deathly Hallows", 197651);

INSERT INTO books (author, title, words)
    VALUES ("Stephenie Meyer", "Twilight", 118501);
INSERT INTO books (author, title, words)
    VALUES ("Stephenie Meyer", "New Moon", 132807);
INSERT INTO books (author, title, words)
    VALUES ("Stephenie Meyer", "Eclipse", 147930);
INSERT INTO books (author, title, words)
    VALUES ("Stephenie Meyer", "Breaking Dawn", 192196);
    
INSERT INTO books (author, title, words)
    VALUES ("J.R.R. Tolkien", "The Hobbit", 95022);
INSERT INTO books (author, title, words)
    VALUES ("J.R.R. Tolkien", "Fellowship of the Ring", 177227);
INSERT INTO books (author, title, words)
    VALUES ("J.R.R. Tolkien", "Two Towers", 143436);
INSERT INTO books (author, title, words)
    VALUES ("J.R.R. Tolkien", "Return of the King", 134462);

/*
STEP 1
In this first step, select all the authors who have written more than 1 million words, using GROUP BY and HAVING.
*/

SELECT author, SUM(words) AS total_words 
  FROM books 
  GROUP BY author 
  HAVING total_words > 1000000;

/*
STEP 2
Now select all the authors that write more than an average of 150,000 words per book. 
*/

SELECT author, AVG(words) AS avg_words 
  FROM books 
  GROUP BY author 
  HAVING avg_words > 150000;

/*
4️⃣ Challenge: Gradebook

We've created a database to track student grades, with their name, number grade, and what percent of activities they've completed. 
*/

CREATE TABLE student_grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    number_grade INTEGER,
    fraction_completed REAL);
    
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winston", 90, 0.805);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winnefer", 95, 0.901);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winsteen", 85, 0.906);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Wincifer", 66, 0.7054);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winster", 76, 0.5013);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winstonia", 82, 0.9045);

/*
STEP 1
In this first step, select all of the rows, and display the name, number_grade, and percent_completed,
which you can compute by multiplying and rounding the fraction_completed column.
*/

SELECT name, number_grade, ROUND(100*(fraction_completed)) AS "percent_completed" FROM student_grades;

/*
STEP 2
A table that shows how many students have earned which letter_grade.
*/

SELECT COUNT(*), CASE
    WHEN number_grade > 90 THEN "A"
    WHEN number_grade > 80 THEN "B"
    WHEN number_grade > 70 THEN "C"
    ELSE "F"
    END "letter_grade"
FROM student_grades
GROUP BY letter_grade;

/*
5️⃣ Challenge: Gradebook

Analyze Data from data set and answer questions - Nasa Astronauts
*/

CREATE TABLE astronauts(
   Name                TEXT PRIMARY KEY,
   Year                INTEGER,
   GroupNum            INTEGER,
   Status              TEXT,
   Birth_Date          TEXT,
   Birth_Place         TEXT,
   Gender              TEXT,
   Alma_Mater          TEXT,
   Undergraduate_Major TEXT,
   Graduate_Major      TEXT,
   Military_Rank       TEXT,
   Military_Branch     TEXT,
   Space_Flights       INTEGER,
   Space_Flight_hr     INTEGER,
   Space_Walks         INTEGER,
   Space_Walks_hr      REAL,
   Missions            TEXT,
   Death_Date          TEXT, 
   Death_Mission       TEXT
);

/* Who took part in the Apollo 10 mission? */

SELECT name, missions FROM astronauts WHERE missions LIKE "%Apollo 10%";

/* How many female and male astronauts are still active? */

SELECT gender, COUNT(*), status 
    FROM astronauts WHERE status = "Active"
    GROUP BY gender;

/* Who is the oldest astronaut? */

SELECT name, MIN(year) AS Year_Joined FROM astronauts;

/* How many deceased austronauts didn't go on space_walks? */

SELECT COUNT(*)
    FROM astronauts WHERE status = "Deceased"     AND space_walks = "0";

/* What year(s) had the most/least astronauts? */

SELECT COUNT(name) AS total_astronauts, year
    FROM astronauts
    GROUP BY year
    HAVING total_astronauts > 30;
    
SELECT COUNT(name) AS total_astronauts, year
    FROM astronauts
    GROUP BY year
    HAVING total_astronauts < 10;
    
/* Years Served (2024) */ 

SELECT
    CASE
        WHEN Year < 1960 THEN "Over 64"
        WHEN Year < 1970 THEN "Over 54"
        WHEN Year < 1980 THEN "Over 44"
        WHEN Year < 1990 THEN "Over 34"
        WHEN Year < 2000 THEN "Over 24"
        WHEN Year < 2010 THEN "Over 14"
        WHEN Year IS NULL THEN "Not Identified"
        END AS "Years_Served",
    COUNT (Name) AS "Astronauts"
FROM astronauts
GROUP BY Years_Served
ORDER BY Years_Served DESC;

/* Female listing per status */

SELECT COUNT (Name) AS "Astronauts", Status FROM astronauts WHERE gender = "Female"
GROUP BY Status 
ORDER BY COUNT (Name) DESC;
