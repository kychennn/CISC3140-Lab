-- create a database
sqlite3 lab2.db

-- Import the sample data into these tables in an SQLite3 database
DROP TABLE IF EXISTS data_import;

CREATE TABLE data_import (
Timestamp DATETIME,
Email TEXT,
Name TEXT,
Year INT,
Make TEXT,
Model TEXT,
Car_ID INT,
Judge_ID TEXT,
Judge_Name TEXT,
Racer_Turbo INT,
Racer_Supercharged INT,
Racer_Performance INT,
Racer_Horsepower INT,
Car_Overall INT,
Engine_Modifications INT,
Engine_Performance INT,
Engine_Chrome INT,
Engine_Detailing INT,
Engine_Cleanliness INT,
Body_Frame_Undercarriage INT,
Body_Frame_Suspension INT,
Body_Frame_Chrome INT,
Body_Frame_Detailing INT,
Body_Frame_Cleanliness INT,
Mods_Paint INT,
Mods_Body INT,
Mods_Wrap INT,
Mods_Rims INT,
Mods_Interior INT,
Mods_Other INT,
Mods_ICE INT,
Mods_Aftermarket INT,
Mods_WIP INT,
Mods_Overall INT
);


-- Import a CSV File Into an SQLite Table
.mode csv
.import data_lab2/data.csv data_import


-- Export SQLite Database To a CSV File
.headers on
.mode csv
.output Lab2/data_import.csv
SELECT * FROM data_import;




-- 2.1
DROP TABLE IF EXISTS Cars;

CREATE TABLE Cars(
Car_ID INT PRIMARY KEY,
Year INT,
Make TEXT,
Model TEXT,
Name TEXT,
Email TEXT
);

-- 1 means true
INSERT INTO Cars (Car_ID, Year, Make, Model, Name, Email) SELECT Car_ID, Year, Make, Model, Name, Email
FROM data_import WHERE 1;


.headers on
.mode csv
.output Lab2/Cars.csv
SELECT * FROM Cars;





-- 2.2 
DROP TABLE IF EXISTS Judges;

CREATE TABLE Judges(
Judge_ID TEXT,
Judge_Name TEXT
);

INSERT INTO Judges (Judge_ID, Judge_Name) SELECT Judge_ID, Judge_Name
FROM data_import WHERE 1;


.headers on
.mode csv
.output Lab2/Judges.csv
SELECT * FROM Judges;









-- 2.3
DROP TABLE IF EXISTS Car_Score;
CREATE TABLE Car_Score(
Car_ID INT PRIMARY KEY,
Racer_Turbo INT,
Racer_Supercharged INT,
Racer_Performance INT,
Racer_Horsepower INT,
Car_Overall INT,
Engine_Modifications INT,
Engine_Performance INT,
Engine_Chrome INT, 
Engine_Detailing INT,
Engine_Cleanliness INT,
Body_Frame_Undercarriage INT,
Body_Frame_Suspension INT,
Body_Frame_Chrome INT,
Body_Frame_Detailing INT,
Body_Frame_Cleanliness INT,
Mods_Paint INT,
Mods_Body INT,
Mods_Wrap INT,
Mods_Rims INT,
Mods_Interior INT,
Mods_Other INT,
Mods_ICE INT,
Mods_Aftermarket INT,
Mods_WIP INT,
Mods_Overall INT
);


INSERT INTO Car_Score (Car_ID, Racer_Turbo, Racer_Supercharged, Racer_Performance, Racer_Horsepower, Car_Overall, Engine_Modifications, Engine_Performance, Engine_Chrome, Engine_Detailing, Engine_Cleanliness, Body_Frame_Undercarriage, Body_Frame_Suspension, Body_Frame_Chrome, Body_Frame_Detailing, Body_Frame_Cleanliness, Mods_Paint, Mods_Body, Mods_Wrap, Mods_Rims, Mods_Interior, Mods_Other, Mods_ICE, Mods_Aftermarket, Mods_WIP, Mods_Overall) SELECT Car_ID, Racer_Turbo, Racer_Supercharged, Racer_Performance, Racer_Horsepower, Car_Overall, Engine_Modifications, Engine_Performance, Engine_Chrome, Engine_Detailing, Engine_Cleanliness, Body_Frame_Undercarriage, Body_Frame_Suspension, Body_Frame_Chrome, Body_Frame_Detailing, Body_Frame_Cleanliness, Mods_Paint, Mods_Body, Mods_Wrap, Mods_Rims, Mods_Interior, Mods_Other, Mods_ICE, Mods_Aftermarket, Mods_WIP, Mods_Overall
FROM _csv_import WHERE 1;

.headers on
.mode csv
.output Lab2/Car_Score.csv
SELECT * FROM Car_Score;









--2.1 Present the list in descending order using the total column
-- add all scores together
DROP TABLE IF EXISTS Total_Score;

CREATE TABLE Total_Score (
Car_ID INT,
Year INT,
Make TEXT,
Model TEXT,
Score INT
);


INSERT INTO Total_Score (Car_ID, Year, Make, Model, Score) SELECT Car_ID, Year, Make, Model, SUM(Racer_Turbo + Racer_Supercharged + Racer_Performance + Racer_Horsepower + Car_Overall + Engine_Modifications + Engine_Performance + Engine_Chrome + Engine_Detailing + Engine_Cleanliness + Body_Frame_Undercarriage + Body_Frame_Suspension + Body_Frame_Chrome + Body_Frame_Detailing + Body_Frame_Cleanliness + Mods_Paint + Mods_Body + Mods_Wrap + Mods_Rims + Mods_Interior + Mods_Other + Mods_ICE + Mods_Aftermarket + Mods_WIP + Mods_Overall)
FROM data_import
GROUP BY rowid
;


-- ranking without a new ranking column
DROP TABLE IF EXISTS Rank_Temp;
CREATE TABLE Rank_Temp (
Car_ID INT,
Year INT,
Make TEXT,
Model TEXT,
Score INT
);


INSERT INTO Rank_Temp (Car_ID, Year, Make, Model, Score) SELECT Car_ID, Year, Make, Model, Score
FROM Total_Score
ORDER BY Score DESC;



-- add rank column
DROP TABLE IF EXISTS Rank;
CREATE TABLE Rank (
Rank INT,
Car_ID INT,
Year INT,
Make TEXT,
Model TEXT,
Score INT
);


INSERT INTO Rank(Rank, Car_ID, Year, Make, Model, Score) SELECT rowid, Car_ID, Year, Make, Model, Score FROM Rank_Temp;



.headers on
.mode csv
.output Lab2/extract1.csv
SELECT * FROM Rank;





-- 2.2
DROP TABLE IF EXISTS Rank_Make;
CREATE TABLE Rank_Make (
Rank INT,
Car_ID INT,
Year INT,
Make TEXT,
Model TEXT,
Score INT
);

INSERT INTO Rank_Make(Rank, Car_ID, Year, Make, Model, Score) SELECT Rank, Car_ID, Year, Make, Model, Score 
FROM Rank 
ORDER BY Make;



DROP TABLE IF EXISTS Top_Three;
CREATE TABLE Top_Three (
Rank INT,
Car_ID INT,
Year INT,
Make TEXT,
Model TEXT,
Score INT
);

INSERT INTO Top_Three (Rank, Car_ID, Year, Make, Model, Score)
select *
from Rank_Make
where (
   select count(*) from Rank_Make as f
   where f.Make = Rank_Make.Make and f.Rank <= Rank_Make.Rank
) <= 3;


.headers on
.mode csv
.output Lab2/extract2.csv
SELECT * FROM Top_Three;





--2.3

DROP TABLE IF EXISTS Judges;
CREATE TABLE Judges(
Timestamp DATETIME,
Judge_ID TEXT,
Judge_Name TEXT
);

INSERT INTO Judges (Timestamp, Judge_ID, Judge_Name) SELECT Timestamp, Judge_ID, Judge_Name
FROM data_import WHERE 1;

SELECT julianday('now') - julianday('1776-07-04');

UPDATE Judges SET Timestamp = SUBSTR(Timestamp, 5, 4) || "-0" || SUBSTR(Timestamp, 1,1) || "-0" || SUBSTR(Timestamp, 3, 1) || " " || SUBSTR(Timestamp, 10, 2) || ":" || SUBSTR(Timestamp, 13, 2);






DROP TABLE IF EXISTS Judges_Day;
CREATE TABLE Judges_Day (
Judge_ID TEXT,
Judge_Name TEXT,
Total_Cars INT,
Start_Timestamp DATETIME,
End_Timestamp DATETIME,
Duration_Minutes INT,
Average INT
);



INSERT INTO Judges_Day(Judge_ID, Judge_Name, Total_Cars, Start_Timestamp, End_Timestamp, Duration_Minutes, Average) SELECT Judge_ID, Judge_Name, COUNT(Timestamp) AS Total_Cars, MIN(Timestamp) AS Start_Timestamp, MAX(Timestamp) AS End_Timestamp, CAST((JULIANDAY(MAX(Timestamp)) - JULIANDAY(MIN(Timestamp)))*24*60 AS INT) AS  Duration_Minutes, CAST(((JULIANDAY(MAX(Timestamp)) - JULIANDAY(MIN(Timestamp)))*24*60) AS INT) / COUNT(Timestamp) as Average
FROM Judges 
GROUP BY Judge_ID;


.headers on
.mode csv
.output Lab2/extract3.csv
SELECT * FROM Judges_Day;

