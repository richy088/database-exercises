USE codeup_test_db;

# Selects all entries in album table
SELECT * FROM album;

# outputs all albums before 1992
SELECT record_name
FROM album
WHERE release_date < 1992;

# output all albums released by Backstreet boys
SELECT record_name
FROM album
WHERE artist = 'Backstreet Boys';

# make 2pac album sales ten times more popular
UPDATE album
SET sales = sales * 10
WHERE id = 1;

# move all the albums before 1980 back to the 1800s
UPDATE album
SET release_date = 1800
WHERE id > 0;

# change 'Celin Dion' to 'Britney Spears'
UPDATE album
SET artist = 'Britney Spears'
WHERE id = 5;

