DROP DATABASE IF EXISTS starwar;
CREATE DATABASE starwar;
USE starwar;

-- Create Table TimeTable
DROP TABLE IF EXISTS TimeTable;
CREATE TABLE TimeTable(
    Character_Name varchar(100),
    Planet_Name varchar(100),
    Movie integer,
    Time_of_Arrival integer,
    Time_of_Departure integer
);

LOAD DATA LOCAL INFILE "data/TimeTable.csv" INTO TABLE TimeTable
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Character_Name, Planet_Name, Movie, Time_of_Arrival, Time_of_Departure);

-- Create Table Characters
DROP TABLE IF EXISTS Characters;
CREATE TABLE Characters(
    Name varchar(100),
    Race varchar(100),
    Homeworld varchar(100),
    Affiliation varchar(100)
);

LOAD DATA LOCAL INFILE "data/Characters.csv" INTO TABLE Characters
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Name, Race, Homeworld, Affiliation);

-- Create Table Planets
DROP TABLE IF EXISTS Planets;
CREATE TABLE Planets(
    Name varchar(100),
    Type varchar(100),
    Affiliation varchar(100)
);

LOAD DATA LOCAL INFILE "data/Planets.csv" INTO TABLE Planets
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Name, Type, Affiliation);

/*
Since the answer of the homework might not release before finals,
We prepare some exercises for you to practice:

Exercise1: Who had been to Endor in movie 3?

TA reference answer 1:
SELECT DISTINCT T.Character_Name FROM TimeTable AS T
WHERE T.Planet_Name = "Endor" AND T.Movie = 3;


Exercise2: Who visited his/her homeworld in movie 3?

TA reference answer 2:
SELECT DISTINCT T.Character_Name FROM TimeTable T, Characters C
WHERE C.Name = T.Character_Name AND T.Planet_Name = C.Homeworld AND T.Movie = 3;


Exercise3: Show the characters names and the total time they spent in each planet among the movies.

TA reference answer 3:
SELECT T.Character_Name, SUM(T.Time_of_Departure - T.Time_of_Arrival) FROM TimeTable T
GROUP BY T.Character_Name;


Exercise4: List the planets and movies Luke Skywalker has been to at the same time there is at least one human on the planet, too?

TA reference answer 4:
SELECT T_Luke.Planet_Name, T_Luke.Movie
FROM 
    TimeTable T_Luke
WHERE 
    T_Luke.Character_Name = 'Luke Skywalker' AND 
    EXISTS (
        SELECT * FROM TimeTable T
        WHERE
        T.Character_Name != 'Luke Skywalker' AND 
        T.Planet_Name = T_Luke.Planet_Name AND 
        T.Movie = T_Luke.Movie AND
        T.Time_of_Departure >= T_Luke.Time_of_Arrival AND 
        T.Time_of_Arrival <= T_Luke.Time_of_Departure AND
        T.Character_Name IN (SELECT C.Name FROM Characters C
                             WHERE C.Race = 'Human')
    )
;

Some more instructions you might use: JOIN, COUNT, NOT and MAX.
Best Luck to you!

*/
