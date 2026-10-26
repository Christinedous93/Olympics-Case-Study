-- =========================
-- Dim_Athlete
-- =========================
CREATE TABLE Dim_Athlete (
    ID INT PRIMARY KEY,
    Name VARCHAR(150),
    Sex CHAR(1),
    Age INT,
    Height INT,
    Weight INT
);

-- =========================
-- Dim_Country
-- =========================
CREATE TABLE Dim_Country (
NOC CHAR(3) NOT NULL,
Country VARCHAR(100) NOT NULL,
 PRIMARY KEY (NOC)
 Alter Table d
);
-- =========================
-- Dim_Event
-- =========================
CREATE TABLE Dim_Event (
    EventID INT PRIMARY KEY,
    Sport VARCHAR(100) NOT NULL,
    Event VARCHAR(150) NOT NULL
);
-- =========================
-- Fact_Olympics_Results
-- =========================

CREATE TABLE Fact_Olympics_Results (
    ID INT PRIMARY KEY,
    EventID INT NOT NULL,
    Year INT NOT NULL,
    Medal VARCHAR(20),
    NOC CHAR(3) NOT NULL,
    FOREIGN KEY (EventID) REFERENCES Dim_Event(EventID),
    FOREIGN KEY (NOC) REFERENCES Dim_Country(NOC)
	
);
select * from Dim_Athlete;
select conname from pg_constraint where conrelid = 'Fact_Olympics_Results'::regclass;
\d Fact_Olympics_Results

SELECT *
FROM dim_event
ORDER BY CAST(SUBSTRING(EventID from 2) DESC 
LIMIT 5;
\d dim_event

