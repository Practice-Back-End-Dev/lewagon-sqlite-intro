-- To run this code import 'tmdbmovies.sqlite' to the online sql ide (https://sqliteonline.com/) --
-- Prentending we're working in the file ... ---

#BASIC QUERIES
# Count the number of movies in the db
SELECT count(*) FROM movies

# Find specific directors (like James Cameron)
SELECT * FROM directors
WHERE name = 'James Cameron';

# Find all directors with names that start with 'Steve'
SELECT * FROM directors
WHERE name LIKE 'Steven%';

# Find the women directors
SELECT name from directors
WHERE gender = 1

# Find the name of the 10th first woman director
SELECT name FROM directors
WHERE gender = 1
LIMIT 10;


#ADVANCED QUERIES
# Find the three most popular movies
SELECT original_title, popularity FROM movies
ORDER BY popularity DESC
LIMIT 3;

#Find the three most bankable movies
SELECT original_title, revenue FROM movies
ORDER BY revenue DESC
LIMIT 3;

# Find the most awarded average vote since January 1st, 2020
SELECT vote_average, COUNT(*) AS counter FROM movies
WHERE release_date > '2000-01-01'
GROUP BY vote_average
ORDER BY counter DESC;


#HARDER QUERIES
# Which movie(s) were directed by 'James Cameron'
SELECT movies.original_title FROM movies
JOIN directors ON directors.id = movies.director_id
WHERE directors.name = 'Brenda Chapman';

# Which director made the most movies?
SELECT directors.name, count(movies.id) AS counter FROM movies
JOIN directors ON directors.id = movies.director_id
GROUP BY directors.name
ORDER BY counter DESC;

# Which director is the most bankable ...
SELECT directors.name, SUM(movies.revenue) AS revenues FROM movies
JOIN directors ON directors.id = movies.director_id
GROUP BY directors.name
ORDER BY revenues DESC;




