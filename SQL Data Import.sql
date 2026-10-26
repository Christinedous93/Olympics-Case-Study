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
 ALTER Table dim_Country
 ADD Column country VARCHAR(100)
;
-- =========================
-- Dim_Event
-- =========================
CREATE TABLE Dim_Event (
    EventID VARCHAR(10) PRIMARY KEY,
    Sport VARCHAR(100) NOT NULL,
    Event VARCHAR(150) NOT NULL
);
ALTER TABLE Dim_Event Alter Column "EventID" TYPE VARCHAR(10);

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

CREATE TABLE Dim_Event (
    EventID VARCHAR(10) PRIMARY KEY,
    Sport VARCHAR(100) NOT NULL,
    Event VARCHAR(150) NOT NULL);
	Drop Table Dim_Event CASCADE;
	CREATE TABLE Dim_Event (
    EventID VARCHAR(10) PRIMARY KEY,
    Sport VARCHAR(100) NOT NULL,
    Event VARCHAR(150) NOT NULL);
		Drop Table Fact_Olympics_Results CASCADE;
		CREATE TABLE Fact_Olympics_Results (
    ID INT PRIMARY KEY,
    EventID VARCHAR(10) NOT NULL,
    Year INT NOT NULL,
    Medal VARCHAR(20),
    NOC CHAR(3) NOT NULL,
    FOREIGN KEY (EventID) REFERENCES Dim_Event(EventID),
    FOREIGN KEY (NOC) REFERENCES Dim_Country(NOC));
	TRUNCATE TABLE Fact_Olympics_Results CASCADE;
	Drop Table Fact_Olympics_Results CASCADE;
	CREATE TABLE Fact_Olympics_Results (
    ID INT,
    EventID VARCHAR(10) NOT NULL,
    Year INT NOT NULL,
    Medal VARCHAR(20),
    NOC CHAR(3) NOT NULL,
    FOREIGN KEY(EventID) REFERENCES Dim_Event(EventID),
    FOREIGN KEY(NOC) REFERENCES Dim_Country(NOC)
);
ALTER TABLE Fact_Olympics_Results
DROP CONSTRAINT fact_olympics_results_eventid_fkey;
ALTER TABLE Fact_Olympics_Results
ADD CONSTRAINT fk_fact_event 
FOREIGN KEY (EventID) REFERENCES Dim_Event(EventID);

ALTER TABLE Fact_Olympics_Results
ADD CONSTRAINT fk_fact_country 
FOREIGN KEY (NOC) REFERENCES Dim_Country(NOC);
ALTER TABLE Fact_Olympics_Results
ADD CONSTRAINT fk_fact_event 
FOREIGN KEY (EventID) REFERENCES Dim_Event(EventID);

ALTER TABLE Fact_Olympics_Results
ADD CONSTRAINT fk_fact_country 
FOREIGN KEY (NOC) REFERENCES Dim_Country(NOC);

select count (*) from dim_event