USE codeup_test_db;

# should output all artists
SELECT artist FROM album;

# gets all albums from Celin Dion
SELECT record_name
FROM album
WHERE artist = 'Celin Dion';

# release date for Celin Dion album
SELECT release_date
FROM album
WHERE artist = 'Celin Dion';

# The genre for Falling into You
SELECT genre
FROM album
WHERE record_name = 'Falling into You';

# albums released after 1995
SELECT record_name
FROM album
WHERE release_date > 1995;

# Which albums had less than 1 million certified sales
SELECT record_name
FROM album
WHERE sales < 1;

# All the albums with a genre of "pop". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT record_name
FROM album
WHERE genre = 'pop';

# have to be very specific with String inputs