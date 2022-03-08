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











