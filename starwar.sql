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

