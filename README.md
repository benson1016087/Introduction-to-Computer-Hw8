# Introduction-to-Computer-Hw8

## How to install MySQL

Download the installer in https://dev.mysql.com/downloads/

- For macOS users, download MySQL Server and MySQL Workbench (GUI) separately.
- For Windows users, you can download the installer and execute it.

<img src="images/downloads-1.png" style="zoom:50%;" />
<img src="images/downloads-2.png" style="zoom:50%;" />

## How to build the database

```bash
# cd into this repo
mysql --local-infile=1 -u <username> -p
# Enter password and get into MySQL
source starwar.sql;
```

- Note that using `--local-infile=1` is due to the following errors:

  ```
  ERROR 2068 (HY000): LOAD DATA LOCAL INFILE file request rejected due to restrictions on access.
  ERROR 3948 (42000): Loading local data is disabled; this must be enabled on both the client and server
  ```

  If you still encounter this error, type the following command in MySQL and relaunch.

  ```
  SET GLOBAL local_infile = 1;
  ```

## Exercises:

Since the answer of the homework might not release before finals,
We prepare some exercises for you to practice:

- Exercise1: Who had been to Endor in movie 3?

```sql
SELECT DISTINCT T.Character_Name FROM TimeTable AS T
WHERE T.Planet_Name = "Endor" AND T.Movie = 3;
```

- Exercise2: Who visited his/her homeworld in movie 3?

```sql
SELECT DISTINCT T.Character_Name FROM TimeTable T, Characters C
WHERE C.Name = T.Character_Name AND T.Planet_Name = C.Homeworld AND T.Movie = 3;
```

- Exercise3: Show the characters names and the total time they spent in each planet among the movies.

```sql
SELECT T.Character_Name, SUM(T.Time_of_Departure - T.Time_of_Arrival) FROM TimeTable T
GROUP BY T.Character_Name;
```

- Exercise4: List the planets and movies Luke Skywalker has been to at the same time there is at least one human on the planet, too?

```sql
SELECT T_Luke.Planet_Name, T_Luke.Movie FROM TimeTable T_Luke
WHERE
    T_Luke.Character_Name = 'Luke Skywalker' AND
    EXISTS (
        SELECT \* FROM TimeTable T
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
```

Some more instructions you might use: JOIN, COUNT, NOT and MAX.
Best Luck to you!

## Questions:

You are asked to write SQL queries that answer the questions below (one query per question) and run them with MySQL. Some hints for columns to be selected are shown in the parentheses ().

- Q1: What planets did Princess Leia visit in movie 3?
- Q2: Who visited planets of his/her affiliation in movie 2?
- Q3: Find all characters that never visited any empire planets.
- Q4: How many times for each character to visit his/her homeworld? show character names and times appeared in TimeTable.
- Q5: For each movie, which character(s) visited the highest number of planets?

## Submission

You have to submit 2 files, `result.pdf` and `<Your_student_ID>.txt`:

- `result.pdf`:
  - Contain all 5 **screenshots**
  -
- `<Your_student_ID>.txt`:
